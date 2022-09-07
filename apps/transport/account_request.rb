module Transport
  class AccountRequest
    include Import[
              service: "context.tester_accounting.service"
            ]
    def call
      puts "AccountRequest service"
      service.call
    end
  end
end
