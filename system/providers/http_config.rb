Container.register_provider(:http_configuration) do |container|
  prepare do
    require "hanami/action/configuration"

    hanami_action_config = Hanami::Action::Configuration.new do |config|
      config.default_response_format = :json
    end

    register("hanami.action.configuration", hanami_action_config)
  end
end
