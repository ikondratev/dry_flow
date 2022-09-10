require "hanami/api"
require "hanami/middleware/body_parser"
require "hanami/action"

module HTTP
  class App < Hanami::API
    use Hanami::Middleware::BodyParser, :json

    get "/ping" do
      "PONG"
    end

    post "/toys/:id/add_to_tester", to: Container["http.actions.commands.add_toy_to_tester"]

    post "/accounts/:id/add_encourage", to: Container["http.actions.commands.add_encourage_to_account"]
  end
end
