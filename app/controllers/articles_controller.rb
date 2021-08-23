class ArticlesController < ApplicationController
  before_action :ensure_current_user

  def index
    @articles = Article.all.includes(:comments)
    @articles = Article.desce
    @article = Article.new
      respond_to do |format|
        format.html
        format.json {
          render json: @articles
        }
      end
  end
  
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
      if @article.save
      respond_to do |format|
        format.html {
          redirect_to root_path
        }
        format.json {
        render json: @article
        }
       end
      else
        @articles = Article.all
        render :index
      end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      respond_to do |format|
      format.html {redirect_to root_path}
      format.json {
        render json: @article
      }
    end
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.json {
        render json: { mesage:"succesfully deleted" }
      }
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

end

      