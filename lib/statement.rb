class Statement
  attr_reader :statement

  def initialize
    @statement = [];
  end

  def add_to_statement(transaction)
    @statement << transaction;
  end

  def print_statement
    puts "   date   ||  credit  ||  debit  ||  balance  ";
    @statement.each {|transaction1|
    puts " #{transaction1[:date]}||#{transaction1[:credit]}||#{transaction1[:debit]}||#{transaction1[:balance]}"
    }
  end
end
