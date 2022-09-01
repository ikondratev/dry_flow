require "dry/system/container"
require "dry/system/loader/autoloading"
require "zeitwerk"

class Container < Dry::System::Container
  use :env, inferrer: -> { ENV.fetch("APP_ENV", :development).to_sym }
  use :zeitwerk

  configure do |config|
    config.component_dirs.add "context" do |dir|
      dir.memoize = true

      dir.namespaces.add "account", key: "context.account"
      dir.namespaces.add "toy_testing", key: "context.toy_testing"
    end

    config.component_dirs.add "apps" do |dir|
      dir.memoize = true

      dir.namespaces.add "transport", key: "transport"
    end
  end
end

Import = Container.injector
