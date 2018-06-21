require 'account'

describe Account do
  let(:test_acc_statement) { double :test_acc_statement, statement: [], add_to_statement: [{ date: '18/06/2018', credit: 5, balance: 10 }] }
  let(:test_transaction) { double :test_transaction, transaction_details: { :date => "19/06/2018", :credit => "10.00", :debit => "      ", :balance => "10.00" }, log_deposit: { date: "19/06/2018", credit: "10.00", debit: "      ", balance: "10.00" },
    log_withdrawal: { :date => "19/06/2018", :credit => "      ", :debit => "0.00", :balance => "0.00" }, withdrawal_transaction_details: { :date => "19/06/2018", :credit => "      ", :debit => "0.00", :balance => "0.00" }
  }

  before(:each) do
    allow(Statement).to receive(:new).and_return(test_acc_statement)
    allow(Transaction).to receive(:new).and_return(test_transaction)
  end

  describe '#initialize' do
    it 'initializes a new account with balance 0' do
      expect(subject.balance).to equal(0)
    end

    it 'initializes a new account with an empty history of transactions' do
      expect(subject.acc_statement.statement).to eq([])
    end
  end

  describe '#deposit' do
    it 'adds a given amount to the total balance' do
      subject.deposit(5)
      expect(subject.balance).to eq(5)
    end

    it 'raises an error if the amount is less than 0' do
      expect { subject.deposit(-5) }.to raise_error 'Amount is invalid. Please enter a number greater than 0'
    end

    it 'raises an error if the amount is not an integer' do
      expect { subject.deposit("five") }.to raise_error 'Amount is invalid. Please enter a number greater than 0'
    end

    it 'creates a transaction with the deposit details' do

      subject.deposit(10, "19/06/2018")
      expect(subject.new_transaction.transaction_details).to eq({ date: "19/06/2018", credit: "10.00", debit: "      ", balance: "10.00" })
    end
  end

  describe '#withdrawal' do
    it 'substracts a given amount from the total balance' do
      subject.deposit(15)
      subject.withdrawal(5)
      expect(subject.balance).to eq(10)
    end

    it 'will raise an error if you want to withdrawal more money than available' do
      expect { subject.withdrawal(5) }.to raise_error 'insufficient funds available'
    end

    it 'created a transaction with the deposit details' do
      subject.withdrawal(0, "19/06/2018")
      expect(subject.new_transaction.withdrawal_transaction_details).to eq({ :date => "19/06/2018", :credit => "      ", :debit => "0.00", :balance => "0.00" })
    end
  end
end
