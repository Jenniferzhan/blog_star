class Admin::SessionsController < ApplicationController
  protect_from_forgery :except => :index
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])&&simple_captcha_valid? 
      session[:user_id] = user.id     
      puts "**************************************"
      redirect_to admin_articles_url    
    else
      redirect_to 'new', alert: "Invalid user/password combination/simple_captcha"
    end
  end

  def destroy                  
    session[:user_id] = nil    
    redirect_to new_admin_session_path, notice: "Logged out" 
  end

  private

  def user_params
    params.require(:session).permit(:name, :password, :simple_captcha)
  end
end
