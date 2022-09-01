module Transport
  class ToyTestingRequest
    include Import[
              service: "context.toy_testing.service"
            ]

    def call
      puts "Hello from in_memory shop request"
      service.call
    end
  end
end
