class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do  #done
    erb :new
  end

  get '/recipes' do  #done
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do  #done
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do  #done
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  post '/recipes' do #done
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  patch '/recipes/:id' do #done
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do #done
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to "/recipes"
  end

end
