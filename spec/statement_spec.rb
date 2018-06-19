require 'statement'

describe Statement do
  describe '#initialize' do
    it 'initializes an intance of the class with an empy array' do
      expect(subject.statement).to eq([])
    end
  end

  describe '#add_to_statement' do
    it 'adds the transaction to the statement' do
      subject.add_to_statement({date: '18/06/2018', credit: 5, balance: 10})
      expect(subject.statement).to eq([{date: '18/06/2018', credit: 5, balance: 10}])
    end
  end

  # describe 'print_statement' do
  #   it 'prints the account statement'
  # end
end
