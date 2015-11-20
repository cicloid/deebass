require 'btree'

class Table
  def initialize
    @records = []
    @indexes = {}
  end

  def insert(values)

  end

  def find_by_id(id)
    @records[id - 1]
  end

  def find_by(query)

  end

  def create_index(attribute)
  end

  def update_index(attribute, value, id)

  end


end
