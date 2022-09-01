module Transport
  class AccountRequest
    include Import[service: "context.account.service"]

    def call
      puts "Hello from in_memory matcher request"
      puts "Call logic:"
      sleep 0.5

      service.call

      sleep 0.5
      puts "Request done"
    end
  end
end
