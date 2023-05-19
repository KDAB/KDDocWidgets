/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

import 'dart:ffi' as ffi;
import 'package:KDDockWidgets/PositionedWidget.dart';
import 'package:KDDockWidgetsBindings/Bindings.dart' as KDDockWidgetBindings;
import 'package:KDDockWidgetsBindings/Bindings.dart';
import 'package:KDDockWidgetsBindings/Bindings_KDDWBindingsCore.dart'
    as KDDWBindingsCore;
import 'package:KDDockWidgetsBindings/Bindings_KDDWBindingsFlutter.dart'
    as KDDWBindingsFlutter;
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart' hide View;

class View_mixin {
  late final Widget flutterWidget;
  late final GlobalObjectKey<PositionedWidgetState> widgetKey;
  late final KDDWBindingsFlutter.View kddwView;

  Color m_color = Colors.red;
  int m_x = 100;
  int m_y = 100;
  int m_width = 400;
  int m_height = 400;
  bool m_fillsParent = false;
  String debugName = "";

  var childWidgets = <Widget>[];

  void initMixin(var kddwView, {var color = Colors.red, var debugName = ""}) {
    this.kddwView = kddwView;
    m_color = color;
    this.debugName = debugName;

    // The key is the C++ View pointer, which is stable and unique
    final ffi.Pointer<ffi.Void> ptr = kddwView.thisCpp.cast<ffi.Void>();
    widgetKey = GlobalObjectKey(ptr.address);

    flutterWidget = createFlutterWidget();
  }

  /// Casts to our flutter::View class
  KDDWBindingsFlutter.View asFlutterView() {
    return KDDWBindingsFlutter.View.fromCache(kddwView.thisCpp);
  }

  void onFlutterMouseEvent(PointerEvent event) {
    int eventType = -1;
    if (event is PointerDownEvent) eventType = Event_Type.MouseButtonPress;
    if (event is PointerUpEvent) eventType = Event_Type.MouseButtonRelease;
    if (event is PointerMoveEvent) eventType = Event_Type.MouseMove;

    if (eventType == -1) {
      print("Unhandled mouse event!");
      return;
    }

    final bool leftIsPressed = event.buttons == kPrimaryButton;
    final localPos = QPoint.ctor2(
        event.localPosition.dx.toInt(), event.localPosition.dy.toInt());
    final globalPos =
        QPoint.ctor2(event.position.dx.toInt(), event.position.dy.toInt());

    asFlutterView().onMouseEvent(eventType, localPos, globalPos, leftIsPressed);
  }

  setSize_2(int width, int height) {
    // print(
    //     "View_mixin::setSize called ${width}x${height} ; old=${m_width}x${height}");
    if (m_width != width || height != m_height) {
      m_width = width;
      m_height = height;

      final state = widgetKey.currentState;
      if (state != null) {
        state.updateSize();
      }
    }
  }

  void setWidth(int width) {
    setSize_2(width, m_height);
  }

  setHeight(int height) {
    setSize_2(m_width, height);
  }

  void setFixedWidth(int width) {
    // TODO
    setSize_2(width, m_height);
  }

  setFixedHeight(int height) {
    // TODO
    setSize_2(m_width, height);
  }

  void onChildAdded(KDDWBindingsCore.View? childView) {
    final state = widgetKey.currentState;

    final viewFlutter =
        KDDWBindingsFlutter.View.fromCache(childView!.thisCpp) as View_mixin;

    // print(
    //     "View_mixin::onChildAdded: this=${debugName}, child=${viewFlutter.debugName}, widget=${viewFlutter.flutterWidget}");

    childWidgets.add(viewFlutter.flutterWidget);

    if (state != null) {
      state.childrenChanged();
    }
  }

  void onChildRemoved(KDDWBindingsCore.View? childView) {
    final state = widgetKey.currentState;
    final viewFlutter =
        KDDWBindingsFlutter.View.fromCache(childView!.thisCpp) as View_mixin;
    childWidgets.remove(viewFlutter.flutterWidget);
    if (state != null) {
      state.childrenChanged();
    }
  }

  void onChildVisibilityChanged(KDDWBindingsCore.View? childView) {
    final state = widgetKey.currentState;
    if (state != null) {
      state.childrenChanged();
    }
  }

  List<Widget> visibleChildWidgets() {
    return childWidgets.where((w) {
      return !(w as PositionedWidget).kddwView.kddwView.isExplicitlyHidden();
    }).toList();
  }

  setGeometry(KDDockWidgetBindings.QRect geo) {
    // print("View_mixin: setGeometry .name=${debugName}");
    final sz = geo.size();
    final topLeft = geo.topLeft();
    setSize_2(sz.width(), sz.height());
    move_2(topLeft.x(), topLeft.y());
  }

  KDDockWidgetBindings.QRect geometry() {
    return KDDockWidgetBindings.QRect.ctor4(m_x, m_y, m_width, m_height);
  }

  KDDockWidgetBindings.QRect normalGeometry() {
    // TODO
    return geometry();
  }

  move_2(int x, int y) {
    // print("View_flutter::move called ${x},${y}");
    if (m_x != x || m_y != y) {
      m_x = x;
      m_y = y;
      final state = widgetKey.currentState;
      if (state != null) {
        state.updatePosition();
      }
    }
  }

  Widget createFlutterWidget() {
    return PositionedWidget(this, key: widgetKey);
  }
}
