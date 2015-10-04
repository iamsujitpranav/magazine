class CommentsController < ApplicationController
  def comment_refresh    
    @article = Article.find(params[:id])
    render partial: "comment"
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
