class RepliesController < ApplicationController

	def create
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.create(reply_params.merge(user_id: current_user.id))
    if @reply.save
        redirect_to root_path
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @reply =@comment.replies.find(params[:id])
    @reply.destroy
     redirect_to root_path
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:comment_id])
    @reply =@comment.replies.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])
    # @comment = @article.comments.create(:id)
    if @reply.update(reply_params)
      redirect_to root_path
    else
      render :edit
    end
  end

private 
  def reply_params
     params.require(:reply).permit(:body)
  end
end

