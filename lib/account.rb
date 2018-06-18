class Account
  attr_reader :balance, :transaction;

  def initialize
    @balance = 0;
    @transaction = {};
  end
end
