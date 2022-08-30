module Transport
  class ShopRequest
    include Import[service: "context.shop.service"]

    def call
      puts "Hello from in_memory shop request"
      puts "Call logic:"
      sleep 0.5

      service.call

      sleep 0.5
      puts "Request done"
    end
  end
end
