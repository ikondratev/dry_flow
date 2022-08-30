require "./config/boot"

puts "Loaded container:"
puts "container: #{Container}"
puts "container keys: #{Container.keys}"

Container["transport.matcher_request"].call
Container["transport.shop_request"].call
