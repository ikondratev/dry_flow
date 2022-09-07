require "./spec/spec_helper"

RSpec.describe ToyTesting::Types do
  describe "AccountCharacteristic" do
    let(:type) { ToyTesting::Types::ToyOptions }

    context "when account characteristic is correct" do
      it { expect(type["This is toy options like"]).to eq("This is toy options like") }
    end

    context "when account characteristic is less than 10 chars" do
      it { expect { type["less 10"] }.to raise_error(Dry::Types::ConstraintError) }
    end
  end

  describe "ToyTitle" do
    let(:type) { ToyTesting::Types::ToyTitle }

    context "when cat toy title is correct" do
      it { expect(type["Name of toy"]).to eq("Name of toy") }
    end

    context "when cat toy title is less than 3 chars" do
      it { expect { type['X'] }.to raise_error(Dry::Types::ConstraintError) }
    end
  end

  describe "AccountEmail" do
    let(:type) { ToyTesting::Types::AccountEmail }

    context "when cat toy title is correct" do
      it { expect(type["sabaka@sabaka.sabaka"]).to eq("sabaka@sabaka.sabaka") }
    end

    context "when cat toy title is less than 3 chars" do
      it { expect { type["sabaka.sabaka.sabaka"] }.to raise_error(Dry::Types::ConstraintError) }
    end
  end
end