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
      update_index(attribute, values.fetch(attribute.to_sym), id)
    end

    return id
  end

  def find_by_id(id)
    @records[id]
  end

  def find_by(query={})
    attribute = query.keys.first
    value = query[attribute]

    index = @indexes[attribute]

    if index
      ids = index.search(value) || []
      return ids.map {|id| find_by_id(id) }
    else
      return @records.select {|record| record[attribute] === value }
    end

  end

  def create_index(attribute)
    @indexes[attribute] = BTree.new
  end

  def update_index(attribute, value, id)
    index = @indexes[attribute]

    ids = index.search(value)

    if ids.nil?
      ids = []
      index.insert(value, ids)
    end

    ids.push(id)

  end

  def clear_indexes
    @indexes = {}
  end

end
