require 'bundler/setup'
require 'minitest/autorun'
require 'pry-byebug'
require_relative 'btree'


# Based on example on
# http://www.cs.utexas.edu/users/djimenez/utsa/cs3343/lecture17.html
#
describe BTree do

  before do
    @btree = BTree.new(2)
  end

  it 'insert 5' do
    @btree.insert(5, 5)

    @btree.search(5).must_equal 5
    @btree.keys.must_equal [5]
  end

  it 'insert 9' do
    @btree.insert(5, 5)
    @btree.insert(9, 9)

    @btree.keys.must_equal [5, 9]
  end

  it 'insert 3' do
    @btree.insert(5, 5)
    @btree.insert(9, 9)
    @btree.insert(3, 3)


    @btree.keys.must_equal [3, 5, 9]
  end

  it 'insert 7' do
    @btree.insert(5, 5)
    @btree.insert(9, 9)
    @btree.insert(3, 3)
    @btree.insert(7, 7)


    @btree.inspect.must_equal "{[5]::[{[3]::[]}, {[7, 9]::[]}]}"
  end

  it 'insert 1' do
    @btree.insert(5, 5)
    @btree.insert(9, 9)
    @btree.insert(3, 3)
    @btree.insert(7, 7)
    @btree.insert(1, 1)

    @btree.inspect.must_equal "{[5]::[{[1, 3]::[]}, {[7, 9]::[]}]}"
  end

  it 'insert 2' do
    @btree.insert(5, 5)
    @btree.insert(9, 9)
    @btree.insert(3, 3)
    @btree.insert(7, 7)
    @btree.insert(1, 1)
    @btree.insert(2, 2)

    @btree.inspect.must_equal "{[5]::[{[1, 2, 3]::[]}, {[7, 9]::[]}]}"
  end

  it 'insert 8' do
    @btree.insert(5, 5)
    @btree.insert(9, 9)
    @btree.insert(3, 3)
    @btree.insert(7, 7)
    @btree.insert(1, 1)
    @btree.insert(2, 2)
    @btree.insert(8, 8)

    @btree.inspect.must_equal "{[5]::[{[1, 2, 3]::[]}, {[7, 8, 9]::[]}]}"
  end

  it 'insert 6' do
    @btree.insert(5, 5)
    @btree.insert(9, 9)
    @btree.insert(3, 3)
    @btree.insert(7, 7)
    @btree.insert(1, 1)
    @btree.insert(2, 2)
    @btree.insert(8, 8)
    @btree.insert(6, 6)

    @btree.keys.must_equal [5, 8]
    @btree.inspect.must_equal "{[5, 8]::[{[1, 2, 3]::[]}, {[6, 7]::[]}, {[9]::[]}]}"
  end

  it 'insert 0' do
    @btree.insert(5, 5)
    @btree.insert(9, 9)
    @btree.insert(3, 3)
    @btree.insert(7, 7)
    @btree.insert(1, 1)
    @btree.insert(2, 2)
    @btree.insert(8, 8)
    @btree.insert(6, 6)
    @btree.insert(0, 0)


    @btree.keys.must_equal [2,5,8]
    @btree.inspect.must_equal "{[2, 5, 8]::[{[0, 1]::[]}, {[3]::[]}, {[6, 7]::[]}, {[9]::[]}]}"
  end


  it 'insert 4' do
    @btree.insert(5, 5)
    @btree.insert(9, 9)
    @btree.insert(3, 3)
    @btree.insert(7, 7)
    @btree.insert(1, 1)
    @btree.insert(2, 2)
    @btree.insert(8, 8)
    @btree.insert(6, 6)
    @btree.insert(0, 0)
    @btree.insert(4, 4)


    @btree.keys.must_equal [5]
    @btree.inspect.must_equal "{[5]::[{[2]::[{[0, 1]::[]}, {[3, 4]::[]}]}, {[8]::[{[6, 7]::[]}, {[9]::[]}]}]}"
  end


end
