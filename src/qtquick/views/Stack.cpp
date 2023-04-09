/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#include "Stack.h"
#include "Config.h"
#include "kddockwidgets/core/ViewFactory.h"

#include "kddockwidgets/core/Stack.h"
#include "kddockwidgets/core/Group.h"
#include "kddockwidgets/core/TabBar.h"

using namespace KDDockWidgets;
using namespace KDDockWidgets::qtquick;

Stack::Stack(Core::Stack *controller, QQuickItem *parent)
    : Views::View_qtquick(controller, Core::Type::Stack, parent)
    , Views::StackViewInterface(controller)
{
}
