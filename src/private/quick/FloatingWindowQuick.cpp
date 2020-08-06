/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2020 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#include "FloatingWindowQuick_p.h"
#include "MainWindowBase.h"
#include "Logging_p.h"
#include "Utils_p.h"
#include "DropArea_p.h"
#include "TitleBar_p.h"
#include "Config.h"

#include <QQuickView>
#include <QDebug>

using namespace KDDockWidgets;


FloatingWindowQuick::FloatingWindowQuick(MainWindowBase *parent)
    : FloatingWindow(parent)
    , m_quickWindow(new QQuickView(Config::self().qmlEngine(), nullptr))
{
    init();
}

FloatingWindowQuick::FloatingWindowQuick(Frame *frame, MainWindowBase *parent)
    : FloatingWindow(frame, parent)
    , m_quickWindow(new QQuickView(Config::self().qmlEngine(), nullptr))
{
    init();
}

FloatingWindowQuick::~FloatingWindowQuick()
{
    m_quickWindow->deleteLater();
}

QWindow *FloatingWindowQuick::candidateParentWindow() const
{
    if (auto mainWindow = qobject_cast<MainWindowBase*>(QObject::parent())) {
        return mainWindow->QQuickItem::window();
    }

    return nullptr;
}

void FloatingWindowQuick::init()
{
    connect(this, &QQuickItem::visibleChanged, this, [this] {
        if (!isVisible() && !beingDeleted()) {
            scheduleDeleteLater();
        }
    });

    m_quickWindow->setResizeMode(QQuickView::SizeViewToRootObject);

    m_quickWindow->setTransientParent(candidateParentWindow());

    QWidgetAdapter::setParent(m_quickWindow->contentItem());
    QWidgetAdapter::makeItemFillParent(this);

    QQuickItem *visualItem = createItem(Config::self().qmlEngine(), QStringLiteral("qrc:/kddockwidgets/private/quick/qml/FloatingWindow.qml"));
    Q_ASSERT(visualItem);
    visualItem->setParent(this);
    visualItem->setParentItem(this);

    m_quickWindow->setFlags(windowFlags());
    m_quickWindow->show();
    m_quickWindow->setGeometry(200, 200, 800, 800);  // TODO: remove
}
