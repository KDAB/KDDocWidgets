/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/
#include "DockWidget_c.h"


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
DockWidget_wrapper::DockWidget_wrapper(KDDockWidgets::Core::View *view, const QString &uniqueName, QFlags<KDDockWidgets::DockWidgetOption> options, QFlags<KDDockWidgets::LayoutSaverOption> layoutSaverOptions)
    : ::KDDockWidgets::Core::DockWidget(view, uniqueName, options, layoutSaverOptions)
{
}
void DockWidget_wrapper::aboutToDelete(KDDockWidgets::Core::DockWidget *arg__1)
{
    ::KDDockWidgets::Core::DockWidget::aboutToDelete(arg__1);
}
void DockWidget_wrapper::aboutToDeleteOnClose()
{
    ::KDDockWidgets::Core::DockWidget::aboutToDeleteOnClose();
}
void DockWidget_wrapper::actualTitleBarChanged()
{
    ::KDDockWidgets::Core::DockWidget::actualTitleBarChanged();
}
void DockWidget_wrapper::addDockWidgetAsTab(KDDockWidgets::Core::DockWidget *other, KDDockWidgets::InitialOption initialOption)
{
    ::KDDockWidgets::Core::DockWidget::addDockWidgetAsTab(other, initialOption);
}
void DockWidget_wrapper::addDockWidgetToContainingWindow(KDDockWidgets::Core::DockWidget *other, KDDockWidgets::Location location, KDDockWidgets::Core::DockWidget *relativeTo, KDDockWidgets::InitialOption initialOption)
{
    ::KDDockWidgets::Core::DockWidget::addDockWidgetToContainingWindow(other, location, relativeTo, initialOption);
}
KDDockWidgets::Core::DockWidget *DockWidget_wrapper::byName(const QString &uniqueName)
{
    return ::KDDockWidgets::Core::DockWidget::byName(uniqueName);
}
void DockWidget_wrapper::closed()
{
    ::KDDockWidgets::Core::DockWidget::closed();
}
int DockWidget_wrapper::currentTabIndex() const
{
    return ::KDDockWidgets::Core::DockWidget::currentTabIndex();
}
KDDockWidgets::Core::FloatingWindow *DockWidget_wrapper::floatingWindow() const
{
    return ::KDDockWidgets::Core::DockWidget::floatingWindow();
}
void DockWidget_wrapper::forceClose()
{
    ::KDDockWidgets::Core::DockWidget::forceClose();
}
QRect DockWidget_wrapper::groupGeometry() const
{
    return ::KDDockWidgets::Core::DockWidget::groupGeometry();
}
void DockWidget_wrapper::guestViewChanged()
{
    ::KDDockWidgets::Core::DockWidget::guestViewChanged();
}
bool DockWidget_wrapper::hasPreviousDockedLocation() const
{
    return ::KDDockWidgets::Core::DockWidget::hasPreviousDockedLocation();
}
void DockWidget_wrapper::iconChanged()
{
    ::KDDockWidgets::Core::DockWidget::iconChanged();
}
void DockWidget_wrapper::init()
{
    ::KDDockWidgets::Core::DockWidget::init();
}
bool DockWidget_wrapper::isCurrentTab() const
{
    return ::KDDockWidgets::Core::DockWidget::isCurrentTab();
}
bool DockWidget_wrapper::isFloating() const
{
    return ::KDDockWidgets::Core::DockWidget::isFloating();
}
void DockWidget_wrapper::isFloatingChanged(bool arg__1)
{
    ::KDDockWidgets::Core::DockWidget::isFloatingChanged(arg__1);
}
bool DockWidget_wrapper::isFocused() const
{
    return ::KDDockWidgets::Core::DockWidget::isFocused();
}
void DockWidget_wrapper::isFocusedChanged(bool arg__1)
{
    ::KDDockWidgets::Core::DockWidget::isFocusedChanged(arg__1);
}
bool DockWidget_wrapper::isInMainWindow() const
{
    return ::KDDockWidgets::Core::DockWidget::isInMainWindow();
}
bool DockWidget_wrapper::isInSideBar() const
{
    return ::KDDockWidgets::Core::DockWidget::isInSideBar();
}
bool DockWidget_wrapper::isMainWindow() const
{
    return ::KDDockWidgets::Core::DockWidget::isMainWindow();
}
bool DockWidget_wrapper::isOpen() const
{
    return ::KDDockWidgets::Core::DockWidget::isOpen();
}
void DockWidget_wrapper::isOpenChanged(bool isOpen)
{
    ::KDDockWidgets::Core::DockWidget::isOpenChanged(isOpen);
}
bool DockWidget_wrapper::isOverlayed() const
{
    return ::KDDockWidgets::Core::DockWidget::isOverlayed();
}
void DockWidget_wrapper::isOverlayedChanged(bool arg__1)
{
    ::KDDockWidgets::Core::DockWidget::isOverlayedChanged(arg__1);
}
bool DockWidget_wrapper::isPersistentCentralDockWidget() const
{
    return ::KDDockWidgets::Core::DockWidget::isPersistentCentralDockWidget();
}
bool DockWidget_wrapper::isTabbed() const
{
    return ::KDDockWidgets::Core::DockWidget::isTabbed();
}
QSize DockWidget_wrapper::lastOverlayedSize() const
{
    return ::KDDockWidgets::Core::DockWidget::lastOverlayedSize();
}
QFlags<KDDockWidgets::LayoutSaverOption> DockWidget_wrapper::layoutSaverOptions() const
{
    return ::KDDockWidgets::Core::DockWidget::layoutSaverOptions();
}
KDDockWidgets::Core::MainWindow *DockWidget_wrapper::mainWindow() const
{
    return ::KDDockWidgets::Core::DockWidget::mainWindow();
}
void DockWidget_wrapper::moveToSideBar()
{
    ::KDDockWidgets::Core::DockWidget::moveToSideBar();
}
void DockWidget_wrapper::onResize(QSize newSize)
{
    ::KDDockWidgets::Core::DockWidget::onResize(newSize);
}
void DockWidget_wrapper::open()
{
    ::KDDockWidgets::Core::DockWidget::open();
}
QFlags<KDDockWidgets::DockWidgetOption> DockWidget_wrapper::options() const
{
    return ::KDDockWidgets::Core::DockWidget::options();
}
void DockWidget_wrapper::optionsChanged(QFlags<KDDockWidgets::DockWidgetOption> arg__1)
{
    ::KDDockWidgets::Core::DockWidget::optionsChanged(arg__1);
}
void DockWidget_wrapper::raise()
{
    ::KDDockWidgets::Core::DockWidget::raise();
}
void DockWidget_wrapper::removedFromSideBar()
{
    ::KDDockWidgets::Core::DockWidget::removedFromSideBar();
}
void DockWidget_wrapper::setAffinityName(const QString &name)
{
    ::KDDockWidgets::Core::DockWidget::setAffinityName(name);
}
void DockWidget_wrapper::setAsCurrentTab()
{
    ::KDDockWidgets::Core::DockWidget::setAsCurrentTab();
}
bool DockWidget_wrapper::setFloating(bool floats)
{
    return ::KDDockWidgets::Core::DockWidget::setFloating(floats);
}
void DockWidget_wrapper::setFloatingGeometry(QRect geo)
{
    ::KDDockWidgets::Core::DockWidget::setFloatingGeometry(geo);
}
void DockWidget_wrapper::setMDIPosition(QPoint pos)
{
    ::KDDockWidgets::Core::DockWidget::setMDIPosition(pos);
}
void DockWidget_wrapper::setMDISize(QSize size)
{
    ::KDDockWidgets::Core::DockWidget::setMDISize(size);
}
void DockWidget_wrapper::setMDIZ(int z)
{
    ::KDDockWidgets::Core::DockWidget::setMDIZ(z);
}
void DockWidget_wrapper::setOptions(QFlags<KDDockWidgets::DockWidgetOption> arg__1)
{
    ::KDDockWidgets::Core::DockWidget::setOptions(arg__1);
}
void DockWidget_wrapper::setParentView_impl(KDDockWidgets::Core::View *parent)
{
    if (m_setParentView_implCallback) {
        const void *thisPtr = this;
        m_setParentView_implCallback(const_cast<void *>(thisPtr), parent);
    } else {
        ::KDDockWidgets::Core::DockWidget::setParentView_impl(parent);
    }
}
void DockWidget_wrapper::setParentView_impl_nocallback(KDDockWidgets::Core::View *parent)
{
    ::KDDockWidgets::Core::DockWidget::setParentView_impl(parent);
}
void DockWidget_wrapper::setTitle(const QString &title)
{
    ::KDDockWidgets::Core::DockWidget::setTitle(title);
}
void DockWidget_wrapper::setUserType(int userType)
{
    ::KDDockWidgets::Core::DockWidget::setUserType(userType);
}
void DockWidget_wrapper::show()
{
    ::KDDockWidgets::Core::DockWidget::show();
}
bool DockWidget_wrapper::skipsRestore() const
{
    return ::KDDockWidgets::Core::DockWidget::skipsRestore();
}
int DockWidget_wrapper::tabIndex() const
{
    return ::KDDockWidgets::Core::DockWidget::tabIndex();
}
QString DockWidget_wrapper::title() const
{
    return ::KDDockWidgets::Core::DockWidget::title();
}
KDDockWidgets::Core::TitleBar *DockWidget_wrapper::titleBar() const
{
    return ::KDDockWidgets::Core::DockWidget::titleBar();
}
void DockWidget_wrapper::titleChanged(const QString &title)
{
    ::KDDockWidgets::Core::DockWidget::titleChanged(title);
}
QString DockWidget_wrapper::tr(const char *s, const char *c, int n)
{
    return ::KDDockWidgets::Core::DockWidget::tr(s, c, n);
}
QString DockWidget_wrapper::uniqueName() const
{
    return ::KDDockWidgets::Core::DockWidget::uniqueName();
}
int DockWidget_wrapper::userType() const
{
    return ::KDDockWidgets::Core::DockWidget::userType();
}
void DockWidget_wrapper::windowActiveAboutToChange(bool activated)
{
    ::KDDockWidgets::Core::DockWidget::windowActiveAboutToChange(activated);
}
DockWidget_wrapper::~DockWidget_wrapper()
{
}

}
}
static KDDockWidgets::Core::DockWidget *fromPtr(void *ptr)
{
    return reinterpret_cast<KDDockWidgets::Core::DockWidget *>(ptr);
}
static KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::DockWidget_wrapper *fromWrapperPtr(void *ptr)
{
    return reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::DockWidget_wrapper *>(ptr);
}
extern "C" {
void c_KDDockWidgets__Core__DockWidget_Finalizer(void *cppObj)
{
    delete reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::DockWidget_wrapper *>(cppObj);
}
void *c_KDDockWidgets__Core__DockWidget__constructor_View_QString_DockWidgetOptions_LayoutSaverOptions(void *view_, const char *uniqueName_, int options_, int layoutSaverOptions_)
{
    auto view = reinterpret_cast<KDDockWidgets::Core::View *>(view_);
    const auto uniqueName = QString::fromUtf8(uniqueName_);
    auto options = static_cast<QFlags<KDDockWidgets::DockWidgetOption>>(options_);
    auto layoutSaverOptions = static_cast<QFlags<KDDockWidgets::LayoutSaverOption>>(layoutSaverOptions_);
    auto ptr = new KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::DockWidget_wrapper(view, uniqueName, options, layoutSaverOptions);
    return reinterpret_cast<void *>(ptr);
}
// aboutToDelete(KDDockWidgets::Core::DockWidget * arg__1)
void c_KDDockWidgets__Core__DockWidget__aboutToDelete_DockWidget(void *thisObj, void *arg__1_)
{
    auto arg__1 = reinterpret_cast<KDDockWidgets::Core::DockWidget *>(arg__1_);
    fromPtr(thisObj)->aboutToDelete(arg__1);
}
// aboutToDeleteOnClose()
void c_KDDockWidgets__Core__DockWidget__aboutToDeleteOnClose(void *thisObj)
{
    fromPtr(thisObj)->aboutToDeleteOnClose();
}
// actualTitleBarChanged()
void c_KDDockWidgets__Core__DockWidget__actualTitleBarChanged(void *thisObj)
{
    fromPtr(thisObj)->actualTitleBarChanged();
}
// addDockWidgetAsTab(KDDockWidgets::Core::DockWidget * other, KDDockWidgets::InitialOption initialOption)
void c_KDDockWidgets__Core__DockWidget__addDockWidgetAsTab_DockWidget_InitialOption(void *thisObj, void *other_, void *initialOption_)
{
    auto other = reinterpret_cast<KDDockWidgets::Core::DockWidget *>(other_);
    assert(initialOption_);
    auto &initialOption = *reinterpret_cast<KDDockWidgets::InitialOption *>(initialOption_);
    fromPtr(thisObj)->addDockWidgetAsTab(other, initialOption);
}
// addDockWidgetToContainingWindow(KDDockWidgets::Core::DockWidget * other, KDDockWidgets::Location location, KDDockWidgets::Core::DockWidget * relativeTo, KDDockWidgets::InitialOption initialOption)
void c_KDDockWidgets__Core__DockWidget__addDockWidgetToContainingWindow_DockWidget_Location_DockWidget_InitialOption(void *thisObj, void *other_, int location, void *relativeTo_, void *initialOption_)
{
    auto other = reinterpret_cast<KDDockWidgets::Core::DockWidget *>(other_);
    auto relativeTo = reinterpret_cast<KDDockWidgets::Core::DockWidget *>(relativeTo_);
    assert(initialOption_);
    auto &initialOption = *reinterpret_cast<KDDockWidgets::InitialOption *>(initialOption_);
    fromPtr(thisObj)->addDockWidgetToContainingWindow(other, static_cast<KDDockWidgets::Location>(location), relativeTo, initialOption);
}
// byName(const QString & uniqueName)
void *c_static_KDDockWidgets__Core__DockWidget__byName_QString(const char *uniqueName_)
{
    const auto uniqueName = QString::fromUtf8(uniqueName_);
    return KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::DockWidget_wrapper::byName(uniqueName);
}
// closed()
void c_KDDockWidgets__Core__DockWidget__closed(void *thisObj)
{
    fromPtr(thisObj)->closed();
}
// currentTabIndex() const
int c_KDDockWidgets__Core__DockWidget__currentTabIndex(void *thisObj)
{
    return fromPtr(thisObj)->currentTabIndex();
}
// floatingWindow() const
void *c_KDDockWidgets__Core__DockWidget__floatingWindow(void *thisObj)
{
    return fromPtr(thisObj)->floatingWindow();
}
// forceClose()
void c_KDDockWidgets__Core__DockWidget__forceClose(void *thisObj)
{
    fromPtr(thisObj)->forceClose();
}
// groupGeometry() const
void *c_KDDockWidgets__Core__DockWidget__groupGeometry(void *thisObj)
{
    return new Dartagnan::ValueWrapper<QRect> { fromPtr(thisObj)->groupGeometry() };
}
// guestViewChanged()
void c_KDDockWidgets__Core__DockWidget__guestViewChanged(void *thisObj)
{
    fromPtr(thisObj)->guestViewChanged();
}
// hasPreviousDockedLocation() const
bool c_KDDockWidgets__Core__DockWidget__hasPreviousDockedLocation(void *thisObj)
{
    return fromPtr(thisObj)->hasPreviousDockedLocation();
}
// iconChanged()
void c_KDDockWidgets__Core__DockWidget__iconChanged(void *thisObj)
{
    fromPtr(thisObj)->iconChanged();
}
// init()
void c_KDDockWidgets__Core__DockWidget__init(void *thisObj)
{
    fromPtr(thisObj)->init();
}
// isCurrentTab() const
bool c_KDDockWidgets__Core__DockWidget__isCurrentTab(void *thisObj)
{
    return fromPtr(thisObj)->isCurrentTab();
}
// isFloating() const
bool c_KDDockWidgets__Core__DockWidget__isFloating(void *thisObj)
{
    return fromPtr(thisObj)->isFloating();
}
// isFloatingChanged(bool arg__1)
void c_KDDockWidgets__Core__DockWidget__isFloatingChanged_bool(void *thisObj, bool arg__1)
{
    fromPtr(thisObj)->isFloatingChanged(arg__1);
}
// isFocused() const
bool c_KDDockWidgets__Core__DockWidget__isFocused(void *thisObj)
{
    return fromPtr(thisObj)->isFocused();
}
// isFocusedChanged(bool arg__1)
void c_KDDockWidgets__Core__DockWidget__isFocusedChanged_bool(void *thisObj, bool arg__1)
{
    fromPtr(thisObj)->isFocusedChanged(arg__1);
}
// isInMainWindow() const
bool c_KDDockWidgets__Core__DockWidget__isInMainWindow(void *thisObj)
{
    return fromPtr(thisObj)->isInMainWindow();
}
// isInSideBar() const
bool c_KDDockWidgets__Core__DockWidget__isInSideBar(void *thisObj)
{
    return fromPtr(thisObj)->isInSideBar();
}
// isMainWindow() const
bool c_KDDockWidgets__Core__DockWidget__isMainWindow(void *thisObj)
{
    return fromPtr(thisObj)->isMainWindow();
}
// isOpen() const
bool c_KDDockWidgets__Core__DockWidget__isOpen(void *thisObj)
{
    return fromPtr(thisObj)->isOpen();
}
// isOpenChanged(bool isOpen)
void c_KDDockWidgets__Core__DockWidget__isOpenChanged_bool(void *thisObj, bool isOpen)
{
    fromPtr(thisObj)->isOpenChanged(isOpen);
}
// isOverlayed() const
bool c_KDDockWidgets__Core__DockWidget__isOverlayed(void *thisObj)
{
    return fromPtr(thisObj)->isOverlayed();
}
// isOverlayedChanged(bool arg__1)
void c_KDDockWidgets__Core__DockWidget__isOverlayedChanged_bool(void *thisObj, bool arg__1)
{
    fromPtr(thisObj)->isOverlayedChanged(arg__1);
}
// isPersistentCentralDockWidget() const
bool c_KDDockWidgets__Core__DockWidget__isPersistentCentralDockWidget(void *thisObj)
{
    return fromPtr(thisObj)->isPersistentCentralDockWidget();
}
// isTabbed() const
bool c_KDDockWidgets__Core__DockWidget__isTabbed(void *thisObj)
{
    return fromPtr(thisObj)->isTabbed();
}
// lastOverlayedSize() const
void *c_KDDockWidgets__Core__DockWidget__lastOverlayedSize(void *thisObj)
{
    return new Dartagnan::ValueWrapper<QSize> { fromPtr(thisObj)->lastOverlayedSize() };
}
// layoutSaverOptions() const
int c_KDDockWidgets__Core__DockWidget__layoutSaverOptions(void *thisObj)
{
    return fromPtr(thisObj)->layoutSaverOptions();
}
// mainWindow() const
void *c_KDDockWidgets__Core__DockWidget__mainWindow(void *thisObj)
{
    return fromPtr(thisObj)->mainWindow();
}
// moveToSideBar()
void c_KDDockWidgets__Core__DockWidget__moveToSideBar(void *thisObj)
{
    fromPtr(thisObj)->moveToSideBar();
}
// onResize(QSize newSize)
void c_KDDockWidgets__Core__DockWidget__onResize_QSize(void *thisObj, void *newSize_)
{
    assert(newSize_);
    auto &newSize = *reinterpret_cast<QSize *>(newSize_);
    fromPtr(thisObj)->onResize(newSize);
}
// open()
void c_KDDockWidgets__Core__DockWidget__open(void *thisObj)
{
    fromPtr(thisObj)->open();
}
// options() const
int c_KDDockWidgets__Core__DockWidget__options(void *thisObj)
{
    return fromPtr(thisObj)->options();
}
// optionsChanged(QFlags<KDDockWidgets::DockWidgetOption> arg__1)
void c_KDDockWidgets__Core__DockWidget__optionsChanged_DockWidgetOptions(void *thisObj, int arg__1_)
{
    auto arg__1 = static_cast<QFlags<KDDockWidgets::DockWidgetOption>>(arg__1_);
    fromPtr(thisObj)->optionsChanged(arg__1);
}
// raise()
void c_KDDockWidgets__Core__DockWidget__raise(void *thisObj)
{
    fromPtr(thisObj)->raise();
}
// removedFromSideBar()
void c_KDDockWidgets__Core__DockWidget__removedFromSideBar(void *thisObj)
{
    fromPtr(thisObj)->removedFromSideBar();
}
// setAffinityName(const QString & name)
void c_KDDockWidgets__Core__DockWidget__setAffinityName_QString(void *thisObj, const char *name_)
{
    const auto name = QString::fromUtf8(name_);
    fromPtr(thisObj)->setAffinityName(name);
}
// setAsCurrentTab()
void c_KDDockWidgets__Core__DockWidget__setAsCurrentTab(void *thisObj)
{
    fromPtr(thisObj)->setAsCurrentTab();
}
// setFloating(bool floats)
bool c_KDDockWidgets__Core__DockWidget__setFloating_bool(void *thisObj, bool floats)
{
    return fromPtr(thisObj)->setFloating(floats);
}
// setFloatingGeometry(QRect geo)
void c_KDDockWidgets__Core__DockWidget__setFloatingGeometry_QRect(void *thisObj, void *geo_)
{
    assert(geo_);
    auto &geo = *reinterpret_cast<QRect *>(geo_);
    fromPtr(thisObj)->setFloatingGeometry(geo);
}
// setMDIPosition(QPoint pos)
void c_KDDockWidgets__Core__DockWidget__setMDIPosition_QPoint(void *thisObj, void *pos_)
{
    assert(pos_);
    auto &pos = *reinterpret_cast<QPoint *>(pos_);
    fromPtr(thisObj)->setMDIPosition(pos);
}
// setMDISize(QSize size)
void c_KDDockWidgets__Core__DockWidget__setMDISize_QSize(void *thisObj, void *size_)
{
    assert(size_);
    auto &size = *reinterpret_cast<QSize *>(size_);
    fromPtr(thisObj)->setMDISize(size);
}
// setMDIZ(int z)
void c_KDDockWidgets__Core__DockWidget__setMDIZ_int(void *thisObj, int z)
{
    fromPtr(thisObj)->setMDIZ(z);
}
// setOptions(QFlags<KDDockWidgets::DockWidgetOption> arg__1)
void c_KDDockWidgets__Core__DockWidget__setOptions_DockWidgetOptions(void *thisObj, int arg__1_)
{
    auto arg__1 = static_cast<QFlags<KDDockWidgets::DockWidgetOption>>(arg__1_);
    fromPtr(thisObj)->setOptions(arg__1);
}
// setParentView_impl(KDDockWidgets::Core::View * parent)
void c_KDDockWidgets__Core__DockWidget__setParentView_impl_View(void *thisObj, void *parent_)
{
    auto parent = reinterpret_cast<KDDockWidgets::Core::View *>(parent_);
    fromWrapperPtr(thisObj)->setParentView_impl_nocallback(parent);
}
// setTitle(const QString & title)
void c_KDDockWidgets__Core__DockWidget__setTitle_QString(void *thisObj, const char *title_)
{
    const auto title = QString::fromUtf8(title_);
    fromPtr(thisObj)->setTitle(title);
}
// setUserType(int userType)
void c_KDDockWidgets__Core__DockWidget__setUserType_int(void *thisObj, int userType)
{
    fromPtr(thisObj)->setUserType(userType);
}
// show()
void c_KDDockWidgets__Core__DockWidget__show(void *thisObj)
{
    fromPtr(thisObj)->show();
}
// skipsRestore() const
bool c_KDDockWidgets__Core__DockWidget__skipsRestore(void *thisObj)
{
    return fromPtr(thisObj)->skipsRestore();
}
// tabIndex() const
int c_KDDockWidgets__Core__DockWidget__tabIndex(void *thisObj)
{
    return fromPtr(thisObj)->tabIndex();
}
// title() const
void *c_KDDockWidgets__Core__DockWidget__title(void *thisObj)
{
    return new Dartagnan::ValueWrapper<QString> { fromPtr(thisObj)->title() };
}
// titleBar() const
void *c_KDDockWidgets__Core__DockWidget__titleBar(void *thisObj)
{
    return fromPtr(thisObj)->titleBar();
}
// titleChanged(const QString & title)
void c_KDDockWidgets__Core__DockWidget__titleChanged_QString(void *thisObj, const char *title_)
{
    const auto title = QString::fromUtf8(title_);
    fromPtr(thisObj)->titleChanged(title);
}
// tr(const char * s, const char * c, int n)
void *c_static_KDDockWidgets__Core__DockWidget__tr_char_char_int(const char *s, const char *c, int n)
{
    return new Dartagnan::ValueWrapper<QString> { KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::DockWidget_wrapper::tr(s, c, n) };
}
// uniqueName() const
void *c_KDDockWidgets__Core__DockWidget__uniqueName(void *thisObj)
{
    return new Dartagnan::ValueWrapper<QString> { fromPtr(thisObj)->uniqueName() };
}
// userType() const
int c_KDDockWidgets__Core__DockWidget__userType(void *thisObj)
{
    return fromPtr(thisObj)->userType();
}
// windowActiveAboutToChange(bool activated)
void c_KDDockWidgets__Core__DockWidget__windowActiveAboutToChange_bool(void *thisObj, bool activated)
{
    fromPtr(thisObj)->windowActiveAboutToChange(activated);
}
void c_KDDockWidgets__Core__DockWidget__destructor(void *thisObj)
{
    delete fromPtr(thisObj);
}
void c_KDDockWidgets__Core__DockWidget__registerVirtualMethodCallback(void *ptr, void *callback, int methodId)
{
    auto wrapper = fromWrapperPtr(ptr);
    switch (methodId) {
    case 827:
        wrapper->m_setParentView_implCallback = reinterpret_cast<KDDockWidgetsBindings_wrappersNS::KDDWBindingsCore::DockWidget_wrapper::Callback_setParentView_impl>(callback);
        break;
    }
}
}
