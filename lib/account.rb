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
    @balance -= amount;
  end
end
