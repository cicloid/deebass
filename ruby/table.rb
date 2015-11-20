require_relative 'btree'

class Table
  def initialize
    @records = []
    @indexes = {}
  end

  def insert(values)
    @records.push values

    id = @records.size
    @indexes.keys.each do |attribute|
      update_index(attribute, values[attribute], id)
    end

  end

  def find_by_id(id)
    @records[id]
  end

  def find_by(query={})
    attribute = query.keys.first
    value = query[attribute]

    index = @indexes[attribute]

    if index
      ids = index[value] || []
      return ids.map {|id| find_by_id(id) }
    else
      return @records.select {|record| record[attribute] === value }
    end
  end

  def create_index(attribute)
    @indexes[attribute] = {}
  end

  def update_index(attribute, value, id)
    index = @indexes[attribute]

    ids = index[value]

    if ids.nil?
      ids = []
      index[value] = ids
    end

    ids.push(id)

  end

end
