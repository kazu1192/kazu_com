require 'rails_helper'

describe 'GET #index' do
  before do
    FactoryBot.create_list(:article, 10)
  end

  it 'リクエストが成功したか確認する' do
    get '/api/v1/articles'
    expect(response.status).to eq(200)
  end

  it '正しい取得データ数か確認する' do
    get '/api/v1/articles'
    json = JSON.parse(response.body)
    expect(json['data'].length).to eq(10)
  end
end

describe 'GET #show' do
  before do
    FactoryBot.create(:article, id: 1, title: 'test-title')
  end

  it 'リクエストが成功したか確認する' do
    get '/api/v1/articles/1'
    expect(response.status).to eq(200)
  end

  it '指定したidのArticleが取得出来たことを確認する' do
    get '/api/v1/articles/1'
    json = JSON.parse(response.body)
    expect(json['data']['title']).to eq('test-title')
  end
end
