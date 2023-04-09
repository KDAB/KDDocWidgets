/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/


#ifndef KD_FRAME_QUICK_P_H
#define KD_FRAME_QUICK_P_H
#pragma once

#include "View.h"
#include "kddockwidgets/views/GroupViewInterface.h"
#include "TitleBar.h"

QT_BEGIN_NAMESPACE
class QQuickItem;
QT_END_NAMESPACE

namespace KDDockWidgets {

namespace Core {
class Group;
class DockWidget;
}

namespace qtquick {

class TabBar;
class Stack;

class DOCKS_EXPORT Group : public Views::View_qtquick, public Views::GroupViewInterface
{
    Q_OBJECT
    Q_PROPERTY(QObject *tabBar READ tabBarObj CONSTANT)
    Q_PROPERTY(KDDockWidgets::qtquick::TitleBar *titleBar READ titleBar CONSTANT)
    Q_PROPERTY(int userType READ userType CONSTANT)
    Q_PROPERTY(KDDockWidgets::qtquick::TitleBar *actualTitleBar READ actualTitleBar NOTIFY
                   actualTitleBarChanged)
    Q_PROPERTY(int currentIndex READ currentIndex NOTIFY currentDockWidgetChanged)
    Q_PROPERTY(bool isMDI READ isMDI NOTIFY isMDIChanged)

public:
    explicit Group(Core::Group *controller, QQuickItem *parent = nullptr);
    ~Group() override;

    /// @reimp
    QSize minSize() const override;

    /// @brief Returns the QQuickItem which represents this group on the screen
    QQuickItem *visualItem() const override;

    int currentIndex() const;

    // QML interface:
    KDDockWidgets::qtquick::TitleBar *titleBar() const;
    KDDockWidgets::qtquick::TitleBar *actualTitleBar() const;
    int userType() const;
    QObject *tabBarObj() const;

protected:
    void removeDockWidget(Core::DockWidget *dw) override;
    void insertDockWidget(Core::DockWidget *dw, int index) override;

    Q_INVOKABLE void setStackLayout(QQuickItem *);

    int nonContentsHeight() const override;

Q_SIGNALS:
    void isMDIChanged();
    void currentDockWidgetChanged();
    void actualTitleBarChanged();

public Q_SLOTS:
    void updateConstriants();

private:
    void init() override;
    Stack *stackView() const;
    TabBar *tabBarView() const;

    QQuickItem *m_stackLayout = nullptr;
    QQuickItem *m_visualItem = nullptr;
};

}
}

#endif
