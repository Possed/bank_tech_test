require 'transaction'

describe Transaction do

  describe '#initialize' do
    it 'initializes a new transaction as an empty object' do
      expect(subject.transaction).to be_empty
    end
  end
end
