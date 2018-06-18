require_relative 'transaction'

class Account
  attr_reader :balance, :amount, :statement;

  def initialize
    @balance = 0;
    @statement = [];
  end

  def deposit(amount, date = Time.now.strftime("%d %m %Y"), transaction = Transaction.new)
    @amount = amount;
    @balance += amount;
    @transaction = transaction;
    # transaction.add_deposit(date, amount, balance)
  end

  def withdrawl(amount)
    @amount = amount;
    raise 'insufficient funds available' if insufficient_funds?
    @balance -= amount;
  end

  def insufficient_funds?
    @balance - @amount < 0
  end

end
