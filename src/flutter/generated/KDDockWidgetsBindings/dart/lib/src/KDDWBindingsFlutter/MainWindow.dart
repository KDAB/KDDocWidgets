/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
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

class MainWindow extends KDDWBindingsFlutter.View {
  MainWindow.fromCppPointer(var cppPointer, [var needsAutoDelete = false])
      : super.fromCppPointer(cppPointer, needsAutoDelete) {}
  MainWindow.init() : super.init() {}
  factory MainWindow.fromCache(var cppPointer, [needsAutoDelete = false]) {
    if (KDDWBindingsCore.View.isCached(cppPointer)) {
      var instance =
          KDDWBindingsCore.View.s_dartInstanceByCppPtr[cppPointer.address];
      if (instance != null) return instance as MainWindow;
    }
    return MainWindow.fromCppPointer(cppPointer, needsAutoDelete);
  } //MainWindow(const QString & uniqueName, QFlags<KDDockWidgets::MainWindowOption> options, KDDockWidgets::flutter::View * parent, Qt::WindowFlags flags)
  MainWindow(String? uniqueName,
      {int options = 0,
      required KDDWBindingsFlutter.View? parent,
      int flags = 0})
      : super.init() {
    final voidstar_Func_voidstar_int_voidstar_int func = _dylib
        .lookup<
                ffi.NativeFunction<
                    voidstar_Func_voidstar_ffi_Int32_voidstar_ffi_Int32_FFI>>(
            'c_KDDockWidgets__flutter__MainWindow__constructor_QString_MainWindowOptions_View_WindowFlags')
        .asFunction();
    thisCpp = func(uniqueName?.toNativeUtf8() ?? ffi.nullptr, options,
        parent == null ? ffi.nullptr : parent.thisCpp, flags);
    KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] = this;
    registerCallbacks();
  }
  static void activateWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::activateWindow()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.activateWindow();
  } // centerWidgetMargins() const

  Margins centerWidgetMargins() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            cFunctionSymbolName(841))
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return Margins.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> centerWidgetMargins_calledFromC(
      ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::centerWidgetMargins() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.centerWidgetMargins();
    return result.thisCpp;
  } // centralAreaGeometry() const

  Rect centralAreaGeometry() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            cFunctionSymbolName(842))
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return Rect.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> centralAreaGeometry_calledFromC(
      ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::centralAreaGeometry() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.centralAreaGeometry();
    return result.thisCpp;
  }

  static int close_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::close()! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.close();
    return result ? 1 : 0;
  }

  static void createPlatformWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::createPlatformWindow()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.createPlatformWindow();
  }

  static int flags_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::flags() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.flags();
    return result;
  }

  static ffi.Pointer<void> geometry_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::geometry() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.geometry();
    return result.thisCpp;
  }

  static void grabMouse_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::grabMouse()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.grabMouse();
  }

  static int hasFocus_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::hasFocus() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.hasFocus();
    return result ? 1 : 0;
  }

  static void hide_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::hide()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.hide();
  }

  static void init_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::init()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.init();
  }

  static int isActiveWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::isActiveWindow() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isActiveWindow();
    return result ? 1 : 0;
  }

  static int isExplicitlyHidden_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::isExplicitlyHidden() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isExplicitlyHidden();
    return result ? 1 : 0;
  }

  static int isMaximized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::isMaximized() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMaximized();
    return result ? 1 : 0;
  }

  static int isMinimized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::isMinimized() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMinimized();
    return result ? 1 : 0;
  }

  static int isMounted_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::isMounted() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMounted();
    return result ? 1 : 0;
  }

  static int isNull_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::isNull() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isNull();
    return result ? 1 : 0;
  }

  static int isRootView_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::isRootView() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isRootView();
    return result ? 1 : 0;
  }

  static int isVisible_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::isVisible() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isVisible();
    return result ? 1 : 0;
  }

  static ffi.Pointer<void> mapFromGlobal_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> globalPt) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::mapFromGlobal(KDDockWidgets::Point globalPt) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapFromGlobal(Point.fromCppPointer(globalPt));
    return result.thisCpp;
  }

  static ffi.Pointer<void> mapTo_calledFromC(ffi.Pointer<void> thisCpp,
      ffi.Pointer<void>? parent, ffi.Pointer<void> pos) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::mapTo(KDDockWidgets::Core::View * parent, KDDockWidgets::Point pos) const! (${thisCpp.address})");
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
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::mapToGlobal(KDDockWidgets::Point localPt) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapToGlobal(Point.fromCppPointer(localPt));
    return result.thisCpp;
  }

  static ffi.Pointer<void> maxSizeHint_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::maxSizeHint() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.maxSizeHint();
    return result.thisCpp;
  }

  static ffi.Pointer<void> minSize_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::minSize() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.minSize();
    return result.thisCpp;
  }

  static void move_2_calledFromC(ffi.Pointer<void> thisCpp, int x, int y) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::move(int x, int y)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.move_2(x, y);
  }

  static ffi.Pointer<void> normalGeometry_calledFromC(
      ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::normalGeometry() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.normalGeometry();
    return result.thisCpp;
  }

  static void onChildAdded_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::onChildAdded(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildAdded((childView == null || childView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(childView));
  }

  static void onChildRemoved_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::onChildRemoved(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildRemoved((childView == null || childView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(childView));
  }

  static void onChildVisibilityChanged_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::onChildVisibilityChanged(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildVisibilityChanged(
        (childView == null || childView.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(childView));
  }

  static void onGeometryChanged_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::onGeometryChanged()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onGeometryChanged();
  }

  static void onRebuildRequested_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::onRebuildRequested()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onRebuildRequested();
  }

  static int onResize_2_calledFromC(ffi.Pointer<void> thisCpp, int h, int w) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::onResize(int h, int w)! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.onResize_2(h, w);
    return result ? 1 : 0;
  }

  static void raise_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::raise()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raise();
  }

  static void raiseAndActivate_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::raiseAndActivate()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raiseAndActivate();
  }

  static void raiseChild_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::raiseChild(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raiseChild((childView == null || childView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(childView));
  }

  static void raiseWindow_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? rootView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::raiseWindow(KDDockWidgets::Core::View * rootView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raiseWindow((rootView == null || rootView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(rootView));
  }

  static void releaseKeyboard_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::releaseKeyboard()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.releaseKeyboard();
  }

  static void releaseMouse_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::releaseMouse()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.releaseMouse();
  } // setContentsMargins(int left, int top, int right, int bottom)

  setContentsMargins(int left, int top, int right, int bottom) {
    final void_Func_voidstar_int_int_int_int func = _dylib
        .lookup<
                ffi.NativeFunction<
                    void_Func_voidstar_ffi_Int32_ffi_Int32_ffi_Int32_ffi_Int32_FFI>>(
            cFunctionSymbolName(845))
        .asFunction();
    func(thisCpp, left, top, right, bottom);
  }

  static void setContentsMargins_calledFromC(
      ffi.Pointer<void> thisCpp, int left, int top, int right, int bottom) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setContentsMargins(int left, int top, int right, int bottom)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setContentsMargins(left, top, right, bottom);
  }

  static void setCursor_calledFromC(ffi.Pointer<void> thisCpp, int shape) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setCursor(Qt::CursorShape shape)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setCursor(shape);
  }

  static void setFixedHeight_calledFromC(ffi.Pointer<void> thisCpp, int h) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setFixedHeight(int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setFixedHeight(h);
  }

  static void setFixedWidth_calledFromC(ffi.Pointer<void> thisCpp, int w) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setFixedWidth(int w)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setFixedWidth(w);
  }

  static void setGeometry_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> geometry) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setGeometry(KDDockWidgets::Rect geometry)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setGeometry(Rect.fromCppPointer(geometry));
  }

  static void setHeight_calledFromC(ffi.Pointer<void> thisCpp, int h) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setHeight(int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setHeight(h);
  }

  static void setMaximumSize_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> sz) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setMaximumSize(KDDockWidgets::Size sz)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMaximumSize(Size.fromCppPointer(sz));
  }

  static void setMinimumSize_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> sz) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setMinimumSize(KDDockWidgets::Size sz)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMinimumSize(Size.fromCppPointer(sz));
  }

  static void setMouseTracking_calledFromC(
      ffi.Pointer<void> thisCpp, int enable) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setMouseTracking(bool enable)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMouseTracking(enable != 0);
  }

  static void setParent_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? parent) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setParent(KDDockWidgets::Core::View * parent)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setParent((parent == null || parent.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(parent));
  }

  static void setSize_2_calledFromC(ffi.Pointer<void> thisCpp, int w, int h) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setSize(int w, int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setSize_2(w, h);
  }

  static void setViewName_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? name) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setViewName(const QString & name)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setViewName(QString.fromCppPointer(name).toDartString());
  }

  static void setVisible_calledFromC(ffi.Pointer<void> thisCpp, int visible) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setVisible(bool visible)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setVisible(visible != 0);
  }

  static void setWidth_calledFromC(ffi.Pointer<void> thisCpp, int w) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setWidth(int w)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWidth(w);
  }

  static void setWindowOpacity_calledFromC(
      ffi.Pointer<void> thisCpp, double v) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setWindowOpacity(double v)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWindowOpacity(v);
  }

  static void setWindowTitle_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? title) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setWindowTitle(const QString & title)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWindowTitle(QString.fromCppPointer(title).toDartString());
  }

  static void setZOrder_calledFromC(ffi.Pointer<void> thisCpp, int z) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::setZOrder(int z)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setZOrder(z);
  }

  static void show_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::show()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.show();
  }

  static void showMaximized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::showMaximized()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showMaximized();
  }

  static void showMinimized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::showMinimized()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showMinimized();
  }

  static void showNormal_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::showNormal()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showNormal();
  }

  static void update_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::update()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.update();
  }

  static ffi.Pointer<void> viewName_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as MainWindow;
    if (dartInstance == null) {
      print(
          "Dart instance not found for MainWindow::viewName() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.viewName();
    return result.thisCpp;
  }

  void release() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__MainWindow__destructor')
        .asFunction();
    func(thisCpp);
  }

  String cFunctionSymbolName(int methodId) {
    switch (methodId) {
      case 687:
        return "c_KDDockWidgets__flutter__MainWindow__activateWindow";
      case 841:
        return "c_KDDockWidgets__flutter__MainWindow__centerWidgetMargins";
      case 842:
        return "c_KDDockWidgets__flutter__MainWindow__centralAreaGeometry";
      case 697:
        return "c_KDDockWidgets__flutter__MainWindow__close";
      case 699:
        return "c_KDDockWidgets__flutter__MainWindow__createPlatformWindow";
      case 705:
        return "c_KDDockWidgets__flutter__MainWindow__flags";
      case 706:
        return "c_KDDockWidgets__flutter__MainWindow__geometry";
      case 707:
        return "c_KDDockWidgets__flutter__MainWindow__grabMouse";
      case 710:
        return "c_KDDockWidgets__flutter__MainWindow__hasFocus";
      case 712:
        return "c_KDDockWidgets__flutter__MainWindow__hide";
      case 714:
        return "c_KDDockWidgets__flutter__MainWindow__init";
      case 716:
        return "c_KDDockWidgets__flutter__MainWindow__isActiveWindow";
      case 717:
        return "c_KDDockWidgets__flutter__MainWindow__isExplicitlyHidden";
      case 718:
        return "c_KDDockWidgets__flutter__MainWindow__isMaximized";
      case 719:
        return "c_KDDockWidgets__flutter__MainWindow__isMinimized";
      case 789:
        return "c_KDDockWidgets__flutter__MainWindow__isMounted";
      case 720:
        return "c_KDDockWidgets__flutter__MainWindow__isNull";
      case 721:
        return "c_KDDockWidgets__flutter__MainWindow__isRootView";
      case 722:
        return "c_KDDockWidgets__flutter__MainWindow__isVisible";
      case 723:
        return "c_KDDockWidgets__flutter__MainWindow__mapFromGlobal_Point";
      case 724:
        return "c_KDDockWidgets__flutter__MainWindow__mapTo_View_Point";
      case 725:
        return "c_KDDockWidgets__flutter__MainWindow__mapToGlobal_Point";
      case 726:
        return "c_KDDockWidgets__flutter__MainWindow__maxSizeHint";
      case 727:
        return "c_KDDockWidgets__flutter__MainWindow__minSize";
      case 731:
        return "c_KDDockWidgets__flutter__MainWindow__move_int_int";
      case 732:
        return "c_KDDockWidgets__flutter__MainWindow__normalGeometry";
      case 792:
        return "c_KDDockWidgets__flutter__MainWindow__onChildAdded_View";
      case 793:
        return "c_KDDockWidgets__flutter__MainWindow__onChildRemoved_View";
      case 794:
        return "c_KDDockWidgets__flutter__MainWindow__onChildVisibilityChanged_View";
      case 796:
        return "c_KDDockWidgets__flutter__MainWindow__onGeometryChanged";
      case 798:
        return "c_KDDockWidgets__flutter__MainWindow__onRebuildRequested";
      case 734:
        return "c_KDDockWidgets__flutter__MainWindow__onResize_int_int";
      case 736:
        return "c_KDDockWidgets__flutter__MainWindow__raise";
      case 737:
        return "c_KDDockWidgets__flutter__MainWindow__raiseAndActivate";
      case 801:
        return "c_KDDockWidgets__flutter__MainWindow__raiseChild_View";
      case 802:
        return "c_KDDockWidgets__flutter__MainWindow__raiseWindow_View";
      case 739:
        return "c_KDDockWidgets__flutter__MainWindow__releaseKeyboard";
      case 740:
        return "c_KDDockWidgets__flutter__MainWindow__releaseMouse";
      case 845:
        return "c_KDDockWidgets__flutter__MainWindow__setContentsMargins_int_int_int_int";
      case 743:
        return "c_KDDockWidgets__flutter__MainWindow__setCursor_CursorShape";
      case 744:
        return "c_KDDockWidgets__flutter__MainWindow__setFixedHeight_int";
      case 745:
        return "c_KDDockWidgets__flutter__MainWindow__setFixedWidth_int";
      case 746:
        return "c_KDDockWidgets__flutter__MainWindow__setGeometry_Rect";
      case 747:
        return "c_KDDockWidgets__flutter__MainWindow__setHeight_int";
      case 748:
        return "c_KDDockWidgets__flutter__MainWindow__setMaximumSize_Size";
      case 749:
        return "c_KDDockWidgets__flutter__MainWindow__setMinimumSize_Size";
      case 750:
        return "c_KDDockWidgets__flutter__MainWindow__setMouseTracking_bool";
      case 751:
        return "c_KDDockWidgets__flutter__MainWindow__setParent_View";
      case 753:
        return "c_KDDockWidgets__flutter__MainWindow__setSize_int_int";
      case 754:
        return "c_KDDockWidgets__flutter__MainWindow__setViewName_QString";
      case 755:
        return "c_KDDockWidgets__flutter__MainWindow__setVisible_bool";
      case 756:
        return "c_KDDockWidgets__flutter__MainWindow__setWidth_int";
      case 757:
        return "c_KDDockWidgets__flutter__MainWindow__setWindowOpacity_double";
      case 758:
        return "c_KDDockWidgets__flutter__MainWindow__setWindowTitle_QString";
      case 759:
        return "c_KDDockWidgets__flutter__MainWindow__setZOrder_int";
      case 760:
        return "c_KDDockWidgets__flutter__MainWindow__show";
      case 761:
        return "c_KDDockWidgets__flutter__MainWindow__showMaximized";
      case 762:
        return "c_KDDockWidgets__flutter__MainWindow__showMinimized";
      case 763:
        return "c_KDDockWidgets__flutter__MainWindow__showNormal";
      case 765:
        return "c_KDDockWidgets__flutter__MainWindow__update";
      case 766:
        return "c_KDDockWidgets__flutter__MainWindow__viewName";
    }
    return super.cFunctionSymbolName(methodId);
  }

  static String methodNameFromId(int methodId) {
    switch (methodId) {
      case 687:
        return "activateWindow";
      case 841:
        return "centerWidgetMargins";
      case 842:
        return "centralAreaGeometry";
      case 697:
        return "close";
      case 699:
        return "createPlatformWindow";
      case 705:
        return "flags";
      case 706:
        return "geometry";
      case 707:
        return "grabMouse";
      case 710:
        return "hasFocus";
      case 712:
        return "hide";
      case 714:
        return "init";
      case 716:
        return "isActiveWindow";
      case 717:
        return "isExplicitlyHidden";
      case 718:
        return "isMaximized";
      case 719:
        return "isMinimized";
      case 789:
        return "isMounted";
      case 720:
        return "isNull";
      case 721:
        return "isRootView";
      case 722:
        return "isVisible";
      case 723:
        return "mapFromGlobal";
      case 724:
        return "mapTo";
      case 725:
        return "mapToGlobal";
      case 726:
        return "maxSizeHint";
      case 727:
        return "minSize";
      case 731:
        return "move_2";
      case 732:
        return "normalGeometry";
      case 792:
        return "onChildAdded";
      case 793:
        return "onChildRemoved";
      case 794:
        return "onChildVisibilityChanged";
      case 796:
        return "onGeometryChanged";
      case 798:
        return "onRebuildRequested";
      case 734:
        return "onResize_2";
      case 736:
        return "raise";
      case 737:
        return "raiseAndActivate";
      case 801:
        return "raiseChild";
      case 802:
        return "raiseWindow";
      case 739:
        return "releaseKeyboard";
      case 740:
        return "releaseMouse";
      case 845:
        return "setContentsMargins";
      case 743:
        return "setCursor";
      case 744:
        return "setFixedHeight";
      case 745:
        return "setFixedWidth";
      case 746:
        return "setGeometry";
      case 747:
        return "setHeight";
      case 748:
        return "setMaximumSize";
      case 749:
        return "setMinimumSize";
      case 750:
        return "setMouseTracking";
      case 751:
        return "setParent";
      case 753:
        return "setSize_2";
      case 754:
        return "setViewName";
      case 755:
        return "setVisible";
      case 756:
        return "setWidth";
      case 757:
        return "setWindowOpacity";
      case 758:
        return "setWindowTitle";
      case 759:
        return "setZOrder";
      case 760:
        return "show";
      case 761:
        return "showMaximized";
      case 762:
        return "showMinimized";
      case 763:
        return "showNormal";
      case 765:
        return "update";
      case 766:
        return "viewName";
    }
    throw Error();
  }

  void registerCallbacks() {
    assert(thisCpp != null);
    final RegisterMethodIsReimplementedCallback registerCallback = _dylib
        .lookup<ffi.NativeFunction<RegisterMethodIsReimplementedCallback_FFI>>(
            'c_KDDockWidgets__flutter__MainWindow__registerVirtualMethodCallback')
        .asFunction();
    final callback687 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.activateWindow_calledFromC);
    registerCallback(thisCpp, callback687, 687);
    final callback841 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.MainWindow.centerWidgetMargins_calledFromC);
    registerCallback(thisCpp, callback841, 841);
    final callback842 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.MainWindow.centralAreaGeometry_calledFromC);
    registerCallback(thisCpp, callback842, 842);
    const callbackExcept697 = 0;
    final callback697 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.close_calledFromC, callbackExcept697);
    registerCallback(thisCpp, callback697, 697);
    final callback699 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsCore.View.createPlatformWindow_calledFromC);
    registerCallback(thisCpp, callback699, 699);
    const callbackExcept705 = 0;
    final callback705 = ffi.Pointer.fromFunction<int_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.flags_calledFromC, callbackExcept705);
    registerCallback(thisCpp, callback705, 705);
    final callback706 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.geometry_calledFromC);
    registerCallback(thisCpp, callback706, 706);
    final callback707 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.grabMouse_calledFromC);
    registerCallback(thisCpp, callback707, 707);
    const callbackExcept710 = 0;
    final callback710 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.hasFocus_calledFromC, callbackExcept710);
    registerCallback(thisCpp, callback710, 710);
    final callback712 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.hide_calledFromC);
    registerCallback(thisCpp, callback712, 712);
    final callback714 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsCore.View.init_calledFromC);
    registerCallback(thisCpp, callback714, 714);
    const callbackExcept716 = 0;
    final callback716 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isActiveWindow_calledFromC, callbackExcept716);
    registerCallback(thisCpp, callback716, 716);
    const callbackExcept717 = 0;
    final callback717 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isExplicitlyHidden_calledFromC,
        callbackExcept717);
    registerCallback(thisCpp, callback717, 717);
    const callbackExcept718 = 0;
    final callback718 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isMaximized_calledFromC, callbackExcept718);
    registerCallback(thisCpp, callback718, 718);
    const callbackExcept719 = 0;
    final callback719 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isMinimized_calledFromC, callbackExcept719);
    registerCallback(thisCpp, callback719, 719);
    const callbackExcept789 = 0;
    final callback789 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isMounted_calledFromC, callbackExcept789);
    registerCallback(thisCpp, callback789, 789);
    const callbackExcept720 = 0;
    final callback720 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsCore.View.isNull_calledFromC, callbackExcept720);
    registerCallback(thisCpp, callback720, 720);
    const callbackExcept721 = 0;
    final callback721 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isRootView_calledFromC, callbackExcept721);
    registerCallback(thisCpp, callback721, 721);
    const callbackExcept722 = 0;
    final callback722 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isVisible_calledFromC, callbackExcept722);
    registerCallback(thisCpp, callback722, 722);
    final callback723 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapFromGlobal_calledFromC);
    registerCallback(thisCpp, callback723, 723);
    final callback724 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapTo_calledFromC);
    registerCallback(thisCpp, callback724, 724);
    final callback725 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapToGlobal_calledFromC);
    registerCallback(thisCpp, callback725, 725);
    final callback726 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.maxSizeHint_calledFromC);
    registerCallback(thisCpp, callback726, 726);
    final callback727 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.minSize_calledFromC);
    registerCallback(thisCpp, callback727, 727);
    final callback731 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.move_2_calledFromC);
    registerCallback(thisCpp, callback731, 731);
    final callback732 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.normalGeometry_calledFromC);
    registerCallback(thisCpp, callback732, 732);
    final callback792 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildAdded_calledFromC);
    registerCallback(thisCpp, callback792, 792);
    final callback793 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildRemoved_calledFromC);
    registerCallback(thisCpp, callback793, 793);
    final callback794 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildVisibilityChanged_calledFromC);
    registerCallback(thisCpp, callback794, 794);
    final callback796 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.onGeometryChanged_calledFromC);
    registerCallback(thisCpp, callback796, 796);
    final callback798 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.onRebuildRequested_calledFromC);
    registerCallback(thisCpp, callback798, 798);
    const callbackExcept734 = 0;
    final callback734 =
        ffi.Pointer.fromFunction<bool_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsCore.View.onResize_2_calledFromC, callbackExcept734);
    registerCallback(thisCpp, callback734, 734);
    final callback736 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.raise_calledFromC);
    registerCallback(thisCpp, callback736, 736);
    final callback737 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.raiseAndActivate_calledFromC);
    registerCallback(thisCpp, callback737, 737);
    final callback801 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.raiseChild_calledFromC);
    registerCallback(thisCpp, callback801, 801);
    final callback802 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.raiseWindow_calledFromC);
    registerCallback(thisCpp, callback802, 802);
    final callback739 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.releaseKeyboard_calledFromC);
    registerCallback(thisCpp, callback739, 739);
    final callback740 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.releaseMouse_calledFromC);
    registerCallback(thisCpp, callback740, 740);
    final callback845 = ffi.Pointer.fromFunction<
            void_Func_voidstar_ffi_Int32_ffi_Int32_ffi_Int32_ffi_Int32_FFI>(
        KDDWBindingsFlutter.MainWindow.setContentsMargins_calledFromC);
    registerCallback(thisCpp, callback845, 845);
    final callback743 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setCursor_calledFromC);
    registerCallback(thisCpp, callback743, 743);
    final callback744 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setFixedHeight_calledFromC);
    registerCallback(thisCpp, callback744, 744);
    final callback745 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setFixedWidth_calledFromC);
    registerCallback(thisCpp, callback745, 745);
    final callback746 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setGeometry_calledFromC);
    registerCallback(thisCpp, callback746, 746);
    final callback747 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setHeight_calledFromC);
    registerCallback(thisCpp, callback747, 747);
    final callback748 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setMaximumSize_calledFromC);
    registerCallback(thisCpp, callback748, 748);
    final callback749 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setMinimumSize_calledFromC);
    registerCallback(thisCpp, callback749, 749);
    final callback750 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int8_FFI>(
            KDDWBindingsFlutter.View.setMouseTracking_calledFromC);
    registerCallback(thisCpp, callback750, 750);
    final callback751 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setParent_calledFromC);
    registerCallback(thisCpp, callback751, 751);
    final callback753 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setSize_2_calledFromC);
    registerCallback(thisCpp, callback753, 753);
    final callback754 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setViewName_calledFromC);
    registerCallback(thisCpp, callback754, 754);
    final callback755 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int8_FFI>(
            KDDWBindingsFlutter.View.setVisible_calledFromC);
    registerCallback(thisCpp, callback755, 755);
    final callback756 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setWidth_calledFromC);
    registerCallback(thisCpp, callback756, 756);
    final callback757 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Double_FFI>(
            KDDWBindingsFlutter.View.setWindowOpacity_calledFromC);
    registerCallback(thisCpp, callback757, 757);
    final callback758 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setWindowTitle_calledFromC);
    registerCallback(thisCpp, callback758, 758);
    final callback759 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setZOrder_calledFromC);
    registerCallback(thisCpp, callback759, 759);
    final callback760 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.show_calledFromC);
    registerCallback(thisCpp, callback760, 760);
    final callback761 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showMaximized_calledFromC);
    registerCallback(thisCpp, callback761, 761);
    final callback762 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showMinimized_calledFromC);
    registerCallback(thisCpp, callback762, 762);
    final callback763 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showNormal_calledFromC);
    registerCallback(thisCpp, callback763, 763);
    final callback765 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.update_calledFromC);
    registerCallback(thisCpp, callback765, 765);
    final callback766 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.viewName_calledFromC);
    registerCallback(thisCpp, callback766, 766);
  }
}
