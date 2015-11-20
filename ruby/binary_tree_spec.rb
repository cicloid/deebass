require 'minitest/autorun'
require './binary_tree'

describe BinaryTree do
  before do
    @binary_tree = BinaryTree.new
  end

  it 'insert 5' do
    @binary_tree.insert(5, 5)
  end


end
