require "spec_helper"

RSpec.describe TesterAccounting::Entities::CatToy, type: :entity do
  subject { described_class.new(payload) }

  let(:payload) do
    {
      id: 1,
      title: "Where is my toy?",
      account_id: 1,
      toy_id: 2,
      status: "in_progress",
      comment: "Nothing was wrong"
    }
  end

  it { expect(subject.id).to eq(1) }
end
