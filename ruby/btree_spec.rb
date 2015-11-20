require 'minitest/autorun'
require './btree'


# Based on example on
# http://www.cs.utexas.edu/users/djimenez/utsa/cs3343/lecture17.html
#
describe BTree do
  before do
    @btree = BTree.new
  end

  it 'insert 5' do
    @btree.insert(5, 5)

    puts @btree.inspect
    @btree.search(5).must_equal 5
  end


end
