require "spec_helper"

RSpec.describe HTTP::Actions::Commands::AddToyToTester, type: :http_action do
  let(:action) { described_class.new(command: command) }

  subject { action.call(env_params) }

  let(:account_id) { 1 }
  let(:toy_id) { 1 }

  let(:env_params) do
    {
      id: toy_id,
      account_id: account_id
    }
  end

  context "when command complete business logic correct" do
    let(:command) { ->(*) { Success(toy_id: toy_id) } }

    it { expect(subject.status).to eq(200) }
    it { expect(subject.body.first).to eq({ toy_id: toy_id }.to_json) }

    it "calls command with right data" do
      expect(command).to receive(:call).with(toy_id, account_id).and_return(Success(:done))
      subject
    end
  end

  context "when command failed" do
    context "and account not founded" do
      let(:command) { ->(*) { Failure([:account_not_found, { error: "account wasn't found" }]) } }

      it { expect(subject.status).to eq(404) }
      it { expect(subject.body.first).to eq({ error: "account wasn't found" }.to_json) }

      it "calls command with right data" do
        expect(command).to receive(:call).with(toy_id, account_id).and_return(Failure([:account_not_found, {}]))
        subject
      end
    end

    context "and testing queue is full" do
      let(:command) { ->(*) { Failure([:queue_full, { error: "queue is full" }]) } }

      it { expect(subject.status).to eq(422) }
      it { expect(subject.body.first).to eq({ error: "queue is full" }.to_json) }

      it "calls command with right data" do
        expect(command).to receive(:call).with(toy_id, account_id).and_return(Failure([:queue_full, {}]))
        subject
      end
    end

    context "and toy already in the queue" do
      let(:command) { ->(*) { Failure([:toys_exist_in_queue, { error: "toy already testing" }]) } }

      it { expect(subject.status).to eq(422) }
      it { expect(subject.body.first).to eq({ error: "toy already testing" }.to_json) }

      it "calls command with right data" do
        expect(command).to receive(:call).with(toy_id, account_id).and_return(Failure([:queue_full, {}]))
        subject
      end
    end
  end
end