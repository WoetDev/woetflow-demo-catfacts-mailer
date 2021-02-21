require "rails_helper"

RSpec.describe CatfactMailer, type: :mailer do
  describe "daily-catfact" do
    let(:user) { build(:user) }
    let(:fact) { CatfactServices::Catfact.new(50).fact["fact"] }
    let(:mail) { CatfactMailer.with(user: user, fact: fact).daily_catfact }

    it "renders the headers" do
      expect(mail.subject).to eq("Daily catfact! ##{Fact.count}")
      expect(mail.from).to eq(["wouter.bruynsteen@gmail.com"])
      expect(mail.to).to eq(["user@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(fact)
    end
  end
end
