/*
  This file is part of KDDockWidgets.

  Copyright (C) 2018 Sérgio Martins <sergio.martins@kdab.com>

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

#ifndef KD_WIDGET_RESIZE_HANDLER_H
#define KD_WIDGET_RESIZE_HANDLER_H

#include "WidgetResizeHandlerBase_p.h"
namespace KDDockWidgets {
class WidgetResizeHandler : public WidgetResizeHandlerBase
{
    Q_OBJECT
public:
    explicit WidgetResizeHandler(QWidget *target);
};
}

#endif
