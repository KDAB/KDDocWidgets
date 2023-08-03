/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#pragma once

#include <QPointer>

namespace KDDockWidgets::Core {

class DelayedCall
{
public:
    virtual ~DelayedCall();
    virtual void call() = 0;
};


class DelayedDelete : public DelayedCall
{
public:
    DelayedDelete(QObject *obj);
    ~DelayedDelete() override;

    void call() override;

private:
    QPointer<QObject> m_object;
};

}