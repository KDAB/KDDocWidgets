/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2020-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#pragma once

#include "kddockwidgets/core/Controller.h"
#include "kddockwidgets/core/View.h"

#include <QDebug>

#include <memory>

namespace KDDockWidgets::flutter {

class View;

class DOCKS_EXPORT ViewWrapper : public Core::View
{
public:
    using Core::View::close;
    using Core::View::height;
    using Core::View::minimumHeight;
    using Core::View::minimumWidth;
    using Core::View::rect;
    using Core::View::resize;
    using View::width;

    static std::shared_ptr<Core::View> create(flutter::View *wrapped);
    ~ViewWrapper() override;

    QSize sizeHint() const override;
    QSize minSize() const override;
    QSize maxSizeHint() const override;
    QRect geometry() const override;
    QRect normalGeometry() const override;
    void setNormalGeometry(QRect geo);
    void setGeometry(QRect geometry) override;
    void setMaximumSize(QSize sz) override;

    bool isVisible() const override;
    void setVisible(bool visible) override;
    bool isExplicitlyHidden() const override;

    void move(int x, int y) override;
    void setSize(int w, int h) override;

    void setWidth(int w) override;
    void setHeight(int h) override;
    void setFixedWidth(int w) override;
    void setFixedHeight(int h) override;
    void show() override;
    void hide() override;
    void updateGeometry();
    void update() override;
    void setParent(Core::View *parent) override;
    void raiseAndActivate() override;
    void activateWindow() override;
    void raise() override;
    QVariant property(const char *name) const override;
    bool isRootView() const override;
    QPoint mapToGlobal(QPoint localPt) const override;
    QPoint mapFromGlobal(QPoint globalPt) const override;
    QPoint mapTo(Core::View *parent, QPoint pos) const override;
    void setWindowOpacity(double v) override;
    void setSizePolicy(SizePolicy hPolicy, SizePolicy vPolicy) override;
    SizePolicy verticalSizePolicy() const override;
    SizePolicy horizontalSizePolicy() const override;

    bool onResize(int w, int h) override;

    bool close() override;
    void setFlag(Qt::WindowType f, bool on = true) override;
    void setAttribute(Qt::WidgetAttribute attr, bool enable = true) override;
    bool testAttribute(Qt::WidgetAttribute attr) const override;
    Qt::WindowFlags flags() const override;

    void setWindowTitle(const QString &title) override;
    void setWindowIcon(const Icon &icon) override;
    bool isActiveWindow() const override;

    void showNormal() override;
    void showMinimized() override;
    void showMaximized() override;

    bool isMinimized() const override;
    bool isMaximized() const override;

    std::shared_ptr<Core::Window> window() const override;
    std::shared_ptr<Core::View> childViewAt(QPoint p) const override;
    std::shared_ptr<Core::View> rootView() const override;
    std::shared_ptr<Core::View> parentView() const override;
    std::shared_ptr<Core::View> asWrapper() override;

    void setObjectName(const QString &name) override;
    void grabMouse() override;
    void releaseMouse() override;
    void releaseKeyboard() override;
    void setFocus(Qt::FocusReason reason) override;
    Qt::FocusPolicy focusPolicy() const override;
    bool hasFocus() const override;
    void setFocusPolicy(Qt::FocusPolicy policy) override;
    QString objectName() const override;
    void setMinimumSize(QSize sz) override;
    void render(QPainter *) override;
    void setCursor(Qt::CursorShape shape) override;
    void setMouseTracking(bool enable) override;
    QVector<std::shared_ptr<Core::View>> childViews() const override;
    void setZOrder(int z) override;
    HANDLE handle() const override;

    bool is(Core::ViewType) const override;

private:
    explicit ViewWrapper(flutter::View *wrapped);
    void setWeakPtr(std::weak_ptr<ViewWrapper> thisPtr);
    flutter::View *const m_wrappedView = nullptr;
    std::weak_ptr<ViewWrapper> m_thisWeakPtr;
    Q_DISABLE_COPY(ViewWrapper)
};

} // namespace KDDockWidgets::flutter
