class Account
  attr_reader :balance, :transaction, :statement;

  def initialize
    @balance = 0;
    @transaction = {};
    @statement = {};
  end
end
