require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "whatever"
    end

    # Index
    get '/articles' do
        @articles = Article.all
        erb :index
    end

    # New
    get '/articles/new' do
        erb :new
    end

    # Create
    post '/articles' do
        @article = Article.create(params)    
        redirect "/articles/#{@article.id}"
    end

    # Show
    get '/articles/:id' do
        @article = Article.find(params[:id])
        erb :show
    end

    # Edit - pulls up the edit form.
    get '/articles/:id/edit' do
        @article = Article.find(params[:id])
        erb :edit
    end

    # Update - updates the data upon submit.
    # * Note: update now takes in the specific params of [:article]
    patch '/articles/:id' do
        @article = Article.find(params[:id])
        @article.update(params[:article])
        redirect "/articles/#{@article.id}"
    end

    # Destroy
    delete '/articles/:id/delete' do
       @article = Article.find(params[:id])
       @article.destroy
       redirect "/articles"        
    end

end
