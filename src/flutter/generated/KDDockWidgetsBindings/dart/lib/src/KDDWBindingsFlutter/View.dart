/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import '../TypeHelpers.dart';
import '../../Bindings.dart';
import '../../Bindings_KDDWBindingsCore.dart' as KDDWBindingsCore;
import '../../Bindings_KDDWBindingsFlutter.dart' as KDDWBindingsFlutter;
import '../../LibraryLoader.dart';

var _dylib = Library.instance().dylib;

class View extends KDDWBindingsCore.View {
  View.fromCppPointer(var cppPointer, [var needsAutoDelete = false])
      : super.fromCppPointer(cppPointer, needsAutoDelete) {}
  View.init() : super.init() {}
  factory View.fromCache(var cppPointer, [needsAutoDelete = false]) {
    if (KDDWBindingsCore.View.isCached(cppPointer)) {
      var instance =
          KDDWBindingsCore.View.s_dartInstanceByCppPtr[cppPointer.address];
      if (instance != null) return instance as View;
    }
    return View.fromCppPointer(cppPointer, needsAutoDelete);
  }
  String getFinalizerName() {
    return "c_KDDockWidgets__flutter__View_Finalizer";
  } //View(KDDockWidgets::Core::Controller * controller, KDDockWidgets::Core::ViewType type, KDDockWidgets::Core::View * arg__3, Qt::WindowFlags windowFlags)

