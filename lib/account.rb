class Account
  attr_reader :balance, :transaction, :statement;

  def initialize
    @balance = 0;
    @transaction = {};
    @statement = [];
  end

  def deposit(amount)
    @balance += amount;
  end

  def withdrawl(amount)
    raise 'insufficient funds available' if (@balance - amount < 0)
    @balance -= amount;
  end
end
