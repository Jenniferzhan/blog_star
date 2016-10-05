class CommentsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @article = @category.article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :body, :email)
  end
end

