require 'json'
require 'hanami/action'

module HTTP
  module Actions
    module Commands
      class AddToyToTester < Hanami::Action
        include Dry::Monads[:result]

        include Import[
                  configuration: "hanami.action.configuration",
                  command: "context.toy_testing.commands.add_toy_to_tester_account"
                ]

        def handle(req, res)
          result = command.call(
            toy_id: req.params[:id],
            account_id: req.params[:account_id]
          )

          case result
          in Success
            res.status  = 200
            res.body    = result.value!.to_json
          in Failure[_, error_message]
            halt 422, error_message.to_json
          end
        end
      end
    end
  end
end
