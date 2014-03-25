require 'sinatra/base'
require 'sinatra'

class Appy < Sinatra::Application

  FOOD = []

  get '/' do
    erb :index
  end

  get '/new-item' do
    erb :new_items
  end

  post '/' do
    FOOD << params[:new_item]
    redirect '/'
  end

  get '/item/:id' do
    @id = params[:id].to_i
    erb :item
  end

  get '/item/:id/edit' do
    @id = params[:id].to_i
    erb :edit_item
  end

  put '/item/:id' do
    @id = params[:id].to_i
    FOOD[@id] = params[:submit_edit]
    redirect '/'
  end
end