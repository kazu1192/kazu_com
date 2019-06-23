class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: [:update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    render json: @articles
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles
  # GET /articles.json
  def create
    @article = Article.new(article_params)

    if @article.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entry
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    if @article.update(article_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entry
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @articles.destroy
  end

  private

  def article_params
    params.require(:article).permit(:title)
  end
end
