require "spec_helper"

RSpec.describe TesterAccounting::Commands::EncourageAccount, type: :command do
  subject { command.call(account_id) }

  let(:command) { described_class.new(account_repo: account_repo, toy_repo: toy_repo, report_repo: report_repo) }
  let(:toy_id) { 1 }
  let(:account_id) { 1 }
  let(:account_repo) { instance_double(TesterAccounting::Repositories::Account, find_by: account, add_score: true) }
  let(:toy_repo) { instance_double(TesterAccounting::Repositories::CatToy, find_by: toy) }
  let(:report_repo) { instance_double(TesterAccounting::Repositories::Report, where: [report]) }
  let(:report) { TesterAccounting::Entities::Report.new(id: 1, account_id: account_id, toy_id: toy_id, comment: "new testing", status: "done") }
  let(:toy) { TesterAccounting::Entities::CatToy.new(id: toy_id, title: "buuuuuuuuuuuuuuuuuuuu") }
  let(:account) { TesterAccounting::Entities::Account.new(id: account_id, name: "test_account", email: "test@test.test", last_name: "buuuu", blocked: false, score: 100) }

  context "when everything is okay" do
    it "shouldn't raise any errors" do
      expect{ subject }.not_to raise_error
      expect(subject).to be_success
    end
  end

  context "when account not found" do
    let(:account) { nil }

    it { expect(subject).to be_failure }
    it { expect(subject.failure).to eq([:account_not_found, { error: "account wasn't found" }]) }
  end
end