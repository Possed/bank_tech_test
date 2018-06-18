require_relative 'transaction'

class Account
  attr_reader :balance, :amount, :statement, :transactions;

  def initialize
    @balance = 0;
    @statement = [];
  end

  def deposit(amount, transactions = Transaction.new)
    @balance += amount;
    @transactions = transactions
    @transactions.log_deposit(amount, balance)
  end

  def withdrawl(amount, transactions = Transaction.new)
    @amount = amount;
    raise 'insufficient funds available' if insufficient_funds?
    @balance -= amount;
    @transactions = transactions;
    @transactions.log_withdrawal(amount, balance)
  end

  def insufficient_funds?
    @balance - @amount < 0
  end

end
