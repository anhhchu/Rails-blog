class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy] 
  #, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    set_article
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # # # GET /articles/1/edit
  def edit
    #byebug
    set_article
  end

  # POST /articles or /articles.json
  def create
    #render plain: params[:article]
    @article = Article.new(article_params)
    #render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article created successfully"
      redirect_to @article
    else
      flash[:arlert] = "Article not saved"
      render 'new'
    end
    
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    # render plain: params[:article]
    set_article
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    set_article
    @article.destroy
    redirect_to articles_path
  end

  private
  #Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  #Only allow a list of trusted parameters through.
  def article_params
    params.required(:article).permit(:title, :description)
  end

  
end
