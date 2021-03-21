
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all

    erb :'../views/index'
  end

  get '/articles/new' do
    erb :'../views/new'
  end

  post '/articles' do
    @article = Article.new(title: params[:title], content: params[:content])
    @article.save

    redirect "/articles/#{@article[:id]}" # need double quotes to invoke string interpolation
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :'../views/show'
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :'../views/edit'
  end

  patch '/articles/:id' do

    @article = Article.find(params[:id])

    @article.title = params[:title]
    @article.content = params[:content]

    @article.save

    redirect "/articles/#{@article[:id]}" # need double quotes to invoke string interpolation
  end

  delete '/articles/:id' do
    puts "In delete route"
    puts params[:id]
    # go back to all articles
  end

end
