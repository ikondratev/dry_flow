module TesterAccounting
  module Repositories
    class CatToy
      include Import[db: "persistence.db"]

      def find_by(id:)
        raw_to_entity(db.exec("SELECT * FROM cat_toys WHERE id=#{id}")).first
      end

      private

      def raw_to_entity(raw_result)
        raw_result.map do |row|
          TesterAccounting::Entities::CatToy.new(
            id: row["id"].to_i,
            title: row["title"]
          )
        end
      end
    end
  end
end
