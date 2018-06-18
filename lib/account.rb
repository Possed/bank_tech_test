class Account
  attr_reader :balance, :transaction, :statement, :amount;

  def initialize
    @balance = 0;
    @transaction = {};
    @statement = [];
  end

  def deposit(amount)
    @amount = amount;
    @balance += amount;
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
