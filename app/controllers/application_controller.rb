
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end
#read
  get '/articles' do
    @articles = Article.all
    erb :index
  end
#read
  get '/article/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
#create
  get 'articles/new' do
    @article = Article.new
    erb :new
  end
#create
  post '/articles' do
    @article = Article.create(params)
    redirect to '/articles/#{@article.id}'
  end
#update
  get 'articles/:id/edit' do
    @article = Article.find(param[:id])
    erb :edit
  end
#update
  patch 'articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:id])
    redirect to '/articles/#{article.id}'
  end
#delete
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to '/articles'
  end



end
