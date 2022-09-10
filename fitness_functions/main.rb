require_relative  "functions/cross_context_calls_checker.rb"

CONTEXT_MAP = {
  tester_accounting: {
    "context/tester_accounting/commands/encourage_account.rb": {
      whitelist: %w[
        context.tester_accounting.repositories.account
        context.tester_accounting.repositories.report
        context.tester_accounting.repositories.cat_toy
      ]
    },
    "apps/http/actions/commands/add_encourage_to_account.rb": {
      whitelist: %w[
        hanami.action.configuration
        context.tester_accounting.commands.encourage_account
      ]
    }
  },
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
    },
    "apps/kafka/consumers/toy_testing.rb": {
      whitelist: %w[
        contexts.toy_testing.commands.add_toy_tester_accounting
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
