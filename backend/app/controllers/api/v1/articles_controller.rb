class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'loaded posts', data: posts }
  end
end
