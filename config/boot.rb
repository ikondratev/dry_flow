require "dotenv"

Dotenv.load(".env.prod", ".env.local")

require "./system/container"
Container.finalize!
