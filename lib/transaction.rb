class Transaction
  attr_reader :transaction_details;

  def initialize
    @transaction_details = {};
  end

  def log_deposit(date , credit, balance)
    @transaction_details[:date] = date;
    @transaction_details[:credit] = credit;
    @transaction_details[:debit] = "      ";
    @transaction_details[:balance] = balance;
  end

  def log_withdrawal(date = Time.now.strftime("%d/%m/%Y"), debit, balance)
    @transaction_details[:date] = date;
    @transaction_details[:credit] = "      ";
    @transaction_details[:debit] = debit;
    @transaction_details[:balance] = balance;
  end
end
