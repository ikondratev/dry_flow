require "spec_helper"

RSpec.describe ToyTesting::Entities::Toy, type: :entity do
  subject { described_class.new(payload) }

  let(:payload) do
    {
      id: 1,
      title: "Title for cat toy",
      options: "Options with same params",
      test_account_id: 123
    }
  end

  it { expect(subject.id).to eq(1) }
end