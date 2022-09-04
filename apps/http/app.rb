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

    # get '/order/:id', to: Container['http.actions.queries.show_order']
    #
    # post '/checkout', to: Container['http.actions.commands.checkout']
    # post "/order/:id/add", to: Container['http.actions.commands.add_items_to_order']

    # scope "api" do
    #   scope "v1" do
    #     post '/checkout', to: Container['http.actions.v1.commands.checkout']
    #   end
    #
    #   scope "v2" do
    #     post '/checkout', to: Container['http.actions.v2.commands.checkout']
    #   end
    # end
  end
end
