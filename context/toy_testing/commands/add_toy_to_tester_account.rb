module ToyTesting
  module Commands
    class AddToyToTesterAccount
      include Dry::Monads[:result, :do]

      include Import[
                account_repo: "context.toy_testing.repositories.account",
                toy_repo: "context.toy_testing.repositories.toy"
              ]

      MAX_TOYS_IN_QUEUE = 3.freeze

      # @param [String] toy_id
      # @param [String] account_id
      def call(toy_id, account_id)
        account = yield find_account(account_id)

        toys = yield find_toys_by_account(account.id)

        add_toy_to_account(account, toy_id, toys)
      end

      private

      def find_account(account_id)
        account = account_repo.find_by(id: account_id)

        account ? Success(account) : Failure([:account_not_found, { error: "account wasn't found" }])
      end

      def find_toys_by_account(id)
        toys = toy_repo.where(test_account_id: id)

        toys.size > MAX_TOYS_IN_QUEUE ? Failure([:queue_full, { error: "queue is full" }]) : Success(toys)
      end

      def add_toy_to_account(account, toy_id, toys)
        Failure([:toys_exist_in_queue, { error: "toy already testing" }]) unless toys.find { |t| t.id == toy_id }.nil?

        Success(toy_id: toy_repo.add_test_account(id: toy_id, account_id: account.id))
      end
    end
  end
end
