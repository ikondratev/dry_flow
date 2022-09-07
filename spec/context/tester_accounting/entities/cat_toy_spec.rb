require "spec_helper"

RSpec.describe TesterAccounting::Entities::CatToy, type: :entity do
  subject { described_class.new(payload) }

  let(:payload) do
    {
      id: 1,
      title: "Where is my toy?"
    }
  end

  it { expect(subject.id).to eq(1) }
end
