require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance, :amount, :acc_statement, :new_transaction;
  ERR1 = 'Amount is invalid. Please enter a number greater than 0'
  ERR2 = 'insufficient funds available'
  def initialize(acc_statement = Statement.new)
    @balance = 0
    @acc_statement = acc_statement
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"), new_transaction = Transaction.new)
    raise ERR1 if amount_valid?(amount)
    add_to_balance(amount)
    @new_transaction = new_transaction
    @new_transaction.log_deposit(date, amount, balance)
    @acc_statement.add_to_statement(@new_transaction.transaction_details)
  end

  def withdrawal(amount, date = Time.now.strftime("%d/%m/%Y"), new_transaction = Transaction.new)
    raise ERR2 if insufficient_funds?(amount)
    remove_from_balance(amount)
    @new_transaction = new_transaction
    @new_transaction.log_withdrawal(date, amount, balance)
    @acc_statement.add_to_statement(@new_transaction.transaction_details)
  end

  private
  def insufficient_funds?(amount)
    balance - amount < 0
  end

  def amount_valid?(amount)
    !(amount.is_a? Integer) || amount < 0
  end

  def add_to_balance(amount)
    @balance += amount
  end

  def remove_from_balance(amount)
    @balance -= amount
  end

end
