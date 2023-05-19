/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2020-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#pragma once

#include "kddockwidgets/docks_export.h"
#include "kddockwidgets/KDDockWidgets.h"
#include "Controller.h"

#include <QSize>
#include <QRect>

#include <memory>

QT_BEGIN_NAMESPACE
class QPainter;
QT_END_NAMESPACE

namespace KDDockWidgets {

using HANDLE = const void *;
using WId = quintptr;

namespace Core {

class Item;
class EventFilterInterface;
class Controller;
class Screen;
class Window;
class MDILayout;
class DropArea;
class DockWidget;
class FloatingWindow;
class Group;
class Layout;
class Stack;
class TabBar;
class TitleBar;
class MainWindow;

class DOCKS_EXPORT View
{
public:
    explicit View(Controller *controller, ViewType);
    virtual ~View();

    virtual void init()
    {
    }

    /// @brief Returns a handle for the GUI element
    /// This value only makes sense to the frontend. For example, for QtQuick it might be a
    /// QQuickItem, while for QtWidgets it's a QWidget *. Can be whatever the frontend developer
    /// wants, as long as it uniquely identifies the GUI element. KDDW backend only uses it for
    /// comparison purposes
    virtual HANDLE handle() const = 0;

    /// @brief Returns whether the gui item represented by this view was already deleted
    /// Usually false, as KDDW internal gui elements inherit View, and nobody will access them after
    /// destruction. However, ViewWrapper derived classes, wrap an existing gui element, which might
    /// get deleted. Override isNull() in our ViewWrapper subclasses and return true if the wrapped
    /// gui element was already deleted
    virtual bool isNull() const;

    virtual void setParent(View *) = 0;
    virtual QSize sizeHint() const;
    virtual QSize minSize() const = 0;
    virtual void setMinimumSize(QSize) = 0;
    virtual int minimumWidth() const
    {
        return minSize().width();
    }

    virtual int minimumHeight() const
    {
        return minSize().height();
    }

    virtual Qt::FocusPolicy focusPolicy() const = 0;
    virtual bool hasFocus() const = 0;
    virtual QSize maxSizeHint() const = 0;
    virtual QRect geometry() const = 0;
    virtual QRect normalGeometry() const = 0;
    virtual void setGeometry(QRect) = 0;
    virtual bool isVisible() const = 0;
    virtual bool isExplicitlyHidden() const = 0;
    virtual void setVisible(bool) = 0;
    virtual void move(int x, int y) = 0;
    virtual void setSize(int width, int height) = 0;
    virtual void setWidth(int width) = 0;
    virtual void setHeight(int height) = 0;
    virtual void show() = 0;
    virtual void hide() = 0;
    virtual void update() = 0;
    virtual void raiseAndActivate() = 0;
    virtual void raise() = 0;
    virtual void activateWindow() = 0;
    virtual bool isRootView() const = 0;
    virtual QPoint mapToGlobal(QPoint) const = 0;
    virtual QPoint mapFromGlobal(QPoint) const = 0;
    virtual QPoint mapTo(View *, QPoint) const = 0;
    virtual void setSizePolicy(SizePolicy, SizePolicy) = 0;
    virtual SizePolicy verticalSizePolicy() const = 0;
    virtual SizePolicy horizontalSizePolicy() const = 0;
    virtual bool close() = 0;
    virtual void setFlag(Qt::WindowType, bool = true) = 0;
    virtual void setAttribute(Qt::WidgetAttribute, bool enable = true) = 0;
    virtual bool testAttribute(Qt::WidgetAttribute) const = 0;
    virtual Qt::WindowFlags flags() const = 0;
    virtual void setWindowTitle(const QString &title) = 0;
    virtual void setWindowIcon(const Icon &) = 0;

    /// @brief Installs an event filter in this view to intercept the event it receives
    /// Analogue to QObject::installEventFilter() in the Qt world
    /// @sa removeViewEventFilter
    void installViewEventFilter(EventFilterInterface *);

    /// @brief Removes the event filter
    void removeViewEventFilter(EventFilterInterface *);

    /// @brief Delivers mouse events and such to event filters
    bool deliverViewEventToFilters(Event *e);

    // TODOm3: Move these to Window instead
    virtual void showNormal() = 0;
    virtual void showMinimized() = 0;
    virtual void showMaximized() = 0;
    virtual bool isMinimized() const = 0;
    virtual bool isMaximized() const = 0;

    virtual void createPlatformWindow();
    virtual void setMaximumSize(QSize sz) = 0;
    virtual bool isActiveWindow() const = 0;
    virtual void setFixedWidth(int) = 0;
    virtual void setFixedHeight(int) = 0;
    virtual void grabMouse() = 0;
    virtual void releaseMouse() = 0;
    virtual void releaseKeyboard() = 0;
    virtual void setFocus(Qt::FocusReason) = 0;
    virtual void setFocusPolicy(Qt::FocusPolicy) = 0;
    virtual void setWindowOpacity(double) = 0;
    virtual void setCursor(Qt::CursorShape) = 0;
    virtual void setMouseTracking(bool) = 0;

    virtual bool onResize(int h, int w);
    bool onResize(QSize);

    virtual bool onFocusInEvent(FocusEvent *)
    {
        return false;
    }

