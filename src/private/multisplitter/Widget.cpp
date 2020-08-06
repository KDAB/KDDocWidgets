/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2020 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#include "Widget.h"
#include "Item_p.h"

using namespace Layouting;

static qint64 s_nextFrameId = 1;

Widget::Widget(QObject *thisObj)
    : m_id(QString::number(s_nextFrameId++))
    , m_thisObj(thisObj)
{
}

Widget::~Widget()
{
}

QString Widget::id() const
{
    return m_id;
}

QSize Widget::boundedMaxSize(QSize min, QSize max)
{
    // Max should be bigger than min, but not bigger than the hardcoded max
    max = max.boundedTo(QSize(KDDOCKWIDGETS_MAX_WIDTH, KDDOCKWIDGETS_MAX_HEIGHT));

    // 0 interpreted as not having max
    if (max.width() <= 0)
        max.setWidth(KDDOCKWIDGETS_MAX_WIDTH);
    if (max.height() <= 0)
        max.setHeight(KDDOCKWIDGETS_MAX_HEIGHT);

    max = max.expandedTo(min);

    return max;
}
