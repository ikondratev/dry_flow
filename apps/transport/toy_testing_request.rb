module Transport
  class ToyTestingRequest
    include Import[
              service: "context.toy_testing.service",
              toy: "context.toy_testing.repositories.toy"
            ]

    def call
      puts "Hello from in_memory shop request"
      puts "Call logic:"
      sleep 0.5

      service.call
      toy.all

      sleep 0.5
      puts "Request done"
    end
  end
end
