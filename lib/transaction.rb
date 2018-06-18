class Transaction
  attr_reader :transaction;

  def initialize
    @transaction = {};
  end

  def log_deposit(date = Time.now.strftime("%d/%m/%Y"), credit, balance)
    @transaction[:date] = date;
    @transaction[:credit] = credit;
    @transaction[:balance] = balance;
  end

end
