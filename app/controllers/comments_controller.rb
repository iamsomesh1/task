class CommentsController < ApplicationController
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
    respond_to do |format|
        format.html {
          redirect_to root_path
        }
        format.json {
        render json: @comment
        }
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to root_path
    else
     render :edit
    end
  end

  def destroy
    @article =Article.find(params[:article_id])
    @comment =@article.comments.find(params[:id])
    @comment.destroy
     redirect_to root_path
  end
  
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
