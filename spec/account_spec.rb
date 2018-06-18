require 'account'

describe Account do

  describe '#initialize' do
    it 'initializes a new account with balance = 0' do
      expect(subject.balance).to equal(0)
    end
    it 'initializes a new account with an empty transaction' do
      expect(subject.transaction).to be_empty
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
  end

  describe '#withdrawl' do
    it 'substracts a given amount from the total balance' do
      subject.deposit(15)
      subject.withdrawl(5)
      expect(subject.balance).to eq(10)
    end
    it 'will raise an error if you want to withdrawl more money than available' do
      expect{subject.withdrawl(5)}.to raise_error 'insufficient funds available'
    end
  end

end
