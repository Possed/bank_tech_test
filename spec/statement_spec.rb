require 'statement'

describe Statement do

  describe '#initialize' do
    it 'initializes an intance of the class with an empy array' do
      expect(subject.statement).to eq([])
    end
  end

  describe '#add_to_statement' do
    it 'adds the transaction to the statement' do
      subject.add_to_statement({ date: '18/06/2018', credit: 5, balance: 10 })
      expect(subject.statement).to eq([{ date: '18/06/2018', credit: 5, balance: 10 }])
    end
  end

  describe '#print_statement' do
    it 'prints the account statement' do
      subject.add_to_statement({ date: '18/06/2018', credit: 5, balance: 10 })
      expect { subject.print_statement }.to output("    date   ||  credit  ||  debit  ||  balance  \n 18/06/2018||    5   ||    ||  10\n").to_stdout
    end
  end

  describe '#print_header' do
    it 'prints the header of the statement' do
      expect { subject.print_header }.to output("    date   ||  credit  ||  debit  ||  balance  \n").to_stdout;
    end
  end

  describe '#print_transactions' do
    it 'prints each transaction in the statement' do
      subject.add_to_statement({ date: '18/06/2018', credit: 5, balance: 10 })
      expect { subject.print_transactions }.to output(" 18/06/2018||    5   ||    ||  10\n").to_stdout
    end
  end

end
