require 'account'

describe Account do

  describe '#initialize' do
    it 'initializes a new account with balance = 0' do
      expect(subject.balance).to equal(0)
    end
    it 'initializes a new account with an empty transaction' do
      expect(subject.transaction).to be_empty
    end
  end

end
