// Copyright 2024 Beantrader Pty Ltd

#ifndef REACTION_H
#define REACTION_H

#include "abstractreaction.h"

#include <QJSValue>
#include <QQmlEngine>

class Reaction : public AbstractReaction
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QJSValue onexecute READ onexecute WRITE setOnexecute NOTIFY onexecuteChanged FINAL)
public:
    explicit Reaction(QObject *parent = nullptr);

    [[nodiscard]] QJSValue onexecute() const;
    void setOnexecute(const QJSValue &newOnexecute);

    void execute() override;

Q_SIGNALS:
    void onexecuteChanged();

private:
    QJSValue m_onexecute;
};

#endif // REACTION_H
