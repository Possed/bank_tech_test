class Transaction
  attr_reader :transaction;

  def initialize
    @transaction = {};
  end

  def log_deposit(date , credit, balance)
    @transaction[:date] = date;
    @transaction[:credit] = credit;
    @transaction[:debit] = "      ";
    @transaction[:balance] = balance;
  end

  def log_withdrawal(date = Time.now.strftime("%d/%m/%Y"), debit, balance)
    @transaction[:date] = date;
    @transaction[:credit] = "      ";
    @transaction[:debit] = debit;
    @transaction[:balance] = balance;
  end
end
