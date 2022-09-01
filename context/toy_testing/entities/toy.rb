module ToyTesting
  module Entities
    class Toy < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, ToyTesting::Types::Integer

      attribute :title, ToyTesting::Types::ToyTitle
      attribute :options, ToyTesting::Types::ToyOptions
      attribute :test_account_id, ToyTesting::Types::TestAccountId
    end
  end
end
