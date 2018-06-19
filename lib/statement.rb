class Statement
  attr_reader :statement

  def initialize
    @statement = [];
  end

  def add_to_statement(transaction)
    @statement << transaction;

  end
end
