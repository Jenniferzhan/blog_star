
module CurrentCategory
  extend ActiveSupport::Concern

  private

  def set_category 
    @category = Category.find(session[:category_id])
  rescue ActiveRecord::RecordNotFound
    @category = Category.create
    session[:category_id] = @category.id
  end 
end

