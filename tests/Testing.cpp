/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2020 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#include "Testing.h"
#include "MainWindow.h"
#include "DockRegistry_p.h"

#include <QApplication>
#include <QtTest>
#include <QLoggingCategory>
#include <QElapsedTimer>

using namespace KDDockWidgets;
using namespace KDDockWidgets::Testing;

extern quintptr Q_CORE_EXPORT qtHookData[];
static QString s_expectedWarning;
static WarningObserver *s_warningObserver = nullptr;
static QtMessageHandler s_original = nullptr;

class EventFilter : public QObject
{
public:
    EventFilter(QEvent::Type type) : m_type(type) {}
    bool eventFilter(QObject *, QEvent *e)
    {
        if (e->type() == m_type)
            m_got = true;

        return false;
    }

    const QEvent::Type m_type;
    bool m_got = false;
};

static bool isGammaray()
{
    static bool is = qtHookData[3] != 0;
    return is;
}

static bool shouldBlacklistWarning(const QString &msg, const QString &category)
{
    if (category == QLatin1String("qt.qpa.xcb"))
        return true;

    return msg.contains(QLatin1String("QSocketNotifier: Invalid socket")) ||
           msg.contains(QLatin1String("QWindowsWindow::setGeometry")) ||
           msg.contains(QLatin1String("This plugin does not support")) ||
           msg.contains(QLatin1String("Note that Qt no longer ships fonts")) ||
           msg.contains(QLatin1String("Another dock KDDockWidgets::DockWidget")) ||
           msg.contains(QLatin1String("There's multiple MainWindows, not sure what to do about parenting")) ||
           msg.contains(QLatin1String("Testing::")) ||
           msg.contains(QLatin1String("outside any known screen, using primary screen"));
}

static void fatalWarningsMessageHandler(QtMsgType t, const QMessageLogContext &context, const QString &msg)
{
    if (shouldBlacklistWarning(msg, QLatin1String(context.category)))
        return;

    s_original(t, context, msg);
    if (t == QtWarningMsg) {

        if (!s_expectedWarning.isEmpty() && msg.contains(s_expectedWarning))
            return;

        if (!isGammaray() && !qEnvironmentVariableIsSet("NO_FATAL")) {

            if (s_warningObserver)
                s_warningObserver->onFatal();

            qFatal("Got a warning, category=%s", context.category);
        }
    }
}

bool Testing::waitForEvent(QWidgetOrQuick *w, QEvent::Type type, int timeout)
{
    EventFilter filter(type);
    w->installEventFilter(&filter);
    QElapsedTimer time;
    time.start();

    while (!filter.m_got && time.elapsed() < timeout) {
        qApp->processEvents();
        QTest::qWait(50);
    }

    return filter.m_got;
}

bool Testing::waitForDeleted(QObject *o, int timeout)
{
    if (!o)
        return true;

    QPointer<QObject> ptr = o;
    QElapsedTimer time;
    time.start();

    while (ptr && time.elapsed() < timeout) {
        qApp->processEvents();
        QTest::qWait(50);
    }

    const bool wasDeleted = !ptr;
    return wasDeleted;
}

bool Testing::waitForResize(QWidgetOrQuick *w, int timeout)
{
    return waitForEvent(w, QEvent::Resize, timeout);
}

HostedWidget::~HostedWidget() {}

void Testing::installFatalMessageHandler()
{
    s_original = qInstallMessageHandler(fatalWarningsMessageHandler);
}

void Testing::setExpectedWarning(const QString &expected)
{
    s_expectedWarning = expected;
}

void Testing::setWarningObserver(WarningObserver *observer)
{
    s_warningObserver = observer;
}
