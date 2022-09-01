require_relative  "functions/cross_context_calls_checker.rb"
CONTEXT_MAP = {
  account: {
    whitelist: %w[context.account.service],
    file_path: "apps/transport/account_request.rb"
  },
  toy_testing: {
    whitelist: %w[context.toy_testing.service],
    file_path: "apps/transport/toy_testing_request.rb"
  }
}.freeze


CONTEXT_MAP.each do |key, context|
  puts
  puts "**** #{key} context check ****"

  FitnessFunctions::Functions::CrossContextCallsChecker.new.call(context[:file_path], whitelist: context[:whitelist])
end
