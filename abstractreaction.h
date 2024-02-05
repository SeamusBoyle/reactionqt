// Copyright 2024 Beantrader Pty Ltd

#ifndef ABSTRACTREACTION_H
#define ABSTRACTREACTION_H

#include <QObject>

class AbstractReaction : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool canExecute READ canExecute WRITE setCanExecute NOTIFY canExecuteChanged FINAL)
public:
    explicit AbstractReaction(QObject *parent = nullptr);

    [[nodiscard]] bool canExecute() const;
    void setCanExecute(bool newCanExecute);

    Q_INVOKABLE
    virtual void execute() = 0;

Q_SIGNALS:
    void canExecuteChanged();

private:
    bool m_canExecute{true};
};

#endif // ABSTRACTREACTION_H
