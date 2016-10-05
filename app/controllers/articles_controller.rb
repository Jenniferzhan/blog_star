class ArticlesController < ApplicationController
   skip_before_filter :verify_authenticity_token, :only => [:destroy]

  # GET /articles
  # GET /articles.json
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

  # GET /articles/1
  # GET /articles/1.json
  def show
    @category = Category.find(params[:category_id])
    @articles = @category.articles.find(params[:id])
    @article = Article.find(params[:id])
  end

  # GET /articles/1/edit
  def edit
    @category = Category.find(params[:category_id])
     @articles = @category.articles.find(params[:id])
      @article = Article.find(params[:id])

  end

  # POST /articles
  # POST /articles.json
  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.create(article_params)
    redirect_to category_path(@category) 
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @category = Category.find(params[:category_id]) 
    @article = @category.articles.find(params[:article_id]) 
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
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
    redirect_to category_path(@category)
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
