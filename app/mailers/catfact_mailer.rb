class CatfactMailer < ApplicationMailer
  def daily_catfact
    @user = params[:user]
    @fact = params[:fact]
    mail(to: @user.email, subject: "Daily Catfact")
  end
end
