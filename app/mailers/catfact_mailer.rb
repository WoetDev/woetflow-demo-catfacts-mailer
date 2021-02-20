class CatfactMailer < ApplicationMailer
  def daily_catfact
    @user = params[:user]
    @fact = params[:fact]
    mail(to: @user.email, subject: "Daily catfact! ##{Fact.last&.id}")
  end
end
