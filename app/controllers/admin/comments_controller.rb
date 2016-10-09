class Admin::CommentsController < ApplicationController
  before_action :authorize

  def index
    if params[:article_id].present?
    @comments = Comment.where(article_id: params[:article_id])
    else
      @comments = Comment.all
  end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end 

  private
  def comment_params
    params.require(:comment).permit(:name, :body, eamil)
  end 
end
