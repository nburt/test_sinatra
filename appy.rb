require 'sinatra/base'


class Appy < Sinatra::Base

  get '/' do
    erb :index
  end
end