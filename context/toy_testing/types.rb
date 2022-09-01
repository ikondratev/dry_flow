module ToyTesting
  module Types
    include Dry.Types()

    ToyTitle = String.constrained(min_size: 3)
    TestAccountId = Integer.optional
    ToyOptions = String.constrained(min_size: 10)
    AccountName = String.optional
    AccountLastName = String.optional
    AccountEmail = String.constrained(
      format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    )
  end
end
