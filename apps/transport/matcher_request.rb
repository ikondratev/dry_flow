module Transport
  class MatcherRequest
    include Import[service: "context.matcher.service"]

    def call
      puts "Hello from in_memory matcher requst"
      puts "Call logic:"
      sleep 0.5

      service.call

      sleep 0.5
      puts "Request done"
    end
  end
end
