#### Bank tech test

Aim - testing OO and TDD skills by creating code that is easy to access and interact via IRB.

####Specification
###Requirements

Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

###Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When the client prints their bank statement

###Then the client would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00


####Approach
TDD - I've started by creating basic tests and build up from there.

I've created an Account class that initialises a new account with a balance equal to 0.

The Account class:
- has a deposit method that takes an integer as an argument and it adds it to your balance(done by the add_to_balance method).
- had a withdrawal method that takes an integer as an argument and it subtracts it from your balance(done by remove_from_balance method) if the integer is lower than the balance (checked by the insufficient_funds? method).

Secondly I've created the Transaction class that creates an empty object every time a deposit or withdrawal happens and holds all the details of that transaction by saving them in the empty object.

Lastly I've created the Statement class that initialises a instance with an empty array when an Account instance is created to store all the transactions of that account. The statement instance is able to add every transaction form the account to the array and print it for the user.

####Install and run the app
 - Start by forking this repo and move to the project file;
 - run bundle install in your command line - it will install all the gems for you(rspec for testing and simplecov for testing coverage);
 - run the rb file and have fun

Example:
 - create an account
<img width="569" alt="screen shot 2018-06-20 at 10 18 18" src="https://user-images.githubusercontent.com/33420740/41649467-8adf5870-7473-11e8-8a23-12c8d87d4d71.png">

 - make deposits and withdrawals and then print the Statement
 <img width="572" alt="screen shot 2018-06-20 at 10 29 45" src="https://user-images.githubusercontent.com/33420740/41650038-00c94554-7475-11e8-853a-dd1480744251.png">

 ####Testing
 You can use rspec to run the tests and simplecov gem will also show you the test coverage.
 Both unit tests and feature tests have 100% coverage.

 Future improvements:
 Deposit and withdrawal methods from within the Account class:
 -they both require user input: the amount the user wants to add or withdrawal from their balance. I've assumed the user would use a cash machine to do that so they could only input integers.
 -add edge case when user would input an amount less than 0;
 -add edge case when user would input anything else except an integer;
