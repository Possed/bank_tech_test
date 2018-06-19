require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance, :amount, :acc_statement, :transactions;

  def initialize
    @balance = 0;
    @acc_statement = Statement.new;
  end

  def deposit(amount, transactions = Transaction.new)
    @amount = amount;
    add_to_balance
    @transactions = transactions;
    @transactions.log_deposit(amount, balance)
    @acc_statement.add_to_statement(@transactions.transaction)
  end

  def withdrawal(amount, transactions = Transaction.new)
    @amount = amount;
    raise 'insufficient funds available' if insufficient_funds?
    remove_from_balance;
    @transactions = transactions;
    @transactions.log_withdrawal(amount, balance)
    @acc_statement.add_to_statement(@transactions.transaction)
  end

  def insufficient_funds?
    balance - amount < 0
  end

  def add_to_balance
    @balance += amount
  end

  def remove_from_balance
    @balance -= amount
  end
end
