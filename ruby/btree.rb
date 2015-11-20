class BTree

  def initialize
    @root = Node.new
  end

  def insert(key, value)
    if @root.full?

    end

    @root.insert(key, value)
  end

  def search(key)
    @root.search(key)
  end


  def self.degree
    2
  end

end

class Node
  def initialize
    @children = []
    @keys = []
    @values = []
  end

  def search(search_key)
    @keys.each do |key|
      if search_key === key
        return @values[key]
      elsif is_leaf?
        return
      end

      @children[key].search(search_key)
    end
  end

  def full?
    @keys.size >= 2 * BinaryTree.degree - 1
  end

  def insert(insert_key, value)
    @keys.each do |key|
      if is_leaf?
        @keys.insert(key.index, insert_key)
        @values.insert(key.index, value)
      else
        child = @children[key.index]

        if child.full?
          split(i)
        end

        child.insert(key, value)
      end
      i += 1
    end

  end

  def is_leaf?
    @children.empty?
  end


end
