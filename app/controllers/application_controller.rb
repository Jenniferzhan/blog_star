class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  protect_from_forgery with: :exception

  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to new_admin_session_url, notice: "请先登陆"
    end 
  end 
end
