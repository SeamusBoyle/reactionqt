// Copyright 2024 Beantrader Pty Ltd

#include "abstractreaction.h"

AbstractReaction::AbstractReaction(QObject *parent)
    : QObject{parent}
{}

bool AbstractReaction::canExecute() const
{
    return m_canExecute;
}

void AbstractReaction::setCanExecute(bool newCanExecute)
{
    if (m_canExecute == newCanExecute) {
        return;
    }
    m_canExecute = newCanExecute;
    Q_EMIT canExecuteChanged();
}
