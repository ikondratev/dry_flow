require "spec_helper"

RSpec.describe ToyTesting::Entities::Account, type: :entity do
  subject { described_class.new(payload) }

  let(:payload) do
    {
      id: 1,
      name: "Title for cat toy",
      last_name: "Options with same params",
      email: "sabaka@sabaka.sabake",
      blocked: false
    }
  end

  it { expect(subject.id).to eq(1) }
end