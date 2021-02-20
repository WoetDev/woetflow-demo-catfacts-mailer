# Preview all emails at http://localhost:3000/rails/mailers/catfact_mailer
class CatfactMailerPreview < ActionMailer::Preview
  def daily_catfact
    CatfactMailer.with(user: User.first, fact: CatfactServices::Catfact.new.daily_fact).daily_catfact
  end
end
