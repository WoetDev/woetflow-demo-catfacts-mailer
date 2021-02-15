class UsersController < ApplicationController
  def index
    @user = User.new
    @catfact = CatfactServices::Catfact.new.fact["fact"]
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:notice] = "Pawsome! #{@user.email} will now receive daily cat facts"
      redirect_to root_path
    else
      flash[:alert] = "Apawlogies! We couldn't subscribe #{@user.email}.."
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
