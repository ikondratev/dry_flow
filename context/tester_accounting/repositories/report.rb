module TesterAccounting
  module Repositories
    class Report
      include Import[db: "persistence.db"]

      def find_by(id:)
        raw_to_entity(db.exec("SELECT * FROM reports WHERE id=#{id}")).first
      end

      def where(_condition)
        # TODO: Implement me
        []
      end

      private

      def raw_to_entity(raw_result)
        raw_result.map do |row|
          TesterAccounting::Entities::Report.new(
            id: row["id"].to_i,
            toy_id: row["cat_toy_id"],
            account_id: row["account_id"],
            status: row["status"],
            comment: row["comment"]
          )
        end
      end
    end
  end
end
