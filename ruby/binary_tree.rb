class BinaryTree
  def initialize
    @root = Node.new
  end

  def insert(key, value)
    if @root.full?

    end

    @root.insert(key, value)
  end

end

class Node
  def initialize
    @children = []
    @keys = []
    @values = []
  end



end
