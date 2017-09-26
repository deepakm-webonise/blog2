class CommentsController < ApplicationController
  before_action :find_article, only: [:create, :destroy]
  http_basic_authenticate_with name: 'user', password: 'password',
                               only: [:destroy]
  def create
    if @article.comments.create(comment_params)
      redirect_to article_path(@article)
      flash[:success] = 'comment has been posted'
    else
      flash[:danger] = 'comment must have contents'
      render 'form'
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
