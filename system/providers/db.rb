Container.register_provider(:db) do
  prepare do
    require "pg"

    db = if ENV["MODE"] == "prod"
           PG.connect(
             dbname:   ENV["DB"],
             host:     ENV["HOST"],
             port:     ENV["PORT"],
             user:     ENV["USER_DB"],
             password: ENV["PASS"])
         else
           Object
         end

    register("persistence.db", db)
  end
end