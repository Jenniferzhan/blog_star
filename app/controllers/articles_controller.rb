class ArticlesController < ApplicationController

  # GET /articles
  # GET /articles.json
  def index
    if params[:category_id].present?
      @articles = Article.where(category_id: params[:category_id])
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

  def update
    @category = Category.find(params[:category_id]) 
    @article = @category.articles.find(params[:id]) 
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to category_article_path(@category, @article),  notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
