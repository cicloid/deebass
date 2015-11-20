require 'benchmark'
require 'table'

table = Table.new

table.create_index("username")
table.create_index("status")

(1..1000).each do |i|
  table.insert({
    username: "user#{i}",
    name: "The User ##{i}",
    status: i % 1000 === 0 ? 'active' : 'canceled'
  })
end


puts table.find_by_id(1)

puts "#find_by username"
puts Benchmark.measure { table.find_by(username: "user100") }


puts "#find_by status"
puts Benchmark.measure { table.find_by(status: "active") }

