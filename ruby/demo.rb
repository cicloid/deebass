require 'bundler/setup'
require_relative 'table'
require 'pry-byebug'
require 'benchmark'

table = Table.new

table.create_index("username")
table.create_index("status")

def user_status(number)
    number % 1000 == 0 ? 'active' : 'canceled'
end

puts Benchmark.measure {
300_000.times do |i|
  table.insert({
    username: "user#{i}",
    real: "user#{i}",
    name: "The User ##{i}",
    weight: i*10,
    status: user_status(i)
  })
end

}

records = []

puts "With Indexes"
puts table.find_by_id(121)

puts "#find_by username"
puts Benchmark.measure { records = table.find_by(username: "user100") }


puts "#find_by status"
puts Benchmark.measure { records = table.find_by(status: "active") }
puts "Found #{records.size} records"
