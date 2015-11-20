require 'benchmark'
require_relative 'table'

table = Table.new

table.create_index("username")
table.create_index("status")

def user_status(number)
    number % 1000 == 0 ? 'active' : 'canceled'
end

100_000.times do |i|
  table.insert({
    username: "user#{i}",
    name: "The User ##{i}",
    status: user_status(i)
  })
end


puts table.find_by_id(121)

records = ""
puts "#find_by username"
puts Benchmark.measure { records = table.find_by(username: "user100") }


puts "#find_by status"
puts Benchmark.measure { records = table.find_by(status: "active") }
puts "Found #{records.size} records"
