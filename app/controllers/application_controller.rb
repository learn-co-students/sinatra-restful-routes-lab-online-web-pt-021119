class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do 
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all 
    erb :index
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find_by(:id => params[:id])
    erb :recipe
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit    
  end
  
  patch '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name, @recipe.indgredients, @recpie.cook_time = params[:name], params[:ingredients], params[:cook_time]
    @recipe.save 
    redirect "/recipes/#{@recipe.id}"   
  end

  post '/recipes' do  
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  # delete '/recipes/:id/delete' do 
  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
  end

end
# https://stackoverflow.com/questions/22074545/difference-between-redirect-and-redirect-to-in-sinatra