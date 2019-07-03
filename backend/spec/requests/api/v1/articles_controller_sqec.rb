require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /articles' do
    before do
      @articles = FactoryBot.create_list(:article, 2)
    end

    it 'リクエストが成功したか確認する' do
      get '/api/v1/articles'
      expect(response.status).to eq(200)
    end

    it '正しい取得データ数か確認する' do
      get '/api/v1/articles'
      json = JSON.parse(response.body)
      expect(json.size).to eq @articles.count
      expect(json[0]['id']).to eq @articles[0].id
      expect(json[1]['id']).to eq @articles[1].id
    end
  end

  describe 'POST /articles' do
    before do
      @params = FactoryBot.attributes_for(:article)
    end

    it 'リクエストが成功したか確認する' do
      post '/api/v1/articles', @params
      expect(response).to be_success
      expect(response.status).to eq(201)
    end

    it '新しいArticleを作成する' do
      expect { post '/api/v1/articles', @params }.to change(Article, :count).by(1)
    end
  end
end
