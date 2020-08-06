/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2020 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

import QtQuick 2.9
import QtQuick.Controls 2.9
import QtQuick.Layouts 1.9 

Rectangle {
    id: root
    property QtObject frameCpp
    readonly property QtObject titleBarCpp: frameCpp ? frameCpp.titleBar : null

    color: "cyan"
    anchors.fill: parent

    onFrameCppChanged: {
        if (frameCpp)
            frameCpp.setStackLayout(stackLayout);
    }

    TitleBar {
        id: titleBar
        height: 30
        titleBarCpp: root.titleBarCpp
        visible: titleBarCpp && titleBarCpp.visible
        anchors {
            top:  parent ? parent.top : undefined
            left: parent ? parent.left : undefined
            right: parent ? parent.right : undefined
        }
    }

    TabBar {
        id: tabbar
        visible: count > 1
        anchors {
            left: parent ? parent.left : undefined
            right: parent ? parent.right : undefined
            top: (titleBar && titleBar.visible) ? titleBar.bottom
                                                : (parent ? parent.top : undefined)
        }

        width: parent.width

        Repeater {
            model: root.frameCpp ? root.frameCpp.dockWidgetModel : 0
            TabButton {
                text: title
            }
        }
    }

    StackLayout {
        id: stackLayout
        anchors {
            left: parent ? parent.left : undefined
            right: parent ? parent.right : undefined
            top: (parent && tabbar.visible) ? tabbar.bottom : ((titleBar && titleBar.visible) ? titleBar.bottom
                                                                                              : parent ? parent.top : undefined)
            bottom: parent ? parent.bottom : undefined
        }

        currentIndex: tabbar.currentIndex
    }
}
