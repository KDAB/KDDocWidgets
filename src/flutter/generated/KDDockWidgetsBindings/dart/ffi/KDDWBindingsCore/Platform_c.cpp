/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/
#include "Platform_c.h"


#include <iostream>


namespace Dartagnan {

typedef int (*CleanupCallback)(void *thisPtr);
static CleanupCallback s_cleanupCallback = nullptr;

template<typename T>
struct ValueWrapper
{
    T value;
};

}
namespace KDDockWidgetsBindings_wrappersNS {
namespace KDDWBindingsCore {
Platform_wrapper::Platform_wrapper()
    : ::KDDockWidgets::Core::Platform()
{
}
QString Platform_wrapper::applicationName() const
{
    if (m_applicationNameCallback) {
        const void *thisPtr = this;
        return *m_applicationNameCallback(const_cast<void *>(thisPtr));
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
QString Platform_wrapper::applicationName_nocallback() const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
KDDockWidgets::Core::ViewFactory *Platform_wrapper::createDefaultViewFactory()
{
    if (m_createDefaultViewFactoryCallback) {
        const void *thisPtr = this;
        return m_createDefaultViewFactoryCallback(const_cast<void *>(thisPtr));
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
KDDockWidgets::Core::ViewFactory *Platform_wrapper::createDefaultViewFactory_nocallback()
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
KDDockWidgets::Core::MainWindow *Platform_wrapper::createMainWindow(const QString &uniqueName, KDDockWidgets::Core::CreateViewOptions arg__2, QFlags<KDDockWidgets::MainWindowOption> options, KDDockWidgets::Core::View *parent, Qt::WindowFlags arg__5) const
{
    if (m_createMainWindowCallback) {
        const void *thisPtr = this;
        return m_createMainWindowCallback(const_cast<void *>(thisPtr), uniqueName, &arg__2, options, parent, arg__5);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
KDDockWidgets::Core::MainWindow *Platform_wrapper::createMainWindow_nocallback(const QString &uniqueName, KDDockWidgets::Core::CreateViewOptions arg__2, QFlags<KDDockWidgets::MainWindowOption> options, KDDockWidgets::Core::View *parent, Qt::WindowFlags arg__5) const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
KDDockWidgets::Core::View *Platform_wrapper::createView(KDDockWidgets::Core::Controller *arg__1, KDDockWidgets::Core::View *parent) const
{
    if (m_createViewCallback) {
        const void *thisPtr = this;
        return m_createViewCallback(const_cast<void *>(thisPtr), arg__1, parent);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
KDDockWidgets::Core::View *Platform_wrapper::createView_nocallback(KDDockWidgets::Core::Controller *arg__1, KDDockWidgets::Core::View *parent) const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
KDDockWidgets::Point Platform_wrapper::cursorPos() const
{
    if (m_cursorPosCallback) {
        const void *thisPtr = this;
        return *m_cursorPosCallback(const_cast<void *>(thisPtr));
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
KDDockWidgets::Point Platform_wrapper::cursorPos_nocallback() const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
void Platform_wrapper::dumpManagedBacktrace()
{
    if (m_dumpManagedBacktraceCallback) {
        const void *thisPtr = this;
        m_dumpManagedBacktraceCallback(const_cast<void *>(thisPtr));
    } else {
        ::KDDockWidgets::Core::Platform::dumpManagedBacktrace();
    }
}
void Platform_wrapper::dumpManagedBacktrace_nocallback()
{
    ::KDDockWidgets::Core::Platform::dumpManagedBacktrace();
}
bool Platform_wrapper::hasActivePopup() const
{
    if (m_hasActivePopupCallback) {
        const void *thisPtr = this;
        return m_hasActivePopupCallback(const_cast<void *>(thisPtr));
    } else {
        return ::KDDockWidgets::Core::Platform::hasActivePopup();
    }
}
bool Platform_wrapper::hasActivePopup_nocallback() const
{
    return ::KDDockWidgets::Core::Platform::hasActivePopup();
}
bool Platform_wrapper::inDisallowedDragView(KDDockWidgets::Point globalPos) const
{
    if (m_inDisallowedDragViewCallback) {
        const void *thisPtr = this;
        return m_inDisallowedDragViewCallback(const_cast<void *>(thisPtr), &globalPos);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
bool Platform_wrapper::inDisallowedDragView_nocallback(KDDockWidgets::Point globalPos) const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
void Platform_wrapper::installMessageHandler()
{
    if (m_installMessageHandlerCallback) {
        const void *thisPtr = this;
        m_installMessageHandlerCallback(const_cast<void *>(thisPtr));
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return;
    }
}
void Platform_wrapper::installMessageHandler_nocallback()
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return;
}
KDDockWidgets::Core::Platform *Platform_wrapper::instance()
{
    return ::KDDockWidgets::Core::Platform::instance();
}
bool Platform_wrapper::isInitialized()
{
    return ::KDDockWidgets::Core::Platform::isInitialized();
}
bool Platform_wrapper::isLeftMouseButtonPressed() const
{
    if (m_isLeftMouseButtonPressedCallback) {
        const void *thisPtr = this;
        return m_isLeftMouseButtonPressedCallback(const_cast<void *>(thisPtr));
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
bool Platform_wrapper::isLeftMouseButtonPressed_nocallback() const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
bool Platform_wrapper::isProcessingAppQuitEvent() const
{
    if (m_isProcessingAppQuitEventCallback) {
        const void *thisPtr = this;
        return m_isProcessingAppQuitEventCallback(const_cast<void *>(thisPtr));
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
bool Platform_wrapper::isProcessingAppQuitEvent_nocallback() const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
bool Platform_wrapper::isQt() const
{
    return ::KDDockWidgets::Core::Platform::isQt();
}
bool Platform_wrapper::isQtQuick() const
{
    return ::KDDockWidgets::Core::Platform::isQtQuick();
}
bool Platform_wrapper::isQtWidgets() const
{
    return ::KDDockWidgets::Core::Platform::isQtWidgets();
}
const char *Platform_wrapper::name() const
{
    if (m_nameCallback) {
        const void *thisPtr = this;
        return m_nameCallback(const_cast<void *>(thisPtr));
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
const char *Platform_wrapper::name_nocallback() const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
void Platform_wrapper::onFloatingWindowCreated(KDDockWidgets::Core::FloatingWindow *arg__1)
{
    if (m_onFloatingWindowCreatedCallback) {
        const void *thisPtr = this;
        m_onFloatingWindowCreatedCallback(const_cast<void *>(thisPtr), arg__1);
    } else {
        ::KDDockWidgets::Core::Platform::onFloatingWindowCreated(arg__1);
    }
}
void Platform_wrapper::onFloatingWindowCreated_nocallback(KDDockWidgets::Core::FloatingWindow *arg__1)
{
    ::KDDockWidgets::Core::Platform::onFloatingWindowCreated(arg__1);
}
void Platform_wrapper::onFloatingWindowDestroyed(KDDockWidgets::Core::FloatingWindow *arg__1)
{
    if (m_onFloatingWindowDestroyedCallback) {
        const void *thisPtr = this;
        m_onFloatingWindowDestroyedCallback(const_cast<void *>(thisPtr), arg__1);
    } else {
        ::KDDockWidgets::Core::Platform::onFloatingWindowDestroyed(arg__1);
    }
}
void Platform_wrapper::onFloatingWindowDestroyed_nocallback(KDDockWidgets::Core::FloatingWindow *arg__1)
{
    ::KDDockWidgets::Core::Platform::onFloatingWindowDestroyed(arg__1);
}
void Platform_wrapper::onMainWindowCreated(KDDockWidgets::Core::MainWindow *arg__1)
{
    if (m_onMainWindowCreatedCallback) {
        const void *thisPtr = this;
        m_onMainWindowCreatedCallback(const_cast<void *>(thisPtr), arg__1);
    } else {
        ::KDDockWidgets::Core::Platform::onMainWindowCreated(arg__1);
    }
}
void Platform_wrapper::onMainWindowCreated_nocallback(KDDockWidgets::Core::MainWindow *arg__1)
{
    ::KDDockWidgets::Core::Platform::onMainWindowCreated(arg__1);
}
void Platform_wrapper::onMainWindowDestroyed(KDDockWidgets::Core::MainWindow *arg__1)
{
    if (m_onMainWindowDestroyedCallback) {
        const void *thisPtr = this;
        m_onMainWindowDestroyedCallback(const_cast<void *>(thisPtr), arg__1);
    } else {
        ::KDDockWidgets::Core::Platform::onMainWindowDestroyed(arg__1);
    }
}
void Platform_wrapper::onMainWindowDestroyed_nocallback(KDDockWidgets::Core::MainWindow *arg__1)
{
    ::KDDockWidgets::Core::Platform::onMainWindowDestroyed(arg__1);
}
void Platform_wrapper::pauseForDebugger()
{
    if (m_pauseForDebuggerCallback) {
        const void *thisPtr = this;
        m_pauseForDebuggerCallback(const_cast<void *>(thisPtr));
    } else {
        ::KDDockWidgets::Core::Platform::pauseForDebugger();
    }
}
void Platform_wrapper::pauseForDebugger_nocallback()
{
    ::KDDockWidgets::Core::Platform::pauseForDebugger();
}
void Platform_wrapper::restoreMouseCursor()
{
    if (m_restoreMouseCursorCallback) {
        const void *thisPtr = this;
        m_restoreMouseCursorCallback(const_cast<void *>(thisPtr));
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return;
    }
}
void Platform_wrapper::restoreMouseCursor_nocallback()
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return;
}
void Platform_wrapper::runDelayed(int ms, KDDockWidgets::Core::DelayedCall *c)
{
    if (m_runDelayedCallback) {
        const void *thisPtr = this;
        m_runDelayedCallback(const_cast<void *>(thisPtr), ms, c);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return;
    }
}
void Platform_wrapper::runDelayed_nocallback(int ms, KDDockWidgets::Core::DelayedCall *c)
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return;
}
int Platform_wrapper::screenNumberFor(KDDockWidgets::Core::View *arg__1) const
{
    if (m_screenNumberForCallback) {
        const void *thisPtr = this;
        return m_screenNumberForCallback(const_cast<void *>(thisPtr), arg__1);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
int Platform_wrapper::screenNumberFor_nocallback(KDDockWidgets::Core::View *arg__1) const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
KDDockWidgets::Size Platform_wrapper::screenSizeFor(KDDockWidgets::Core::View *arg__1) const
{
    if (m_screenSizeForCallback) {
        const void *thisPtr = this;
        return *m_screenSizeForCallback(const_cast<void *>(thisPtr), arg__1);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
KDDockWidgets::Size Platform_wrapper::screenSizeFor_nocallback(KDDockWidgets::Core::View *arg__1) const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
void Platform_wrapper::sendEvent(KDDockWidgets::Core::View *arg__1, KDDockWidgets::Event *arg__2) const
{
    if (m_sendEventCallback) {
        const void *thisPtr = this;
        m_sendEventCallback(const_cast<void *>(thisPtr), arg__1, arg__2);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return;
    }
}
void Platform_wrapper::sendEvent_nocallback(KDDockWidgets::Core::View *arg__1, KDDockWidgets::Event *arg__2) const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return;
}
void Platform_wrapper::setCursorPos(KDDockWidgets::Point arg__1)
{
    if (m_setCursorPosCallback) {
        const void *thisPtr = this;
        m_setCursorPosCallback(const_cast<void *>(thisPtr), &arg__1);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return;
    }
}
void Platform_wrapper::setCursorPos_nocallback(KDDockWidgets::Point arg__1)
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return;
}
void Platform_wrapper::setMouseCursor(Qt::CursorShape arg__1)
{
    if (m_setMouseCursorCallback) {
        const void *thisPtr = this;
        m_setMouseCursorCallback(const_cast<void *>(thisPtr), arg__1);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return;
    }
}
void Platform_wrapper::setMouseCursor_nocallback(Qt::CursorShape arg__1)
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return;
}
int Platform_wrapper::startDragDistance() const
{
    return ::KDDockWidgets::Core::Platform::startDragDistance();
}
int Platform_wrapper::startDragDistance_impl() const
{
    if (m_startDragDistance_implCallback) {
        const void *thisPtr = this;
        return m_startDragDistance_implCallback(const_cast<void *>(thisPtr));
    } else {
        return ::KDDockWidgets::Core::Platform::startDragDistance_impl();
    }
}
int Platform_wrapper::startDragDistance_impl_nocallback() const
{
    return ::KDDockWidgets::Core::Platform::startDragDistance_impl();
}
KDDockWidgets::Core::View *Platform_wrapper::tests_createFocusableView(KDDockWidgets::Core::CreateViewOptions arg__1, KDDockWidgets::Core::View *parent)
{
    if (m_tests_createFocusableViewCallback) {
        const void *thisPtr = this;
        return m_tests_createFocusableViewCallback(const_cast<void *>(thisPtr), &arg__1, parent);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
KDDockWidgets::Core::View *Platform_wrapper::tests_createFocusableView_nocallback(KDDockWidgets::Core::CreateViewOptions arg__1, KDDockWidgets::Core::View *parent)
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
KDDockWidgets::Core::View *Platform_wrapper::tests_createNonClosableView(KDDockWidgets::Core::View *parent)
{
    if (m_tests_createNonClosableViewCallback) {
        const void *thisPtr = this;
        return m_tests_createNonClosableViewCallback(const_cast<void *>(thisPtr), parent);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
KDDockWidgets::Core::View *Platform_wrapper::tests_createNonClosableView_nocallback(KDDockWidgets::Core::View *parent)
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
KDDockWidgets::Core::View *Platform_wrapper::tests_createView(KDDockWidgets::Core::CreateViewOptions arg__1, KDDockWidgets::Core::View *parent)
{
    if (m_tests_createViewCallback) {
        const void *thisPtr = this;
        return m_tests_createViewCallback(const_cast<void *>(thisPtr), &arg__1, parent);
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
KDDockWidgets::Core::View *Platform_wrapper::tests_createView_nocallback(KDDockWidgets::Core::CreateViewOptions arg__1, KDDockWidgets::Core::View *parent)
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
void Platform_wrapper::tests_deinitPlatform()
{
    ::KDDockWidgets::Core::Platform::tests_deinitPlatform();
}
void Platform_wrapper::tests_deinitPlatform_impl()
{
    if (m_tests_deinitPlatform_implCallback) {
        const void *thisPtr = this;
        m_tests_deinitPlatform_implCallback(const_cast<void *>(thisPtr));
    } else {
        ::KDDockWidgets::Core::Platform::tests_deinitPlatform_impl();
    }
}
void Platform_wrapper::tests_deinitPlatform_impl_nocallback()
{
    ::KDDockWidgets::Core::Platform::tests_deinitPlatform_impl();
}
void Platform_wrapper::tests_initPlatform_impl()
{
    if (m_tests_initPlatform_implCallback) {
        const void *thisPtr = this;
        m_tests_initPlatform_implCallback(const_cast<void *>(thisPtr));
    } else {
        ::KDDockWidgets::Core::Platform::tests_initPlatform_impl();
    }
}
void Platform_wrapper::tests_initPlatform_impl_nocallback()
{
    ::KDDockWidgets::Core::Platform::tests_initPlatform_impl();
}
void Platform_wrapper::ungrabMouse()
{
    if (m_ungrabMouseCallback) {
        const void *thisPtr = this;
        m_ungrabMouseCallback(const_cast<void *>(thisPtr));
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return;
    }
}
void Platform_wrapper::ungrabMouse_nocallback()
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return;
}
void Platform_wrapper::uninstallMessageHandler()
{
    if (m_uninstallMessageHandlerCallback) {
        const void *thisPtr = this;
        m_uninstallMessageHandlerCallback(const_cast<void *>(thisPtr));
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return;
    }
}
void Platform_wrapper::uninstallMessageHandler_nocallback()
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return;
}
bool Platform_wrapper::usesFallbackMouseGrabber() const
{
    if (m_usesFallbackMouseGrabberCallback) {
        const void *thisPtr = this;
        return m_usesFallbackMouseGrabberCallback(const_cast<void *>(thisPtr));
    } else {
        std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
        return {};
    }
}
bool Platform_wrapper::usesFallbackMouseGrabber_nocallback() const
{
    std::cerr << Q_FUNC_INFO << "Warning: Calling pure-virtual\n";
    return {};
}
Platform_wrapper::~Platform_wrapper()
{
}

}
}
static KDDockWidgets::Core::Platform *fromPtr(void *ptr)
{
    return reinterpret_cast<KDDockWidgets::Core::Platform *>(ptr);
}
static KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper *fromWrapperPtr(void *ptr)
{
    return reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper *>(ptr);
}
extern "C" {
void c_KDDockWidgets__Core__Platform_Finalizer(void *cppObj)
{
    delete reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper *>(cppObj);
}
void *c_KDDockWidgets__Core__Platform__constructor()
{
    auto ptr = new KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper();
    return reinterpret_cast<void *>(ptr);
}
// applicationName() const
void *c_KDDockWidgets__Core__Platform__applicationName(void *thisObj)
{
    return new Dartagnan::ValueWrapper<QString> { [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->applicationName_nocallback();} else {    return targetPtr->applicationName();} }() };
}
// createDefaultViewFactory()
void *c_KDDockWidgets__Core__Platform__createDefaultViewFactory(void *thisObj)
{
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->createDefaultViewFactory_nocallback();} else {    return targetPtr->createDefaultViewFactory();} }();
}
// createMainWindow(const QString & uniqueName, KDDockWidgets::Core::CreateViewOptions arg__2, QFlags<KDDockWidgets::MainWindowOption> options, KDDockWidgets::Core::View * parent, Qt::WindowFlags arg__5) const
void *c_KDDockWidgets__Core__Platform__createMainWindow_QString_CreateViewOptions_MainWindowOptions_View_WindowFlags(void *thisObj, const char *uniqueName_, void *arg__2_, int options_, void *parent_, int arg__5)
{
    const auto uniqueName = QString::fromUtf8(uniqueName_);
    assert(arg__2_);
    auto &arg__2 = *reinterpret_cast<KDDockWidgets::Core::CreateViewOptions *>(arg__2_);
    auto options = static_cast<QFlags<KDDockWidgets::MainWindowOption>>(options_);
    auto parent = reinterpret_cast<KDDockWidgets::Core::View *>(parent_);
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->createMainWindow_nocallback(uniqueName,arg__2,options,parent,static_cast<Qt::WindowFlags>(arg__5));} else {    return targetPtr->createMainWindow(uniqueName,arg__2,options,parent,static_cast<Qt::WindowFlags>(arg__5));} }();
}
// createView(KDDockWidgets::Core::Controller * arg__1, KDDockWidgets::Core::View * parent) const
void *c_KDDockWidgets__Core__Platform__createView_Controller_View(void *thisObj, void *arg__1_, void *parent_)
{
    auto arg__1 = reinterpret_cast<KDDockWidgets::Core::Controller *>(arg__1_);
    auto parent = reinterpret_cast<KDDockWidgets::Core::View *>(parent_);
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->createView_nocallback(arg__1,parent);} else {    return targetPtr->createView(arg__1,parent);} }();
}
// cursorPos() const
void *c_KDDockWidgets__Core__Platform__cursorPos(void *thisObj)
{
    return new Dartagnan::ValueWrapper<KDDockWidgets::Point> { [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->cursorPos_nocallback();} else {    return targetPtr->cursorPos();} }() };
}
// dumpManagedBacktrace()
void c_KDDockWidgets__Core__Platform__dumpManagedBacktrace(void *thisObj)
{
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->dumpManagedBacktrace_nocallback();} else {    return targetPtr->dumpManagedBacktrace();} }();
}
// hasActivePopup() const
bool c_KDDockWidgets__Core__Platform__hasActivePopup(void *thisObj)
{
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->hasActivePopup_nocallback();} else {    return targetPtr->hasActivePopup();} }();
}
// inDisallowedDragView(KDDockWidgets::Point globalPos) const
bool c_KDDockWidgets__Core__Platform__inDisallowedDragView_Point(void *thisObj, void *globalPos_)
{
    assert(globalPos_);
    auto &globalPos = *reinterpret_cast<KDDockWidgets::Point *>(globalPos_);
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->inDisallowedDragView_nocallback(globalPos);} else {    return targetPtr->inDisallowedDragView(globalPos);} }();
}
// installMessageHandler()
void c_KDDockWidgets__Core__Platform__installMessageHandler(void *thisObj)
{
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->installMessageHandler_nocallback();} else {    return targetPtr->installMessageHandler();} }();
}
// instance()
void *c_static_KDDockWidgets__Core__Platform__instance()
{
    return KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::instance();
}
// isInitialized()
bool c_static_KDDockWidgets__Core__Platform__isInitialized()
{
    return KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::isInitialized();
}
// isLeftMouseButtonPressed() const
bool c_KDDockWidgets__Core__Platform__isLeftMouseButtonPressed(void *thisObj)
{
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->isLeftMouseButtonPressed_nocallback();} else {    return targetPtr->isLeftMouseButtonPressed();} }();
}
// isProcessingAppQuitEvent() const
bool c_KDDockWidgets__Core__Platform__isProcessingAppQuitEvent(void *thisObj)
{
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->isProcessingAppQuitEvent_nocallback();} else {    return targetPtr->isProcessingAppQuitEvent();} }();
}
// isQt() const
bool c_KDDockWidgets__Core__Platform__isQt(void *thisObj)
{
    return fromPtr(thisObj)->isQt();
}
// isQtQuick() const
bool c_KDDockWidgets__Core__Platform__isQtQuick(void *thisObj)
{
    return fromPtr(thisObj)->isQtQuick();
}
// isQtWidgets() const
bool c_KDDockWidgets__Core__Platform__isQtWidgets(void *thisObj)
{
    return fromPtr(thisObj)->isQtWidgets();
}
// name() const
const char *c_KDDockWidgets__Core__Platform__name(void *thisObj)
{
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->name_nocallback();} else {    return targetPtr->name();} }();
}
// onFloatingWindowCreated(KDDockWidgets::Core::FloatingWindow * arg__1)
void c_KDDockWidgets__Core__Platform__onFloatingWindowCreated_FloatingWindow(void *thisObj, void *arg__1_)
{
    auto arg__1 = reinterpret_cast<KDDockWidgets::Core::FloatingWindow *>(arg__1_);
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->onFloatingWindowCreated_nocallback(arg__1);} else {    return targetPtr->onFloatingWindowCreated(arg__1);} }();
}
// onFloatingWindowDestroyed(KDDockWidgets::Core::FloatingWindow * arg__1)
void c_KDDockWidgets__Core__Platform__onFloatingWindowDestroyed_FloatingWindow(void *thisObj, void *arg__1_)
{
    auto arg__1 = reinterpret_cast<KDDockWidgets::Core::FloatingWindow *>(arg__1_);
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->onFloatingWindowDestroyed_nocallback(arg__1);} else {    return targetPtr->onFloatingWindowDestroyed(arg__1);} }();
}
// onMainWindowCreated(KDDockWidgets::Core::MainWindow * arg__1)
void c_KDDockWidgets__Core__Platform__onMainWindowCreated_MainWindow(void *thisObj, void *arg__1_)
{
    auto arg__1 = reinterpret_cast<KDDockWidgets::Core::MainWindow *>(arg__1_);
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->onMainWindowCreated_nocallback(arg__1);} else {    return targetPtr->onMainWindowCreated(arg__1);} }();
}
// onMainWindowDestroyed(KDDockWidgets::Core::MainWindow * arg__1)
void c_KDDockWidgets__Core__Platform__onMainWindowDestroyed_MainWindow(void *thisObj, void *arg__1_)
{
    auto arg__1 = reinterpret_cast<KDDockWidgets::Core::MainWindow *>(arg__1_);
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->onMainWindowDestroyed_nocallback(arg__1);} else {    return targetPtr->onMainWindowDestroyed(arg__1);} }();
}
// pauseForDebugger()
void c_KDDockWidgets__Core__Platform__pauseForDebugger(void *thisObj)
{
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->pauseForDebugger_nocallback();} else {    return targetPtr->pauseForDebugger();} }();
}
// restoreMouseCursor()
void c_KDDockWidgets__Core__Platform__restoreMouseCursor(void *thisObj)
{
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->restoreMouseCursor_nocallback();} else {    return targetPtr->restoreMouseCursor();} }();
}
// runDelayed(int ms, KDDockWidgets::Core::DelayedCall * c)
void c_KDDockWidgets__Core__Platform__runDelayed_int_DelayedCall(void *thisObj, int ms, void *c_)
{
    auto c = reinterpret_cast<KDDockWidgets::Core::DelayedCall *>(c_);
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->runDelayed_nocallback(ms,c);} else {    return targetPtr->runDelayed(ms,c);} }();
}
// screenNumberFor(KDDockWidgets::Core::View * arg__1) const
int c_KDDockWidgets__Core__Platform__screenNumberFor_View(void *thisObj, void *arg__1_)
{
    auto arg__1 = reinterpret_cast<KDDockWidgets::Core::View *>(arg__1_);
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->screenNumberFor_nocallback(arg__1);} else {    return targetPtr->screenNumberFor(arg__1);} }();
}
// screenSizeFor(KDDockWidgets::Core::View * arg__1) const
void *c_KDDockWidgets__Core__Platform__screenSizeFor_View(void *thisObj, void *arg__1_)
{
    auto arg__1 = reinterpret_cast<KDDockWidgets::Core::View *>(arg__1_);
    return new Dartagnan::ValueWrapper<KDDockWidgets::Size> { [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->screenSizeFor_nocallback(arg__1);} else {    return targetPtr->screenSizeFor(arg__1);} }() };
}
// sendEvent(KDDockWidgets::Core::View * arg__1, KDDockWidgets::Event * arg__2) const
void c_KDDockWidgets__Core__Platform__sendEvent_View_Event(void *thisObj, void *arg__1_, void *arg__2_)
{
    auto arg__1 = reinterpret_cast<KDDockWidgets::Core::View *>(arg__1_);
    auto arg__2 = reinterpret_cast<KDDockWidgets::Event *>(arg__2_);
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->sendEvent_nocallback(arg__1,arg__2);} else {    return targetPtr->sendEvent(arg__1,arg__2);} }();
}
// setCursorPos(KDDockWidgets::Point arg__1)
void c_KDDockWidgets__Core__Platform__setCursorPos_Point(void *thisObj, void *arg__1_)
{
    assert(arg__1_);
    auto &arg__1 = *reinterpret_cast<KDDockWidgets::Point *>(arg__1_);
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->setCursorPos_nocallback(arg__1);} else {    return targetPtr->setCursorPos(arg__1);} }();
}
// setMouseCursor(Qt::CursorShape arg__1)
void c_KDDockWidgets__Core__Platform__setMouseCursor_CursorShape(void *thisObj, int arg__1)
{
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->setMouseCursor_nocallback(static_cast<Qt::CursorShape>(arg__1));} else {    return targetPtr->setMouseCursor(static_cast<Qt::CursorShape>(arg__1));} }();
}
// startDragDistance() const
int c_KDDockWidgets__Core__Platform__startDragDistance(void *thisObj)
{
    return fromPtr(thisObj)->startDragDistance();
}
// startDragDistance_impl() const
int c_KDDockWidgets__Core__Platform__startDragDistance_impl(void *thisObj)
{
    return fromWrapperPtr(thisObj)->startDragDistance_impl_nocallback();
}
// tests_createFocusableView(KDDockWidgets::Core::CreateViewOptions arg__1, KDDockWidgets::Core::View * parent)
void *c_KDDockWidgets__Core__Platform__tests_createFocusableView_CreateViewOptions_View(void *thisObj, void *arg__1_, void *parent_)
{
    assert(arg__1_);
    auto &arg__1 = *reinterpret_cast<KDDockWidgets::Core::CreateViewOptions *>(arg__1_);
    auto parent = reinterpret_cast<KDDockWidgets::Core::View *>(parent_);
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->tests_createFocusableView_nocallback(arg__1,parent);} else {    return targetPtr->tests_createFocusableView(arg__1,parent);} }();
}
// tests_createNonClosableView(KDDockWidgets::Core::View * parent)
void *c_KDDockWidgets__Core__Platform__tests_createNonClosableView_View(void *thisObj, void *parent_)
{
    auto parent = reinterpret_cast<KDDockWidgets::Core::View *>(parent_);
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->tests_createNonClosableView_nocallback(parent);} else {    return targetPtr->tests_createNonClosableView(parent);} }();
}
// tests_createView(KDDockWidgets::Core::CreateViewOptions arg__1, KDDockWidgets::Core::View * parent)
void *c_KDDockWidgets__Core__Platform__tests_createView_CreateViewOptions_View(void *thisObj, void *arg__1_, void *parent_)
{
    assert(arg__1_);
    auto &arg__1 = *reinterpret_cast<KDDockWidgets::Core::CreateViewOptions *>(arg__1_);
    auto parent = reinterpret_cast<KDDockWidgets::Core::View *>(parent_);
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->tests_createView_nocallback(arg__1,parent);} else {    return targetPtr->tests_createView(arg__1,parent);} }();
}
// tests_deinitPlatform()
void c_static_KDDockWidgets__Core__Platform__tests_deinitPlatform()
{
    KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::tests_deinitPlatform();
}
// tests_deinitPlatform_impl()
void c_KDDockWidgets__Core__Platform__tests_deinitPlatform_impl(void *thisObj)
{
    fromWrapperPtr(thisObj)->tests_deinitPlatform_impl_nocallback();
}
// tests_initPlatform_impl()
void c_KDDockWidgets__Core__Platform__tests_initPlatform_impl(void *thisObj)
{
    fromWrapperPtr(thisObj)->tests_initPlatform_impl_nocallback();
}
// ungrabMouse()
void c_KDDockWidgets__Core__Platform__ungrabMouse(void *thisObj)
{
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->ungrabMouse_nocallback();} else {    return targetPtr->ungrabMouse();} }();
}
// uninstallMessageHandler()
void c_KDDockWidgets__Core__Platform__uninstallMessageHandler(void *thisObj)
{
    [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->uninstallMessageHandler_nocallback();} else {    return targetPtr->uninstallMessageHandler();} }();
}
// usesFallbackMouseGrabber() const
bool c_KDDockWidgets__Core__Platform__usesFallbackMouseGrabber(void *thisObj)
{
    return [&] {auto targetPtr = fromPtr(thisObj);auto wrapperPtr = dynamic_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper*>(targetPtr);if (wrapperPtr) {    return wrapperPtr->usesFallbackMouseGrabber_nocallback();} else {    return targetPtr->usesFallbackMouseGrabber();} }();
}
void c_KDDockWidgets__Core__Platform__destructor(void *thisObj)
{
    delete fromPtr(thisObj);
}
int c_static_KDDockWidgets__Core__Platform___get_s_logicalDpiFactorOverride()
{
    return KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::s_logicalDpiFactorOverride;
}
void c_static_KDDockWidgets__Core__Platform___set_s_logicalDpiFactorOverride_int(int s_logicalDpiFactorOverride_)
{
    KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::s_logicalDpiFactorOverride = s_logicalDpiFactorOverride_;
}
void c_KDDockWidgets__Core__Platform__registerVirtualMethodCallback(void *ptr, void *callback, int methodId)
{
    auto wrapper = fromWrapperPtr(ptr);
    switch (methodId) {
    case 470:
        wrapper->m_applicationNameCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_applicationName>(callback);
        break;
    case 471:
        wrapper->m_createDefaultViewFactoryCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_createDefaultViewFactory>(callback);
        break;
    case 472:
        wrapper->m_createMainWindowCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_createMainWindow>(callback);
        break;
    case 473:
        wrapper->m_createViewCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_createView>(callback);
        break;
    case 474:
        wrapper->m_cursorPosCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_cursorPos>(callback);
        break;
    case 475:
        wrapper->m_dumpManagedBacktraceCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_dumpManagedBacktrace>(callback);
        break;
    case 477:
        wrapper->m_hasActivePopupCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_hasActivePopup>(callback);
        break;
    case 478:
        wrapper->m_inDisallowedDragViewCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_inDisallowedDragView>(callback);
        break;
    case 479:
        wrapper->m_installMessageHandlerCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_installMessageHandler>(callback);
        break;
    case 482:
        wrapper->m_isLeftMouseButtonPressedCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_isLeftMouseButtonPressed>(callback);
        break;
    case 483:
        wrapper->m_isProcessingAppQuitEventCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_isProcessingAppQuitEvent>(callback);
        break;
    case 487:
        wrapper->m_nameCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_name>(callback);
        break;
    case 488:
        wrapper->m_onFloatingWindowCreatedCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_onFloatingWindowCreated>(callback);
        break;
    case 489:
        wrapper->m_onFloatingWindowDestroyedCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_onFloatingWindowDestroyed>(callback);
        break;
    case 490:
        wrapper->m_onMainWindowCreatedCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_onMainWindowCreated>(callback);
        break;
    case 491:
        wrapper->m_onMainWindowDestroyedCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_onMainWindowDestroyed>(callback);
        break;
    case 492:
        wrapper->m_pauseForDebuggerCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_pauseForDebugger>(callback);
        break;
    case 494:
        wrapper->m_restoreMouseCursorCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_restoreMouseCursor>(callback);
        break;
    case 495:
        wrapper->m_runDelayedCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_runDelayed>(callback);
        break;
    case 496:
        wrapper->m_screenNumberForCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_screenNumberFor>(callback);
        break;
    case 497:
        wrapper->m_screenSizeForCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_screenSizeFor>(callback);
        break;
    case 498:
        wrapper->m_sendEventCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_sendEvent>(callback);
        break;
    case 499:
        wrapper->m_setCursorPosCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_setCursorPos>(callback);
        break;
    case 500:
        wrapper->m_setMouseCursorCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_setMouseCursor>(callback);
        break;
    case 502:
        wrapper->m_startDragDistance_implCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_startDragDistance_impl>(callback);
        break;
    case 503:
        wrapper->m_tests_createFocusableViewCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_tests_createFocusableView>(callback);
        break;
    case 504:
        wrapper->m_tests_createNonClosableViewCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_tests_createNonClosableView>(callback);
        break;
    case 505:
        wrapper->m_tests_createViewCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_tests_createView>(callback);
        break;
    case 507:
        wrapper->m_tests_deinitPlatform_implCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_tests_deinitPlatform_impl>(callback);
        break;
    case 509:
        wrapper->m_tests_initPlatform_implCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_tests_initPlatform_impl>(callback);
        break;
    case 510:
        wrapper->m_ungrabMouseCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_ungrabMouse>(callback);
        break;
    case 511:
        wrapper->m_uninstallMessageHandlerCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_uninstallMessageHandler>(callback);
        break;
    case 512:
        wrapper->m_usesFallbackMouseGrabberCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::Platform_wrapper::Callback_usesFallbackMouseGrabber>(callback);
        break;
    }
}
}
