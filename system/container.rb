require "dry/system/container"
require "dry/system/loader/autoloading"
require "zeitwerk"

# --- Dry-rb requirements ---
require "dry-types"
require "dry/types"
Dry::Types.load_extensions(:monads)

require "dry/schema"
require "dry-schema"
Dry::Schema.load_extensions(:monads)

require "dry-struct"

require "dry/monads"
require "dry/monads/do"
# ---------------------------

class Container < Dry::System::Container
  use :env, inferrer: -> { ENV.fetch("APP_ENV", :development).to_sym }
  use :zeitwerk

  configure do |config|
    config.component_dirs.add "context" do |dir|
      dir.memoize = true

      dir.auto_register = proc do |component|
        !component.identifier.include?("entities")
        !component.identifier.include?("types")
      end

      dir.namespaces.add "tester_accounting", key: "context.tester_accounting"
      dir.namespaces.add "toy_testing", key: "context.toy_testing"
    end

    config.component_dirs.add "apps" do |dir|
      dir.memoize = true

      dir.namespaces.add "http", key: "http"
    end
  end
end

Import = Container.injector
