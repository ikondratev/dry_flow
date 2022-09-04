require_relative  "functions/cross_context_calls_checker.rb"

CONTEXT_MAP = {
  tester_account: {
    "apps/transport/account_request.rb": {
      whitelist: %w[
        context.tester_accounting.service
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
