require_relative 'binary_tree'

class Table
  def initialize
    @records = []
    @indexes = {}
  end

  def insert(values)
    @records.push values

    id = @records.size



  end

  def find_by_id(id)
    @records[id]
  end

  def find_by(query={})
    attribute = query.keys.first
    value = query[attribute]

    index = @indexes[attribute]

    if index
      #ids = index.
    else
      return @records.select {|record| record[attribute] == value }
    end
  end

  def create_index(attribute)
  end

  def update_index(attribute, value, id)

  end

end
