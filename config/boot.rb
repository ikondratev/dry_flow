require "dotenv"

Dotenv.load(".env", ".env.#{ENV['APP_ENV']}")

require "./system/container"
Container.finalize!
