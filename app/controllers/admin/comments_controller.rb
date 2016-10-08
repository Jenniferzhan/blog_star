class Admin::CommentsController < ApplicationController

  def index
    @article = Article.find(params[:article_id])
    @comments = Comments.all

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end 

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end 
end
