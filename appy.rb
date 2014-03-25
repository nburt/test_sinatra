require 'sinatra/base'

class Appy < Sinatra::Base

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
end