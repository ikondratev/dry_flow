require "spec_helper"

RSpec.describe HTTP::Actions::Commands::AddEncourageToAccount, type: :http_action do
  let(:action) { described_class.new(command: command) }

  subject { action.call(env_params) }

  let(:account_id) { 1 }

  let(:env_params) do
    {
      account_id: account_id
    }
  end

  context "when command complete business logic correct" do
    let(:command) { ->(*) { Success(scored: 1100) } }

    it { expect(subject.status).to eq(200) }
    it { expect(subject.body.first).to eq({ scored: 1100 }.to_json) }
  end

  context "when command failed" do
    context "and account not founded" do
      let(:command) { ->(*) { Failure([:account_not_found, { error: "account wasn't found" }]) } }

      it { expect(subject.status).to eq(404) }
      it { expect(subject.body.first).to eq({ error: "account wasn't found" }.to_json) }
    end

    context "and account was blocked" do
      let(:command) { ->(*) { Failure([:account_was_blocked, { error: "account was blocked" }]) } }

      it { expect(subject.status).to eq(422) }
      it { expect(subject.body.first).to eq({ error: "account was blocked" }.to_json) }
    end

    context "and nothing was tested" do
      let(:command) { ->(*) { Failure([:nothing_was_tested, { error: "nothing was tested" }]) } }

      it { expect(subject.status).to eq(422) }
      it { expect(subject.body.first).to eq({ error: "nothing was tested" }.to_json) }
    end

    context "and toy wasn't found" do
      let(:command) { ->(*) { Failure([:wrong_toy, { error: "toy wasn't found" }]) } }

      it { expect(subject.status).to eq(422) }
      it { expect(subject.body.first).to eq({ error: "toy wasn't found" }.to_json) }
    end
  end
end