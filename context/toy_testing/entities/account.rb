module ToyTesting
  module Entities
    class Account < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, ToyTesting::Types::Integer

      attribute :name, ToyTesting::Types::AccountName
      attribute :last_name, ToyTesting::Types::AccountLastName
      attribute :email, ToyTesting::Types::AccountEmail
      attribute :blocked, ToyTesting::Types::Bool
    end
  end
end
