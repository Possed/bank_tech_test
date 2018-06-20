require 'account'
require 'transaction'

describe Account do
  describe '#initialize' do
    it 'initializes a new account with balance 0' do
      expect(subject.balance).to equal(0)
    end

    it 'initializes a new account with an instance of the Statement class' do
      expect(subject.acc_statement).to be_an_instance_of(Statement);
    end

    it 'initializes a new account with an empty history of transactions' do
      expect(subject.acc_statement.statement).to be_empty
    end
  end


  describe '#deposit' do
    it 'adds a given amount to the total balance' do
      subject.deposit(5)
      expect(subject.balance).to eq(5)
    end

    it 'raises an error if the amount is less than 0' do
      expect{subject.deposit(-5)}.to raise_error 'Amount is invalid. Please enter a number greater than 0'
    end

    it 'raises an error if the amount is not an integer' do
      expect{subject.deposit("five")}.to raise_error 'Amount is invalid. Please enter a number greater than 0'
    end

    it 'creates a new transaction instance' do
      subject.deposit(5)
      expect(subject.new_transaction).to be_an_instance_of(Transaction)
    end

    it 'creates a transaction with the deposit details' do
      subject.deposit(10, "19/06/2018")
      expect(subject.new_transaction.transaction_details).to eq({date: "19/06/2018", credit: 10, debit:"      ", balance: 10})
    end
  end



  describe '#withdrawal' do
    it 'substracts a given amount from the total balance' do
      subject.deposit(15)
      subject.withdrawal(5)
      expect(subject.balance).to eq(10)
    end

    it 'will raise an error if you want to withdrawal more money than available' do
      expect{subject.withdrawal(5)}.to raise_error 'insufficient funds available'
    end

    it 'creates a new transaction instance' do
      subject.withdrawal(0)
      expect(subject.new_transaction).to be_an_instance_of(Transaction)
    end

    it 'created a transaction with the deposit details' do
      subject.withdrawal(0, "19/06/2018")
      expect(subject.new_transaction.transaction_details).to eq({:date=>"19/06/2018", :credit=>"      ", :debit=>0, :balance=>0})
    end
  end


end
