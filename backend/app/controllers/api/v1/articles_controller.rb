class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.order(created_at: :desc)
    render json: {
      status: 'SUCCESS', message: 'loaded articles', data: articles
    }
  end

  def show
    article = Article.find(params[:id])
    render json: {
      status: 'SUCCESS', message: 'loaded the article', data: article
    }
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: {
        status: 'SUCCESS', message: 'loaded the article', data: article
      }
    else
      render json: {
        status: 'ERROR', message: 'article not saved', data: article.errors
      }
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    render json: {
      status: 'SUCCESS', message: 'deleted the article', data: article
    }
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      render json: {
        status: 'SUCCESS', message: 'updated the article', data: article
      }
    else
      render json: {
        status: 'SUCCESS', message: 'loaded the article', data: article
      }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title)
  end
end
