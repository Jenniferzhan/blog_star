class SessionsController < ApplicationController
  def new
  end


  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id     
      redirect_to admin_url    
      if !simple_captcha_valid?
        flash[:notice] = "验证码输入有误"
        Return render("new")   
      end
    else
      redirect_to login_url alert: "Invalid user/password combination"
    end
  end

  def destroy                  
    session[:user_id] = nil    
    redirect_to store_url, notice: "Logged out" 
  end
end 

