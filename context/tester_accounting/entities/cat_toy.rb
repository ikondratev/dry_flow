module TesterAccounting
  module Entities
    class CatToy < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, TesterAccounting::Types::Integer

      attribute :title, TesterAccounting::Types::CatToyTitle
    end
  end
end
