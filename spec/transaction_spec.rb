require 'transaction'

describe Transaction do

  describe '#initialize' do
    it 'initializes a new transaction as an empty object' do
      expect(subject.transaction_details).to be_empty
    end
  end

  describe '#log_deposit' do
    it 'adds the deposit as a complete transaction' do
      subject.log_deposit('18/06/2018', 5, 10)
      expect(subject.transaction_details).to eq({ date: '18/06/2018', credit: "5.00", debit: "      ", balance: "10.00" })
    end
  end

  describe '#log_withdrawal' do
    it 'adds the deposit as a complete transaction' do
      subject.log_withdrawal('18/06/2018', 5, 10)
      expect(subject.transaction_details). to eq({ date: '18/06/2018', credit: "      ", debit: "5.00", balance: "10.00" })
    end
  end
end
