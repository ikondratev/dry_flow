module ToyTesting
  module Repositories
    class Account
      include Import[db: "persistence.db"]

      def find_by(id:)
        raw_to_entity(db.exec("SELECT * FROM accounts WHERE id=#{id}")).first
      end

      private

      def raw_to_entity(raw_result)
        raw_result.map do |row|
          Accounting::Entities::Account.new(
            id: row["id"].to_i,
            name: row["name"],
            last_name: row["lastname"],
            email: row["email"]
          )
        end
      end
    end
  end
end
