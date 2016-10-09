class ArticlesController < ApplicationController

  # GET /articles
  # GET /articles.json
  def index
    if params[:search].present? 
      @articles = Article.search(params[:search]) 
    else
      @articles = Article.all
    end
  end

  def new
    @article = Article.new
  end
  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    #@article.comments.build
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :text, comments_attributes: [:name, :email, :body])
  end
end
