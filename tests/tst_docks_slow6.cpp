/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

// We don't care about performance related checks in the tests
// clazy:excludeall=ctor-missing-parent-argument,missing-qobject-macro,range-loop,missing-typeinfo,detaching-member,function-args-by-ref,non-pod-global-static,reserve-candidates,qstring-allocations

// A test that was extracted out from tst_docks.cpp as it was too slow
// By using a separate executable it can be paralellized by ctest.

#include "utils.h"
#include "Config.h"
#include "LayoutSaver_p.h"
#include "Position_p.h"
#include "WindowBeingDragged_p.h"
#include "multisplitter/Item_p.h"
#include "kddockwidgets/core/ViewFactory.h"
#include "Action.h"
#include "kddockwidgets/core/MDILayout.h"
#include "kddockwidgets/core/DropArea.h"
#include "kddockwidgets/core/MainWindow.h"
#include "kddockwidgets/core/DockWidget.h"
#include "kddockwidgets/core/DockWidget_p.h"
#include "kddockwidgets/core/Separator.h"
#include "kddockwidgets/core/TabBar.h"
#include "kddockwidgets/core/Stack.h"
#include "kddockwidgets/core/SideBar.h"
#include "kddockwidgets/core/Platform.h"

#include <QtTest/QTest>

using namespace KDDockWidgets;
using namespace KDDockWidgets::Core;
using namespace Layouting;
using namespace KDDockWidgets::Tests;

class TestDocks : public QObject
{
    Q_OBJECT

public Q_SLOTS:
    void initTestCase()
    {
        KDDockWidgets::Core::Platform::instance()->installMessageHandler();
    }

    void cleanupTestCase()
    {
        KDDockWidgets::Core::Platform::instance()->uninstallMessageHandler();
    }

private Q_SLOTS:
    void tst_isFocused();
};

void TestDocks::tst_isFocused()
{
    EnsureTopLevelsDeleted e;

    // 1. Create 2 floating windows
    auto dock1 = createDockWidget(QStringLiteral("dock1"),
                                  Platform::instance()->tests_createFocusableView({ true }));
    auto dock2 = createDockWidget(QStringLiteral("dock2"),
                                  Platform::instance()->tests_createFocusableView({ true }));

    QTest::qWait(200); // macOS is flaky here, needs dock2 to be shown first before focusing dock1,
                       // otherwise dock1 looses again

    dock1->window()->move(400, 200);

    // 2. Raise dock1 and focus its line edit
    dock1->raise();
    dock1->guestView()->setFocus(Qt::OtherFocusReason);
    Platform::instance()->tests_waitForEvent(dock1->guestView().get(), Event::FocusIn);

    QVERIFY(dock1->isFocused());
    QVERIFY(!dock2->isFocused());

    // 3. Raise dock2 and focus its line edit
    dock2->view()->raiseAndActivate();
    if (!dock2->window()->window()->isActive())
        Platform::instance()->tests_waitForEvent(dock2->view()->window(), Event::WindowActivate);

    dock2->guestView()->setFocus(Qt::OtherFocusReason);
    Platform::instance()->tests_waitForEvent(dock1->guestView().get(), Event::FocusIn);

    QVERIFY(!dock1->isFocused());
    QVERIFY(dock2->guestView()->hasFocus());
    QVERIFY(dock2->isFocused());

    // 4. Tab dock1, it's current tab now
    auto oldFw1 = dock1->window();
    dock2->addDockWidgetAsTab(dock1);
    QVERIFY(dock1->isFocused());
    QVERIFY(!dock2->isFocused());

    // 5. Set dock2 as current tab again
    dock2->raise();
    QVERIFY(!dock1->isFocused());
    QVERIFY(dock2->isFocused());

    // 6. Create dock3, focus it
    auto dock3 = createDockWidget(QStringLiteral("dock3"),
                                  Platform::instance()->tests_createFocusableView({ true }));
    auto oldFw3 = dock3->window();
    dock3->raise();
    dock3->guestView()->setFocus(Qt::OtherFocusReason);
    Platform::instance()->tests_waitForEvent(dock1->guestView().get(), Event::FocusIn);
    QVERIFY(!dock1->isFocused());
    QVERIFY(!dock2->isFocused());
    QVERIFY(dock3->isFocused());

    // 4. Add dock3 to the 1st window, nested, focus 2 again
    dock2->addDockWidgetToContainingWindow(dock3, Location_OnLeft);
    dock2->raise();
    dock2->guestView()->setFocus(Qt::OtherFocusReason);
    Platform::instance()->tests_waitForEvent(dock2->guestView().get(), Event::FocusIn);
    QVERIFY(!dock1->isFocused());
    QVERIFY(dock2->isFocused());
    QVERIFY(!dock3->isFocused());
}

#include "tst_docks_main.h"

#include <tst_docks_slow6.moc>
