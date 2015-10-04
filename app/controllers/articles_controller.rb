class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])    
  end

  def create
    @article = Article.new(article_params)
    @article.save
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def home
    @article = Article.first
    render template: "/articles/show"
  end
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
