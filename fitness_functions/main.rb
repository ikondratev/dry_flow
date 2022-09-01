require_relative  "functions/cross_context_calls_checker.rb"

CONTEXT_MAP = {
  tester_accounting: {
    "apps/transport/account_request.rb": {
      whitelist: %w[
        context.tester_accounting.service
      ]
    },
    "context/tester_accounting/commands/encourage_account.rb": {
      whitelist: %w[
        context.tester_accounting.repositories.account
        context.tester_accounting.repositories.report
        context.tester_accounting.repositories.cat_toy
      ]
    }
  },
  toy_testing: {
    "apps/transport/toy_testing_request.rb": {
      whitelist: %w[
        context.toy_testing.service
      ]
    },
    "context/toy_testing/commands/add_toy_to_tester_account.rb": {
      whitelist: %w[
        context.toy_testing.repositories.toy
        context.toy_testing.repositories.account
      ]
    }
  }
}.freeze


CONTEXT_MAP.each do |key, context|
  puts
  puts "**** #{key} context check ****"

  context.each do |path, path_context|
    FitnessFunctions::Functions::CrossContextCallsChecker.new.call(path.to_s, whitelist: path_context[:whitelist])
  end
end