    virtual QVariant property(const char *) const = 0;
    virtual void setObjectName(const QString &) = 0;
    virtual QString objectName() const = 0;
    virtual void render(QPainter *) = 0;

    virtual std::shared_ptr<View> childViewAt(QPoint localPos) const = 0;

    /// @brief Returns the top-level gui element which this view is inside
    /// It's the root view of the window.
    virtual std::shared_ptr<View> rootView() const = 0;

    /// @brief Returns the window this view is inside
    /// For the Qt frontend, this wraps a QWindow.
    /// Like QWidget::window()
    virtual std::shared_ptr<Core::Window> window() const = 0;

    /// @brief Returns the gui element's parent. Like QWidget::parentWidget()
    virtual std::shared_ptr<View> parentView() const = 0;

    /// @brief Returns this view, but as a wrapper
    virtual std::shared_ptr<View> asWrapper() = 0;

    /// @brief Returns whether the view is of the specified type
    /// Virtual so it can be overridden by ViewWrapper. When we're wrapping an existing GUI element
    /// only the specific frontend can know what's the actual type
    virtual bool is(ViewType) const;

    /// @brief Sets the z order
    /// Not supported on all platforms
    virtual void setZOrder(int)
    {
    }

    /// @Returns a list of child views
    virtual QVector<std::shared_ptr<View>> childViews() const = 0;

    /// @brief Returns this view's controller
    Controller *controller() const;

    ///@brief returns an id for corelation purposes for saving layouts
    QString id() const;

    ///@brief Returns the type of this view
    ViewType type() const;

    /// @brief Deletes this view and marks it as being deleted to avoid controller deleting it
    void free();

    /// @brief Returns whether free() has already been called
    bool freed() const;

    /// @brief Returns whether the DTOR is currently running. freed() might be true while inDtor
    /// false, as the implementation of free() is free to delay it (with deleteLater() for example)
    bool inDtor() const;

    /// @brief Returns whether this view represents the same GUI element as the other
    bool equals(const View *other) const;
    bool equals(const std::shared_ptr<View> &) const;
    static bool equals(const View *one, const View *two);

    std::shared_ptr<Screen> screen() const;

    /// @brief Returns the views's geometry, but always in global space
    QRect globalGeometry() const;

    QPoint pos() const;
    QSize size() const;
    QRect rect() const;
    int x() const;
    int y() const;
    int height() const;
    int width() const;
    void resize(QSize);
    void resize(int w, int h);
    void move(QPoint);
    void setSize(QSize);

    /// @brief Convenience. See Window::transientWindow().
    std::shared_ptr<Core::Window> transientWindow() const;

    void closeRootView();
    QRect windowGeometry() const;
    QSize parentSize() const;

    static QSize hardcodedMinimumSize();
    static QSize boundedMaxSize(QSize min, QSize max);

    /// @brief if this view is a FloatingWindow, then returns its controller
    /// Mostly to save the call sites from having too many casts
    Core::FloatingWindow *asFloatingWindowController() const;
    Core::Group *asGroupController() const;
    Core::TitleBar *asTitleBarController() const;
    Core::TabBar *asTabBarController() const;
    Core::Stack *asStackController() const;
    Core::DockWidget *asDockWidgetController() const;
    Core::MainWindow *asMainWindowController() const;
    Core::DropArea *asDropAreaController() const;
    Core::MDILayout *asMDILayoutController() const;
    Core::Layout *asLayout() const;

    /// @brief returns whether this view is inside the specified window
    bool isInWindow(std::shared_ptr<Core::Window> window) const;

    /// @brief If true, it means destruction hasn't happen yet but is about to happen.
    /// Useful when a controller is under destructions and wants all related views to stop painting
    /// or doing anything that would call back into the controller. If false, it doesn't mean
    /// anything, as not all controllers are using this.
    void setAboutToBeDestroyed();
    bool aboutToBeDestroyed() const;

    void dumpDebug();

    /// optional, for debug purposes
    virtual QDebug toQDebug(QDebug &deb) const
    {
        return deb;
    }

    /// @brief Returns the controller of the first parent view of the specified type
    /// Goes up the view hierarchy chain until it finds it. Returns nullptr otherwise.
    static Controller *firstParentOfType(View *view, ViewType);

    /// @overload
    Controller *firstParentOfType(ViewType) const;

    void requestClose(CloseEvent *);

public:
    class Private;
    Private *const d;

protected:
    Controller *const m_controller;
    bool m_inDtor = false;

#ifdef KDDW_FRONTEND_FLUTTER
    // Little workaround so flutter has the same deletion order as Qt.
    // In Qt we have this order of deletion
    //    1. ~Core::View() deletes the controller
    //    2. ~QObject deletes children views
    // But in Flutter, we don't have ~QObject, so we were deleting children views inside ~flutter::View
    // which runs before ~Core::View() not after, causing different deletion ordering, thus different behaviour
    // and different bugs. Let's keep both frontends consistent predictable.

    // No shared pointers, as lifetime is managed by parent-children relationship (as in QObject)
    QVector<Core::View *> m_childViews;
#endif

private:
    bool m_freed = false;
    bool m_aboutToBeDestroyed = false;
    const QString m_id;
    const ViewType m_type;
};

/// for debug purposes
inline QDebug operator<<(QDebug deb, View *view)
{
    if (!view)
        return deb;

    view->toQDebug(deb);
    return deb;
}

}

}
