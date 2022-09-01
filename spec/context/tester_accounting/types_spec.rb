require "./spec/spec_helper"

RSpec.describe TesterAccounting::Types do
  describe "CatToyOptions" do
    let(:type) { TesterAccounting::Types::CatToyOptions }

    context "when characteristic is correct" do
      it { expect(type["This is toy options like"]).to eq("This is toy options like") }
    end

    context "when characteristic is less than 10 chars" do
      it { expect { type["less 10"] }.to raise_error(Dry::Types::ConstraintError) }
    end
  end

  describe "CatToyTitle" do
    let(:type) { TesterAccounting::Types::CatToyTitle }

    context "when cat toy title is correct" do
      it { expect(type["Name of toy"]).to eq("Name of toy") }
    end

    context "when cat toy title is less than 3 chars" do
      it { expect { type['X'] }.to raise_error(Dry::Types::ConstraintError) }
    end
  end

  describe "ReportComment" do
    let(:type) { TesterAccounting::Types::ReportComment }

    context "when ReportComment is correct" do
      it { expect(type["This is toy options like"]).to eq("This is toy options like") }
    end

    context "when ReportComment is less than 10 chars" do
      it { expect { type["less 10"] }.to raise_error(Dry::Types::ConstraintError) }
    end
  end
end