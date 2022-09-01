require "spec_helper"

RSpec.describe ToyTesting::Commands::AddToyToTesterAccount, type: :command do
  subject { command.call({ account_id: account_id, toy_id: toy_id }) }

  let(:command) { described_class.new(account_repo: account_repo, toy_repo: toy_repo) }
  let(:toy_id) { 1 }
  let(:account_id) { 1 }
  let(:account_repo) { instance_double(ToyTesting::Repositories::Account, find_by: account) }
  let(:toy_repo) { instance_double(ToyTesting::Repositories::Toy, where: [toy], add_test_account: toy) }
  let(:toy) { ToyTesting::Entities::Toy.new(id: 2, title: "Big toy", test_account_id: account_id, options: "buuuuuuuuuuuuuuuuuuuu") }
  let(:account) { ToyTesting::Entities::Account.new(id: account_id, name: "test_account", email: "test@test.test", last_name: "buuuu", blocked: false) }

  context "when everything is okay" do
    it "shouldn't raise any errors" do
      expect{ subject }.not_to raise_error
      expect(subject).to be_success
    end
  end

  context "when account not found" do
    let(:account) { nil }

    it { expect(subject).to be_failure }
    it { expect(subject.failure).to eq([:account_not_found, { account_id: 1 }]) }
  end
end