  View(KDDWBindingsCore.Controller? controller, int type,
      KDDWBindingsCore.View? arg__3,
      {int windowFlags = 0})
      : super.init() {
    final voidstar_Func_voidstar_int_voidstar_int func = _dylib
        .lookup<
                ffi.NativeFunction<
                    voidstar_Func_voidstar_ffi_Int32_voidstar_ffi_Int32_FFI>>(
            'c_KDDockWidgets__flutter__View__constructor_Controller_ViewType_View_WindowFlags')
        .asFunction();
    thisCpp = func(controller == null ? ffi.nullptr : controller.thisCpp, type,
        arg__3 == null ? ffi.nullptr : arg__3.thisCpp, windowFlags);
    KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] = this;
    registerCallbacks();
  }
  static void activateWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::activateWindow()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.activateWindow();
  }

  static int close_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print("Dart instance not found for View::close()! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.close();
    return result ? 1 : 0;
  }

  static void createPlatformWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::createPlatformWindow()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.createPlatformWindow();
  }

  static int flags_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::flags() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.flags();
    return result;
  }

  static ffi.Pointer<void> geometry_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::geometry() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.geometry();
    return result.thisCpp;
  }

  static void grabMouse_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::grabMouse()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.grabMouse();
  }

  static int hasFocus_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::hasFocus() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.hasFocus();
    return result ? 1 : 0;
  }

  static void hide_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print("Dart instance not found for View::hide()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.hide();
  }

  static void init_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print("Dart instance not found for View::init()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.init();
  }

  static int isActiveWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isActiveWindow() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isActiveWindow();
    return result ? 1 : 0;
  }

  static int isExplicitlyHidden_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isExplicitlyHidden() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isExplicitlyHidden();
    return result ? 1 : 0;
  }

  static int isMaximized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isMaximized() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMaximized();
    return result ? 1 : 0;
  }

  static int isMinimized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isMinimized() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMinimized();
    return result ? 1 : 0;
  } // isMounted() const

  bool isMounted() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(456))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int isMounted_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isMounted() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMounted();
    return result ? 1 : 0;
  }

  static int isNull_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isNull() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isNull();
    return result ? 1 : 0;
  }

  static int isRootView_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isRootView() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isRootView();
    return result ? 1 : 0;
  }

  static int isVisible_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isVisible() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isVisible();
    return result ? 1 : 0;
  }

  static ffi.Pointer<void> mapFromGlobal_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> globalPt) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::mapFromGlobal(KDDockWidgets::Point globalPt) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapFromGlobal(Point.fromCppPointer(globalPt));
    return result.thisCpp;
  }

  static ffi.Pointer<void> mapTo_calledFromC(ffi.Pointer<void> thisCpp,
      ffi.Pointer<void>? parent, ffi.Pointer<void> pos) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::mapTo(KDDockWidgets::Core::View * parent, KDDockWidgets::Point pos) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapTo(
        (parent == null || parent.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(parent),
        Point.fromCppPointer(pos));
    return result.thisCpp;
  }

  static ffi.Pointer<void> mapToGlobal_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> localPt) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::mapToGlobal(KDDockWidgets::Point localPt) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapToGlobal(Point.fromCppPointer(localPt));
    return result.thisCpp;
  }

  static ffi.Pointer<void> maxSizeHint_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::maxSizeHint() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.maxSizeHint();
    return result.thisCpp;
  }

  static ffi.Pointer<void> minSize_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::minSize() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.minSize();
    return result.thisCpp;
  }

  static void move_2_calledFromC(ffi.Pointer<void> thisCpp, int x, int y) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::move(int x, int y)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.move_2(x, y);
  }

  static ffi.Pointer<void> normalGeometry_calledFromC(
      ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::normalGeometry() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.normalGeometry();
    return result.thisCpp;
  } // onChildAdded(KDDockWidgets::Core::View * childView)

  onChildAdded(KDDWBindingsCore.View? childView) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(459))
        .asFunction();
    func(thisCpp, childView == null ? ffi.nullptr : childView.thisCpp);
  }

  static void onChildAdded_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::onChildAdded(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildAdded((childView == null || childView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(childView));
  } // onChildRemoved(KDDockWidgets::Core::View * childView)

  onChildRemoved(KDDWBindingsCore.View? childView) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(460))
        .asFunction();
    func(thisCpp, childView == null ? ffi.nullptr : childView.thisCpp);
  }

  static void onChildRemoved_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::onChildRemoved(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildRemoved((childView == null || childView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(childView));
  } // onChildVisibilityChanged(KDDockWidgets::Core::View * childView)

  onChildVisibilityChanged(KDDWBindingsCore.View? childView) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(461))
        .asFunction();
    func(thisCpp, childView == null ? ffi.nullptr : childView.thisCpp);
  }

  static void onChildVisibilityChanged_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::onChildVisibilityChanged(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildVisibilityChanged(
        (childView == null || childView.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(childView));
  } // onFlutterWidgetResized(int w, int h)

  bool onFlutterWidgetResized(int w, int h) {
    final bool_Func_voidstar_int_int func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_ffi_Int32_ffi_Int32_FFI>>(
            'c_KDDockWidgets__flutter__View__onFlutterWidgetResized_int_int')
        .asFunction();
    return func(thisCpp, w, h) != 0;
  } // onGeometryChanged()

  onGeometryChanged() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(463))
        .asFunction();
    func(thisCpp);
  }

  static void onGeometryChanged_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::onGeometryChanged()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onGeometryChanged();
  } // onMouseEvent(KDDockWidgets::Event::Type eventType, KDDockWidgets::Point localPos, KDDockWidgets::Point globalPos, bool leftIsPressed)

  onMouseEvent(
      int eventType, Point localPos, Point globalPos, bool leftIsPressed) {
    final void_Func_voidstar_int_voidstar_voidstar_bool func = _dylib
        .lookup<
                ffi.NativeFunction<
                    void_Func_voidstar_ffi_Int32_voidstar_voidstar_ffi_Int8_FFI>>(
            'c_KDDockWidgets__flutter__View__onMouseEvent_Type_Point_Point_bool')
        .asFunction();
    func(
        thisCpp,
        eventType,
        localPos == null ? ffi.nullptr : localPos.thisCpp,
        globalPos == null ? ffi.nullptr : globalPos.thisCpp,
        leftIsPressed ? 1 : 0);
  } // onRebuildRequested()

  onRebuildRequested() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(465))
        .asFunction();
    func(thisCpp);
  }

  static void onRebuildRequested_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::onRebuildRequested()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onRebuildRequested();
  }

  static int onResize_2_calledFromC(ffi.Pointer<void> thisCpp, int h, int w) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::onResize(int h, int w)! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.onResize_2(h, w);
    return result ? 1 : 0;
  }

  static void raise_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print("Dart instance not found for View::raise()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raise();
  }

  static void raiseAndActivate_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::raiseAndActivate()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raiseAndActivate();
  } // raiseChild(KDDockWidgets::Core::View * childView)

  raiseChild(KDDWBindingsCore.View? childView) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(468))
        .asFunction();
    func(thisCpp, childView == null ? ffi.nullptr : childView.thisCpp);
  }

  static void raiseChild_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::raiseChild(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raiseChild((childView == null || childView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(childView));
  } // raiseWindow(KDDockWidgets::Core::View * rootView)

  raiseWindow(KDDWBindingsCore.View? rootView) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(469))
        .asFunction();
    func(thisCpp, rootView == null ? ffi.nullptr : rootView.thisCpp);
  }

  static void raiseWindow_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? rootView) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::raiseWindow(KDDockWidgets::Core::View * rootView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raiseWindow((rootView == null || rootView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(rootView));
  }

  static void releaseKeyboard_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::releaseKeyboard()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.releaseKeyboard();
  }

  static void releaseMouse_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::releaseMouse()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.releaseMouse();
  }

  static void setCursor_calledFromC(ffi.Pointer<void> thisCpp, int shape) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setCursor(Qt::CursorShape shape)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setCursor(shape);
  }

  static void setFixedHeight_calledFromC(ffi.Pointer<void> thisCpp, int h) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setFixedHeight(int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setFixedHeight(h);
  }

  static void setFixedWidth_calledFromC(ffi.Pointer<void> thisCpp, int w) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setFixedWidth(int w)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setFixedWidth(w);
  }

  static void setGeometry_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> geometry) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setGeometry(KDDockWidgets::Rect geometry)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setGeometry(Rect.fromCppPointer(geometry));
  }

  static void setHeight_calledFromC(ffi.Pointer<void> thisCpp, int h) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setHeight(int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setHeight(h);
  }

  static void setMaximumSize_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> sz) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setMaximumSize(KDDockWidgets::Size sz)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMaximumSize(Size.fromCppPointer(sz));
  }

  static void setMinimumSize_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> sz) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setMinimumSize(KDDockWidgets::Size sz)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMinimumSize(Size.fromCppPointer(sz));
  }

  static void setMouseTracking_calledFromC(
      ffi.Pointer<void> thisCpp, int enable) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setMouseTracking(bool enable)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMouseTracking(enable != 0);
  } // setNormalGeometry(KDDockWidgets::Rect geo)

  setNormalGeometry(Rect geo) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__View__setNormalGeometry_Rect')
        .asFunction();
    func(thisCpp, geo == null ? ffi.nullptr : geo.thisCpp);
  }

  static void setParent_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? parent) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setParent(KDDockWidgets::Core::View * parent)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setParent((parent == null || parent.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(parent));
  }

  static void setSize_2_calledFromC(ffi.Pointer<void> thisCpp, int w, int h) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setSize(int w, int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setSize_2(w, h);
  }

  static void setViewName_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? name) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setViewName(const QString & name)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setViewName(QString.fromCppPointer(name).toDartString());
  }

  static void setVisible_calledFromC(ffi.Pointer<void> thisCpp, int visible) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setVisible(bool visible)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setVisible(visible != 0);
  }

  static void setWidth_calledFromC(ffi.Pointer<void> thisCpp, int w) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setWidth(int w)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWidth(w);
  }

  static void setWindowOpacity_calledFromC(
      ffi.Pointer<void> thisCpp, double v) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setWindowOpacity(double v)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWindowOpacity(v);
  }

  static void setWindowTitle_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? title) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setWindowTitle(const QString & title)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWindowTitle(QString.fromCppPointer(title).toDartString());
  }

  static void setZOrder_calledFromC(ffi.Pointer<void> thisCpp, int z) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setZOrder(int z)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setZOrder(z);
  }

  static void show_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print("Dart instance not found for View::show()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.show();
  }

  static void showMaximized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::showMaximized()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showMaximized();
  }

  static void showMinimized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::showMinimized()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showMinimized();
  }

  static void showNormal_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::showNormal()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showNormal();
  }

  static void update_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print("Dart instance not found for View::update()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.update();
  } // updateGeometry()

  updateGeometry() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__View__updateGeometry')
        .asFunction();
    func(thisCpp);
  }

  static ffi.Pointer<void> viewName_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::viewName() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.viewName();
    return result.thisCpp;
  }

  static int zOrder_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance =
        KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] as View;
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::zOrder() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.zOrder();
    return result;
  }

  void release() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__View__destructor')
        .asFunction();
    func(thisCpp);
  }

  String cFunctionSymbolName(int methodId) {
    switch (methodId) {
      case 348:
        return "c_KDDockWidgets__flutter__View__activateWindow";
      case 358:
        return "c_KDDockWidgets__flutter__View__close";
      case 360:
        return "c_KDDockWidgets__flutter__View__createPlatformWindow";
      case 366:
        return "c_KDDockWidgets__flutter__View__flags";
      case 367:
        return "c_KDDockWidgets__flutter__View__geometry";
      case 368:
        return "c_KDDockWidgets__flutter__View__grabMouse";
      case 371:
        return "c_KDDockWidgets__flutter__View__hasFocus";
      case 373:
        return "c_KDDockWidgets__flutter__View__hide";
      case 375:
        return "c_KDDockWidgets__flutter__View__init";
      case 377:
        return "c_KDDockWidgets__flutter__View__isActiveWindow";
      case 378:
        return "c_KDDockWidgets__flutter__View__isExplicitlyHidden";
      case 381:
        return "c_KDDockWidgets__flutter__View__isMaximized";
      case 382:
        return "c_KDDockWidgets__flutter__View__isMinimized";
      case 456:
        return "c_KDDockWidgets__flutter__View__isMounted";
      case 383:
        return "c_KDDockWidgets__flutter__View__isNull";
      case 384:
        return "c_KDDockWidgets__flutter__View__isRootView";
      case 385:
        return "c_KDDockWidgets__flutter__View__isVisible";
      case 386:
        return "c_KDDockWidgets__flutter__View__mapFromGlobal_Point";
      case 387:
        return "c_KDDockWidgets__flutter__View__mapTo_View_Point";
      case 388:
        return "c_KDDockWidgets__flutter__View__mapToGlobal_Point";
      case 389:
        return "c_KDDockWidgets__flutter__View__maxSizeHint";
      case 390:
        return "c_KDDockWidgets__flutter__View__minSize";
      case 394:
        return "c_KDDockWidgets__flutter__View__move_int_int";
      case 395:
        return "c_KDDockWidgets__flutter__View__normalGeometry";
      case 459:
        return "c_KDDockWidgets__flutter__View__onChildAdded_View";
      case 460:
        return "c_KDDockWidgets__flutter__View__onChildRemoved_View";
      case 461:
        return "c_KDDockWidgets__flutter__View__onChildVisibilityChanged_View";
      case 463:
        return "c_KDDockWidgets__flutter__View__onGeometryChanged";
      case 465:
        return "c_KDDockWidgets__flutter__View__onRebuildRequested";
      case 397:
        return "c_KDDockWidgets__flutter__View__onResize_int_int";
      case 399:
        return "c_KDDockWidgets__flutter__View__raise";
      case 400:
        return "c_KDDockWidgets__flutter__View__raiseAndActivate";
      case 468:
        return "c_KDDockWidgets__flutter__View__raiseChild_View";
      case 469:
        return "c_KDDockWidgets__flutter__View__raiseWindow_View";
      case 402:
        return "c_KDDockWidgets__flutter__View__releaseKeyboard";
      case 403:
        return "c_KDDockWidgets__flutter__View__releaseMouse";
      case 407:
        return "c_KDDockWidgets__flutter__View__setCursor_CursorShape";
      case 408:
        return "c_KDDockWidgets__flutter__View__setFixedHeight_int";
      case 409:
        return "c_KDDockWidgets__flutter__View__setFixedWidth_int";
      case 410:
        return "c_KDDockWidgets__flutter__View__setGeometry_Rect";
      case 411:
        return "c_KDDockWidgets__flutter__View__setHeight_int";
      case 412:
        return "c_KDDockWidgets__flutter__View__setMaximumSize_Size";
      case 413:
        return "c_KDDockWidgets__flutter__View__setMinimumSize_Size";
      case 414:
        return "c_KDDockWidgets__flutter__View__setMouseTracking_bool";
      case 415:
        return "c_KDDockWidgets__flutter__View__setParent_View";
      case 417:
        return "c_KDDockWidgets__flutter__View__setSize_int_int";
      case 418:
        return "c_KDDockWidgets__flutter__View__setViewName_QString";
      case 419:
        return "c_KDDockWidgets__flutter__View__setVisible_bool";
      case 420:
        return "c_KDDockWidgets__flutter__View__setWidth_int";
      case 421:
        return "c_KDDockWidgets__flutter__View__setWindowOpacity_double";
      case 422:
        return "c_KDDockWidgets__flutter__View__setWindowTitle_QString";
      case 423:
        return "c_KDDockWidgets__flutter__View__setZOrder_int";
      case 424:
        return "c_KDDockWidgets__flutter__View__show";
      case 425:
        return "c_KDDockWidgets__flutter__View__showMaximized";
      case 426:
        return "c_KDDockWidgets__flutter__View__showMinimized";
      case 427:
        return "c_KDDockWidgets__flutter__View__showNormal";
      case 429:
        return "c_KDDockWidgets__flutter__View__update";
      case 430:
        return "c_KDDockWidgets__flutter__View__viewName";
      case 434:
        return "c_KDDockWidgets__flutter__View__zOrder";
    }
    return super.cFunctionSymbolName(methodId);
  }

  static String methodNameFromId(int methodId) {
    switch (methodId) {
      case 348:
        return "activateWindow";
      case 358:
        return "close";
      case 360:
        return "createPlatformWindow";
      case 366:
        return "flags";
      case 367:
        return "geometry";
      case 368:
        return "grabMouse";
      case 371:
        return "hasFocus";
      case 373:
        return "hide";
      case 375:
        return "init";
      case 377:
        return "isActiveWindow";
      case 378:
        return "isExplicitlyHidden";
      case 381:
        return "isMaximized";
      case 382:
        return "isMinimized";
      case 456:
        return "isMounted";
      case 383:
        return "isNull";
      case 384:
        return "isRootView";
      case 385:
        return "isVisible";
      case 386:
        return "mapFromGlobal";
      case 387:
        return "mapTo";
      case 388:
        return "mapToGlobal";
      case 389:
        return "maxSizeHint";
      case 390:
        return "minSize";
      case 394:
        return "move_2";
      case 395:
        return "normalGeometry";
      case 459:
        return "onChildAdded";
      case 460:
        return "onChildRemoved";
      case 461:
        return "onChildVisibilityChanged";
      case 463:
        return "onGeometryChanged";
      case 465:
        return "onRebuildRequested";
      case 397:
        return "onResize_2";
      case 399:
        return "raise";
      case 400:
        return "raiseAndActivate";
      case 468:
        return "raiseChild";
      case 469:
        return "raiseWindow";
      case 402:
        return "releaseKeyboard";
      case 403:
        return "releaseMouse";
      case 407:
        return "setCursor";
      case 408:
        return "setFixedHeight";
      case 409:
        return "setFixedWidth";
      case 410:
        return "setGeometry";
      case 411:
        return "setHeight";
      case 412:
        return "setMaximumSize";
      case 413:
        return "setMinimumSize";
      case 414:
        return "setMouseTracking";
      case 415:
        return "setParent";
      case 417:
        return "setSize_2";
      case 418:
        return "setViewName";
      case 419:
        return "setVisible";
      case 420:
        return "setWidth";
      case 421:
        return "setWindowOpacity";
      case 422:
        return "setWindowTitle";
      case 423:
        return "setZOrder";
      case 424:
        return "show";
      case 425:
        return "showMaximized";
      case 426:
        return "showMinimized";
      case 427:
        return "showNormal";
      case 429:
        return "update";
      case 430:
        return "viewName";
      case 434:
        return "zOrder";
    }
    throw Error();
  }

  void registerCallbacks() {
    assert(thisCpp != null);
    final RegisterMethodIsReimplementedCallback registerCallback = _dylib
        .lookup<ffi.NativeFunction<RegisterMethodIsReimplementedCallback_FFI>>(
            'c_KDDockWidgets__flutter__View__registerVirtualMethodCallback')
        .asFunction();
    final callback348 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.activateWindow_calledFromC);
    registerCallback(thisCpp, callback348, 348);
    const callbackExcept358 = 0;
    final callback358 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.close_calledFromC, callbackExcept358);
    registerCallback(thisCpp, callback358, 358);
    final callback360 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsCore.View.createPlatformWindow_calledFromC);
    registerCallback(thisCpp, callback360, 360);
    const callbackExcept366 = 0;
    final callback366 = ffi.Pointer.fromFunction<int_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.flags_calledFromC, callbackExcept366);
    registerCallback(thisCpp, callback366, 366);
    final callback367 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.geometry_calledFromC);
    registerCallback(thisCpp, callback367, 367);
    final callback368 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.grabMouse_calledFromC);
    registerCallback(thisCpp, callback368, 368);
    const callbackExcept371 = 0;
    final callback371 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.hasFocus_calledFromC, callbackExcept371);
    registerCallback(thisCpp, callback371, 371);
    final callback373 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.hide_calledFromC);
    registerCallback(thisCpp, callback373, 373);
    final callback375 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsCore.View.init_calledFromC);
    registerCallback(thisCpp, callback375, 375);
    const callbackExcept377 = 0;
    final callback377 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isActiveWindow_calledFromC, callbackExcept377);
    registerCallback(thisCpp, callback377, 377);
    const callbackExcept378 = 0;
    final callback378 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isExplicitlyHidden_calledFromC,
        callbackExcept378);
    registerCallback(thisCpp, callback378, 378);
    const callbackExcept381 = 0;
    final callback381 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isMaximized_calledFromC, callbackExcept381);
    registerCallback(thisCpp, callback381, 381);
    const callbackExcept382 = 0;
    final callback382 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isMinimized_calledFromC, callbackExcept382);
    registerCallback(thisCpp, callback382, 382);
    const callbackExcept456 = 0;
    final callback456 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isMounted_calledFromC, callbackExcept456);
    registerCallback(thisCpp, callback456, 456);
    const callbackExcept383 = 0;
    final callback383 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsCore.View.isNull_calledFromC, callbackExcept383);
    registerCallback(thisCpp, callback383, 383);
    const callbackExcept384 = 0;
    final callback384 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isRootView_calledFromC, callbackExcept384);
    registerCallback(thisCpp, callback384, 384);
    const callbackExcept385 = 0;
    final callback385 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isVisible_calledFromC, callbackExcept385);
    registerCallback(thisCpp, callback385, 385);
    final callback386 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapFromGlobal_calledFromC);
    registerCallback(thisCpp, callback386, 386);
    final callback387 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapTo_calledFromC);
    registerCallback(thisCpp, callback387, 387);
    final callback388 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapToGlobal_calledFromC);
    registerCallback(thisCpp, callback388, 388);
    final callback389 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.maxSizeHint_calledFromC);
    registerCallback(thisCpp, callback389, 389);
    final callback390 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.minSize_calledFromC);
    registerCallback(thisCpp, callback390, 390);
    final callback394 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.move_2_calledFromC);
    registerCallback(thisCpp, callback394, 394);
    final callback395 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.normalGeometry_calledFromC);
    registerCallback(thisCpp, callback395, 395);
    final callback459 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildAdded_calledFromC);
    registerCallback(thisCpp, callback459, 459);
    final callback460 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildRemoved_calledFromC);
    registerCallback(thisCpp, callback460, 460);
    final callback461 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildVisibilityChanged_calledFromC);
    registerCallback(thisCpp, callback461, 461);
    final callback463 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.onGeometryChanged_calledFromC);
    registerCallback(thisCpp, callback463, 463);
    final callback465 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.onRebuildRequested_calledFromC);
    registerCallback(thisCpp, callback465, 465);
    const callbackExcept397 = 0;
    final callback397 =
        ffi.Pointer.fromFunction<bool_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsCore.View.onResize_2_calledFromC, callbackExcept397);
    registerCallback(thisCpp, callback397, 397);
    final callback399 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.raise_calledFromC);
    registerCallback(thisCpp, callback399, 399);
    final callback400 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.raiseAndActivate_calledFromC);
    registerCallback(thisCpp, callback400, 400);
    final callback468 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.raiseChild_calledFromC);
    registerCallback(thisCpp, callback468, 468);
    final callback469 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.raiseWindow_calledFromC);
    registerCallback(thisCpp, callback469, 469);
    final callback402 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.releaseKeyboard_calledFromC);
    registerCallback(thisCpp, callback402, 402);
    final callback403 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.releaseMouse_calledFromC);
    registerCallback(thisCpp, callback403, 403);
    final callback407 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setCursor_calledFromC);
    registerCallback(thisCpp, callback407, 407);
    final callback408 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setFixedHeight_calledFromC);
    registerCallback(thisCpp, callback408, 408);
    final callback409 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setFixedWidth_calledFromC);
    registerCallback(thisCpp, callback409, 409);
    final callback410 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setGeometry_calledFromC);
    registerCallback(thisCpp, callback410, 410);
    final callback411 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setHeight_calledFromC);
    registerCallback(thisCpp, callback411, 411);
    final callback412 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setMaximumSize_calledFromC);
    registerCallback(thisCpp, callback412, 412);
    final callback413 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setMinimumSize_calledFromC);
    registerCallback(thisCpp, callback413, 413);
    final callback414 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int8_FFI>(
            KDDWBindingsFlutter.View.setMouseTracking_calledFromC);
    registerCallback(thisCpp, callback414, 414);
    final callback415 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setParent_calledFromC);
    registerCallback(thisCpp, callback415, 415);
    final callback417 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setSize_2_calledFromC);
    registerCallback(thisCpp, callback417, 417);
    final callback418 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setViewName_calledFromC);
    registerCallback(thisCpp, callback418, 418);
    final callback419 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int8_FFI>(
            KDDWBindingsFlutter.View.setVisible_calledFromC);
    registerCallback(thisCpp, callback419, 419);
    final callback420 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setWidth_calledFromC);
    registerCallback(thisCpp, callback420, 420);
    final callback421 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Double_FFI>(
            KDDWBindingsFlutter.View.setWindowOpacity_calledFromC);
    registerCallback(thisCpp, callback421, 421);
    final callback422 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setWindowTitle_calledFromC);
    registerCallback(thisCpp, callback422, 422);
    final callback423 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setZOrder_calledFromC);
    registerCallback(thisCpp, callback423, 423);
    final callback424 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.show_calledFromC);
    registerCallback(thisCpp, callback424, 424);
    final callback425 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showMaximized_calledFromC);
    registerCallback(thisCpp, callback425, 425);
    final callback426 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showMinimized_calledFromC);
    registerCallback(thisCpp, callback426, 426);
    final callback427 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showNormal_calledFromC);
    registerCallback(thisCpp, callback427, 427);
    final callback429 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.update_calledFromC);
    registerCallback(thisCpp, callback429, 429);
    final callback430 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.viewName_calledFromC);
    registerCallback(thisCpp, callback430, 430);
    const callbackExcept434 = 0;
    final callback434 = ffi.Pointer.fromFunction<int_Func_voidstar_FFI>(
        KDDWBindingsCore.View.zOrder_calledFromC, callbackExcept434);
    registerCallback(thisCpp, callback434, 434);
  }
}
