class Node
  attr_accessor :keys, :children, :values, :leaf

  def initialize(degree)
    @keys = Array.new
    @children = Array.new
    @values = Array.new
    @degree = degree
  end

  def leaf?
    @children.size === 0
  end

  def children
    @children
  end

  def size
    @keys.size || 0
  end

  def full?
    size >= 2 * @degree - 1
  end

  def size
    @keys.size
  end

  def search(search_key)
    i = 0
    while (i <= (size - 1 || 0) &&
        search_key > @keys.fetch(i, 0))
      i += 1
    end

    if search_key === @keys[i]
      return @values[i]
    elsif leaf?
      return
    end
    @children[i].search(search_key)
  end

  def insert(insert_key, value)
    i = 0
    while i <= (size - 1 || 0) &&
        insert_key > @keys.fetch(i, 0)
      i += 1
    end
    if leaf?
      @keys.insert(i, insert_key)
      @values.insert(i, value)
    else
      child = @children[i]

      if child.full?
        split(i)
      end

      child.insert(insert_key, value)
    end

  end

  def split(i)
    new_child = Node.new(@degree)

    middle = @degree - 1

    new_child.keys << split_child.keys.slice!(middle + 1) || []
    new_child.values << split_child.values.slice!(middle + 1) || []
    new_child.add_children split_child.children.slice!(middle + 1)

    @children.insert(i + 1, new_child)

    @keys.insert(i, split_child.keys[middle])
    @values.insert(i, split_child.values[middle])

    split_child.keys.delete_at(middle)
    split_child.values.delete_at(middle)
  end

  def add_children(children)
    @children << children
    @children.compact!
  end


  def inspect
    "{#{@keys}::#{@children.each(&:inspect)}}"
  end

  def to_s
    @keys.join(', ')
  end

end


class BTree
  attr_accessor :root, :degree

  def initialize(degree = 2)
    @degree = degree
    @root = Node.new(@degree)
  end

  def insert(key, value)
    root = @root
    if root.full?
      @root = Node.new(@degree)
      @root.add_children root
      @root.split(0)
    end
    @root.insert(key, value)
  end

  def search(key)
    @root.search(key)
  end

  def size
    @root.size
  end

  def inspect
    @root.inspect
  end

  def keys
    @root.keys
  end

  def children
    @root.children
  end

  def values
    @root.values
  end

end
