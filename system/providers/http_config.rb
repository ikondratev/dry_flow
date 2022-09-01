Container.register_provider(:http_configuration) do |container|
  prepare do
    require "hanami/action/configuration"

    config = Hanami::Action::Configuration.new do |config|
      config.default_response_format = :json
    end

    register("hanami.action.configuration", config)
  end
end
