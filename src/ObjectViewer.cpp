/*
  This file is part of KDDockWidgets.

  Copyright (C) 2018-2019 Klarälvdalens Datakonsult AB, a KDAB Group company, info@kdab.com
  Author: Sérgio Martins <sergio.martins@kdab.com>

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/**
 * @file
 * @brief Tree Widget to show the object tree. Used for debugging only, for apps that don't support GammaRay.
 *
 * @author Sérgio Martins \<sergio.martins@kdab.com\>
 */

#include "ObjectViewer_p.h"

#include <QStandardItem>
#include <QApplication>
#include <QHBoxLayout>
#include <QMenu>
#include <QContextMenuEvent>
#include <QItemSelectionModel>
#include <QPainter>
#include <QDebug>
#include <QMetaProperty>
#include <QWindow>
#include <QToolBar>
#include <QShortcut>

using namespace KDDockWidgets::Debug;

enum Role {
    ObjRole = Qt::UserRole
};


ObjectViewer::ObjectViewer(QWidget *parent)
    : QWidget(parent)
{
    resize(600, 600);

    auto lay = new QHBoxLayout(this);
    lay->addWidget(&m_treeView);
    m_treeView.setModel(&m_model);
    connect(m_treeView.selectionModel(), &QItemSelectionModel::selectionChanged,
            this, &ObjectViewer::onSelectionChanged);

    QAction *action = m_menu.addAction(QStringLiteral("Refresh"));
    connect(action, &QAction::triggered, this, &ObjectViewer::refresh);
    action = m_menu.addAction(QStringLiteral("Dump Windows"));
    connect(action, &QAction::triggered, this, &ObjectViewer::dumpWindows);

    refresh();
    setWindowTitle(QStringLiteral("ObjectViewer"));
}

void ObjectViewer::refresh()
{
    const auto hashCopy = m_itemMap;
    for (auto it = hashCopy.cbegin(), e = hashCopy.cend(); it != e; ++it)
        remove(it.key());

    m_model.clear();

    const auto &topLevelWidgets = qApp->topLevelWidgets();
    for (QWidget *window : topLevelWidgets) {
        add(window, m_model.invisibleRootItem());
    }
}

void ObjectViewer::dumpWindows()
{
    qDebug() << "Top Level QWidgets:";
    const auto &topLevelWidgets = qApp->topLevelWidgets();
    for (QWidget *w : topLevelWidgets) {
        if (qobject_cast<QMenu*>(w))
            continue;

        qDebug() << "    QWidget=" << w;
    }

    qDebug() << "Top Level Windows:";
    const auto &topLevelWindows = qApp->topLevelWindows();
    for (QWindow *w : topLevelWindows) {
        qDebug() << "    QWindow=" << w << "; parent=" << w->parent() << "; transientParent=" << w->transientParent() << "; hwnd=" << w->winId();
    }
}

QString ObjectViewer::nameForObj(QObject *o) const
{
    QString name = QString::fromLatin1(o->metaObject()->className());
    if (!o->objectName().isEmpty())
        name += QStringLiteral("(%1)").arg(o->objectName());
    return name;
}

void ObjectViewer::add(QObject *obj, QStandardItem *parent)
{
    if (obj == this || obj == &m_menu) // Ignore our stuff
        return;

    if (m_ignoreMenus && qobject_cast<QMenu*>(obj))
        return;

    if (m_ignoreShortcuts && qobject_cast<QShortcut*>(obj))
        return;

    if (m_ignoreToolBars && qobject_cast<QToolBar*>(obj))
        return;

    connect(obj, &QObject::destroyed, this, &ObjectViewer::remove);
    obj->installEventFilter(this);
    auto item = new QStandardItem(nameForObj(obj));
    item->setData(QVariant::fromValue(obj), ObjRole);
    m_itemMap.insert(obj, item);
    parent->appendRow(item);
    updateItemAppearence(item);

    for (auto child : obj->children())
        add(child, item);
}

void ObjectViewer::remove(QObject *obj)
{
    Q_ASSERT(obj);
    obj->removeEventFilter(this);
    m_itemMap.remove(obj);
}

void ObjectViewer::onSelectionChanged()
{
    QObject *o = selectedObject();
    if (m_selectedObject == o)
        return;

    if (m_selectedObject) {
        m_selectedObject->removeEventFilter(this);
        if (auto w = qobject_cast<QWidget*>(m_selectedObject))
            w->update();
    }

    m_selectedObject = o;

    if (m_selectedObject) {
        printProperties(o);
        m_selectedObject->installEventFilter(this);
        if (m_highlightsWidget) {
            if (auto w = qobject_cast<QWidget*>(o))
                w->update();
        }
    }
}

void ObjectViewer::printProperties(QObject *obj) const
{
    qDebug() << "Printing properties for" << obj;

    auto mo = obj->metaObject();
    const int count = mo->propertyCount();
    for (int i = 0; i < count; ++i) {
        QMetaProperty prop = mo->property(i);
        qDebug() << "    " << prop.name() << prop.read(obj);
    }

    if (auto w = qobject_cast<QWidget*>(obj)) {
        qDebug() << "Is a widget!";
        qDebug() << "Window=" << w->window();
    }
}

QObject *ObjectViewer::selectedObject() const
{
    auto indexes = m_treeView.selectionModel()->selectedIndexes();
    if (indexes.isEmpty())
        return nullptr;
    QModelIndex index = indexes.first();
    QObject *obj = index.data(ObjRole).value<QObject*>();
    return obj;
}

void ObjectViewer::updateItemAppearence(QStandardItem *item)
{
    Q_ASSERT(item);
    QWidget *widget = widgetForItem(item);
    if (!widget)
        return;

    item->setEnabled(widget->isVisible());
}

QObject *ObjectViewer::objectForItem(QStandardItem *item) const
{
    return item->data(ObjRole).value<QObject*>();;
}

QWidget *ObjectViewer::widgetForItem(QStandardItem *item) const
{
    return qobject_cast<QWidget*>(objectForItem(item));
}

void ObjectViewer::contextMenuEvent(QContextMenuEvent *ev)
{
    m_menu.exec(ev->globalPos());
}

bool ObjectViewer::eventFilter(QObject *watched, QEvent *event)
{
    auto widget = static_cast<QWidget*>(watched);
    if (event->type() == QEvent::Show || event->type() == QEvent::Hide) {
        updateItemAppearence(m_itemMap.value(watched));
        return false;
    }

    if (m_selectedObject != watched)
        return false;

    if (event->type() != QEvent::Paint || !m_highlightsWidget)
        return false;

    QPainter p(widget);
    p.fillRect(widget->rect(), QBrush(QColor(0, 0, 255, 128)));

    return true;
}
