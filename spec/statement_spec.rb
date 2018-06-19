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

  describe '#print_statement' do
    it 'prints the account statement' do
      subject.add_to_statement({date: '18/06/2018', credit: 5, balance: 10})
      expect{subject.print_statement}.to output("   date   ||  credit  ||  debit  ||  balance  \n #{subject.statement[0][:date]}||#{subject.statement[0][:credit]}||#{subject.statement[0][:debit]}||#{subject.statement[0][:balance]}\n").to_stdout
    end
  end

end
