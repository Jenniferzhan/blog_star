class Picture < ApplicationRecord

  def choose  
    picture = Picture.find(params[:picture_id])  
    @picture = picture.picture
    render 'choose_picture.js.erb'  
  end 
end
