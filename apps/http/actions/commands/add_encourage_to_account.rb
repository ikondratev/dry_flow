require 'json'
require 'hanami/action'

module HTTP
  module Actions
    module Commands
      class AddEncourageToAccount < Hanami::Action
        include Dry::Monads[:result]

        include Import[
                  configuration: "hanami.action.configuration",
                  command: "context.tester_accounting.commands.encourage_account"
                ]

        def handle(req, res)
          result = command.call(
            req.params[:id]
          )

          case result
          in Success(entity)
            res.status  = 200
            res.body    = entity.to_json
          in Failure[:account_not_found, error_message]
            halt 404, error_message.to_json
          in Failure[:account_was_blocked, error_message]
            halt 422, error_message.to_json
          in Failure[:nothing_was_tested, error_message]
            halt 422, error_message.to_json
          in Failure[:wrong_toy, error_message]
            halt 422, error_message.to_json
          end
        end
      end
    end
  end
end
