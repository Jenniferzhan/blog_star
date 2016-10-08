module CurrentUser
  extend ActiveSupport::Concern
  private
  def current_user
    @user = User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    @user = User.create
    session[:user_id] = @user.id
  end 
end 
