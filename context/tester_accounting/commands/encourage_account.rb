module TesterAccounting
  module Commands
    class EncourageAccount
      include Dry::Monads[:result, :do]

      include Import[
                account_repo: "context.tester_accounting.repositories.account",
                report_repo: "context.tester_accounting.repositories.report",
                toy_repo: "context.tester_accounting.repositories.cat_toy"
              ]

      SCORE_SIZE = 1000.freeze
      SUCCESS_STATUSES = %w[done].freeze

      # @param [String] account_id
      def call(account_id)
        account = yield find_account(account_id)
        account = yield check_account(account)
        test_reports = yield find_reports(account_id)
        score = yield calculate_score(test_reports)

        add_score_to_account(account, score)
      end

      private

      def find_account(account_id)
        account = account_repo.find_by(id: account_id)

        account ? Success(account) : Failure([:account_not_found, { error: "account wasn't found" }])
      end

      def check_account(account)
        account.is_blocked? ? Failure([:account_was_blocked, { error: "account was blocked" }]) : Success(account)
      end

      def find_reports(account_id)
        reports = report_repo.where(account_id: account_id)

        reports.size.positive? ? Success(reports) : Failure([:nothing_was_tested, { error: "nothing was tested" }])
      end

      def calculate_score(reports)
        successful_reports = reports.select do |r|
          r.toy_id if SUCCESS_STATUSES.include?(r.status)
        end

        unless successful_reports.size.positive?
          Failure([:nothing_was_tested, { error: "nothing was tested" }])
        end

        successful_reports.each do |report|
          toy = toy_repo.find_by(id: report.toy_id)

          next if toy

          Failure([:wrong_toy, { error: "toy wasn't found" }])
        end

        Success(SCORE_SIZE * successful_reports.size)
      end

      def add_score_to_account(account, score)
        new_score = account.score + score

        Success(scored: account_repo.add_score(account.id, new_score))
      end
    end
  end
end
