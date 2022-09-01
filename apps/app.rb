require "./config/boot"

puts "Loaded container:"
puts "container: #{Container}"
puts "container keys: #{Container.keys}"

Container["transport.account_request"].call
Container["transport.toy_testing_request"].call
