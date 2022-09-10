module Kafka
  module Consumers
    class Accounting < ApplicationConsumer
      include Import[
                command: "contexts.toy_testing.commands.add_toy_tester_accounting"
              ]

      def consume
        account_id = messages.payloads[:account_id]
        toy_id = messages.payloads[:toy_id]
        command.call(toy_id, account_id)
      end
    end
  end
end
