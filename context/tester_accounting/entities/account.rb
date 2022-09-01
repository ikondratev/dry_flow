module TesterAccounting
  module Entities
    class Account < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, TesterAccounting::Types::Integer

      attribute :blocked, TesterAccounting::Types::Bool
      attribute :score, TesterAccounting::Types::AccountScope

      def is_blocked?
        blocked
      end
    end
  end
end
