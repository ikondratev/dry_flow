require_relative  "functions/cross_context_calls_checker.rb"

CONTEXT_MAP = {
  tester_account: {
    whitelist: %w[
      context.tester_accounting.service
      context.tester_accounting.repositories.account
      context.tester_accounting.repositories.toy
    ],
    file_paths: %w[
      apps/transport/account_request.rb
    ]
  },
  toy_testing: {
    whitelist: %w[
      context.toy_testing.service
      context.toy_testing.repositories.toy
      context.toy_testing.repositories.account
    ],
    file_paths: %w[
      apps/transport/toy_testing_request.rb
      context/toy_testing/commands/add_toy_to_tester_account.rb
    ]
  }
}.freeze


CONTEXT_MAP.each do |key, context|
  puts
  puts "**** #{key} context check ****"

  context[:file_paths].each do |path|
    FitnessFunctions::Functions::CrossContextCallsChecker.new.call(path, whitelist: context[:whitelist])
  end
end
