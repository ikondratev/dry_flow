module TesterAccounting
  module Entities
    class Report < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, TesterAccounting::Types::Integer

      attribute :account_id, TesterAccounting::Types::Integer
      attribute :toy_id, TesterAccounting::Types::CatToyId
      attribute :status, TesterAccounting::Types::ReportStatuses
      attribute :comment, TesterAccounting::Types::ReportComment
    end
  end
end
