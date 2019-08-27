
require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
 binding.pry
    @articleTitle = params[:title]
    @article = Article.new
    binding.pry
    erb :show
  end
end
