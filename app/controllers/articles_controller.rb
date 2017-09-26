class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :show, :destroy]
  before_action :redirect_if_incorrect_url, only: [:show]
  # http_basic_authenticate_with name: "user", password: "password",
  #                                            except: [:index, :show]
  def index
    @article = Article.last
    @articles = Article.where.not(id: @article).sample(12)
  end

  def show
    @articles = Article.where.not(id: @article).sample(12)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def redirect_if_incorrect_url
    return if @article.pretty_path == "/#{@article.id}/#{params[:slug]}"
    redirect_to @article.pretty_path
  end
end
