require_relative  "functions/cross_context_calls_checker.rb"

CONTEXT_MAP = {
  toy_testing: {
    "context/toy_testing/commands/add_toy_to_tester_account.rb": {
      whitelist: %w[
        context.toy_testing.repositories.toy
        context.toy_testing.repositories.account
      ]
    },
    "apps/http/actions/commands/add_toy_to_tester.rb": {
      whitelist: %w[
        hanami.action.configuration
        context.toy_testing.commands.add_toy_to_tester_account
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
