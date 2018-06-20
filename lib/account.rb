require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance, :amount, :acc_statement, :transactions;

  def initialize
    @balance = 0;
    @acc_statement = Statement.new;
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"), transactions = Transaction.new)
    raise 'Amount is invalid. Please enter a number greater than 0' if is_amount_valid?(amount)
    add_to_balance(amount)
    @transactions = transactions
    @transactions.log_deposit(date, amount, balance)
    @acc_statement.add_to_statement(@transactions.transaction)
  end

  def withdrawal(amount, date = Time.now.strftime("%d/%m/%Y"), transactions = Transaction.new)
    raise 'insufficient funds available' if insufficient_funds?(amount)
    remove_from_balance(amount)
    @transactions = transactions
    @transactions.log_withdrawal(date, amount, balance)
    @acc_statement.add_to_statement(@transactions.transaction)
  end

  private
  def insufficient_funds?(amount)
    balance - amount < 0
  end

  def is_amount_valid?(amount)
    !(amount.is_a? Integer) || amount < 0
  end

  def add_to_balance(amount)
    @balance += amount
  end

  def remove_from_balance(amount)
    @balance -= amount
  end

end
