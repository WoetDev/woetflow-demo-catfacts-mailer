class UsersController < ApplicationController
  def index
    @user = User.new
    @catfact = CatfactServices::Catfact.new.daily_fact
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash.now[:notice] = "Pawsome! #{@user.email} will now receive daily cat facts"
      render "index"
    else
      flash.now[:alert] = "Apawlogies! We couldn't subscribe #{@user.email}.."
      render "index"
    end
  end

  def unsubscribe
    @user = User.find_by(email: params[:email])
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:notice] = "Incoming cat knowledge cancelled! #{@user.email} has been successfully unsubscribed"
      redirect_to root_path
    else
      flash.now[:alert] = "Apawlogies! #{@user.email} couldn't be unsubscribed. Please contact wouter.bruynsteen@gmail.com if the problem persists."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
