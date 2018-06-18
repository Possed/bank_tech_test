require 'account'
require 'transaction'

describe Account do

  describe '#initialize' do
    it 'initializes a new account with balance 0' do
      expect(subject.balance).to equal(0)
    end

    it 'initializes a new account with an empty history of transactions' do
      expect(subject.statement).to be_empty
    end
  end


  describe '#deposit' do
    it 'adds a given amount to the total balance' do
      subject.deposit(5)
      expect(subject.balance).to eq(5)
    end
    it 'creates a new transaction instance' do
      subject.deposit(5)
      expect(subject.transactions).to be_an_instance_of(Transaction)
    end

    it 'created a transactions with the deposit details' do
      subject.deposit(10)
      expect(subject.transactions.transaction).to eq({:date=>"18/06/2018", :credit=>10, :balance=>10})
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
      expect(subject.insufficient_funds?).to eq(true)
    end
    it 'creates a new transaction instance' do
      subject.withdrawal(0)
      expect(subject.transactions).to be_an_instance_of(Transaction)
    end
    it 'created a transactions with the deposit details' do
      subject.deposit(0)
      expect(subject.transactions.transaction).to eq({:date=>"18/06/2018", :credit=>0, :balance=>0})
    end
  end

  describe '#insufficient_funds?' do
    it 'returns false if there is enough balance' do
      subject.deposit(15)
      subject.withdrawal(5)
      expect(subject.insufficient_funds?).to eq(false)
    end
  end


end
