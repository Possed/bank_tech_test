require './lib/account'

describe 'Test - print the bank statement' do

  it 'Make 2 deposits, 1 withdrawal and print the statement' do
    account = Account.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdrawal(500)

    expect{account.acc_statement.print_statement}.to output("    date   ||  credit  ||  debit  ||  balance  
 20/06/2018||             ||  500  ||  2500
 20/06/2018||    2000   ||          ||  3000
 20/06/2018||    1000   ||          ||  1000
").to_stdout

  end




end
