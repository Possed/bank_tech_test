class Statement
  attr_reader :statement

  def initialize
    @statement = [];
  end

  def add_to_statement(transaction)
    @statement << transaction;
  end

  def print_statement
    print_header
    print_transactions
  end

  def print_header
    puts "    date   ||  credit  ||  debit  ||  balance  ";
  end

  def print_transactions
    @statement.reverse_each { |transaction1|
      puts " #{transaction1[:date]}||    #{transaction1[:credit]}   ||  #{transaction1[:debit]}  ||  #{transaction1[:balance]}"
    }
  end
end
