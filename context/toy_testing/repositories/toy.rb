module ToyTesting
  module Repositories
    class Toy
      include Import[db: "persistence.db"]

      def find_by(id:)
        raw_to_entity(db.exec("SELECT * FROM cat_toys WHERE id=#{id}")).first
      end

      def where(condition)
        raw_to_entity(db.exec("SELECT * FROM cat_toys WHERE #{condition}"))
      end

      def all
        raw_to_entity(db.exec("SELECT * FROM cat_toys"))
      end

      def add_test_account(id:, account_id:)
        conn.prepare("inse#{id}", "INSERT INTO
                  played_in(account_id, name, year, position)
                  VALUES ($1)")

        conn.exec_prepared("inse#{id}",
                           [account_id])

        find_by(id: id)
      end

      private

      def raw_to_entity(raw_result)
        raw_result.map do |row|
          ToyTesting::Entities::Toy.new(
            id: row["id"].to_i,
            title: row["title"],
            account_id: row["account_id"],
            options: row["options"]
          )
        end
      end
    end
  end
end
