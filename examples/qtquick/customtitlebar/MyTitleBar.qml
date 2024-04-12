/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2020 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sergio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

import QtQuick 2.6

// Will be moved to a plugin in the future, if there's enough demand
import "qrc:/kddockwidgets/qtquick/views/qml/" as KDDW

KDDW.TitleBarBase {
    id: root
    color:  "black"
    border.color: "orange"
    border.width: 2
    heightWhenVisible: 50

    Text {
        color: isFocused ? "cyan" : "orange"
        font.bold: isFocused
        text: root.title
        anchors {
            left: parent.left
            leftMargin: 10
            verticalCenter: root.verticalCenter
        }
    }

    Row {
        id: buttonRow
        spacing: 10

        height: root.height - 20
        anchors {
            right: root.right
            rightMargin: 10
            verticalCenter: root.verticalCenter
        }

        Rectangle {
            id: minimizeButton
            visible: root.minimizeButtonVisible
            radius: 5
            color: "red"
            height: parent.height
            width: height

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.minimizeButtonClicked();
                }
            }
        }

        Rectangle {
            id: closeButton
            enabled: root.closeButtonEnabled
            radius: 5
            color: isFocused ? "cyan" : "green"
            height: parent.height
            width: height

            Text {
                anchors.centerIn: parent
                text: "X"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.closeButtonClicked();
                }
            }
        }
    }
}
