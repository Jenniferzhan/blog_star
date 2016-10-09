class Admin::ArticlesController < ApplicationController
  before_action :authericate_user!

  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
    end
    if params[:category_id].present?
      @articles = Article.where(category_id: params[:category_id])
    else
      @articles = Article.all
    end
  end

  def new
    @article = Article.new
  end


  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.create(article_params)
    @article.save
    redirect_to admin_articles_path(@category) 
  end

  def show
    @article = Article.find(params[:id])
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
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

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @category = Category.find(params[:category_id]) 
    @article = @category.articles.find(params[:id])
    @article.destroy
    redirect_to admin_category_articles_path(@category)
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title,:category_id, :text, comments_attributes: [:name, :email, :body])
  end
end
