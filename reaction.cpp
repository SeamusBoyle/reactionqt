// Copyright 2024 Beantrader Pty Ltd

#include "reaction.h"

Reaction::Reaction(QObject *parent)
    : AbstractReaction{parent}
{}

QJSValue Reaction::onexecute() const
{
    return m_onexecute;
}

void Reaction::setOnexecute(const QJSValue &newOnexecute)
{
    // JavaScript equality comparison
    if (m_onexecute.equals(newOnexecute)) {
        return;
    }
    m_onexecute = newOnexecute;
    Q_EMIT onexecuteChanged();
}

void Reaction::execute()
{
    if (m_onexecute.isCallable()) {
        m_onexecute.call();
    }
}
