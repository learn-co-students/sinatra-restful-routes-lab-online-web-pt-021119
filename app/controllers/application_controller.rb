class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    binding.pry

    erb :index
  end

  get '/recipes/new' do

    erb :recipes_new
  end

end
