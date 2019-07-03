class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  PER = 8

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.select('id, title, tag, created_at').page(params[:page]).per(PER)
    render json: @articles
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    render json: @article
  end

  # GET /articles
  # GET /articles.json
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @user
    else
      render json: @article.errors, status: :unprocessable_entry
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entry
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @articles.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.fetch(:article, {})
  end
end
