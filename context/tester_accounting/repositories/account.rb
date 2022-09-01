module TesterAccounting
  module Repositories
    class Account
      include Import[db: "persistence.db"]

      def find_by(id:)
        raw_to_entity(db.exec("SELECT * FROM accounts WHERE id=#{id}")).first
      end

      def add_score(_id, _score)
        # TODO: Implement me
        true
      end

      private

      def raw_to_entity(raw_result)
        raw_result.map do |row|
          TesterAccounting::Entities::Account.new(
            id: row["id"].to_i,
            score: row["score"],
            blocked: row["blocked"]
          )
        end
      end
    end
  end
end
