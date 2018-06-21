require './lib/account'
describe 'Test - print the bank statement' do
  it 'Make 2 deposits, 1 withdrawal and print the statement' do
    account = Account.new
    account.deposit(1000, "10/01/2012")
    account.deposit(2000, "13/01/2012")
    account.withdrawal(500, "14/01/2012")
    expect { account.acc_statement.print_statement }.to output("    date   ||  credit  ||  debit  ||  balance
 14/01/2012||             ||  500.00  ||  2500.00
 13/01/2012||    2000.00   ||          ||  3000.00
 10/01/2012||    1000.00   ||          ||  1000.00
").to_stdout
  end
end
