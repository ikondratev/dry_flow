require "spec_helper"

RSpec.describe TesterAccounting::Entities::Account, type: :entity do
  subject { described_class.new(payload) }

  let(:payload) do
    {
      id: 1,
      score: 10000,
      blocked: false
    }
  end

  it { expect(subject.id).to eq(1) }
end