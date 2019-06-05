class ApplicationController < Sinatra::Base
  configure do
  set :public_folder, 'public'
  set :views, 'app/views'
end

get '/recipes' do
  @recipes = Recipe.all

  erb :index
end

post '/recipes' do
  if recipe = Recipe.create(params)
    redirect "/recipes/#{recipe.id}"
  else
    redirect '/recipes/new'
  end
end

  get '/recipes/new' do

  erb :recipe_new
end

delete '/recipes/:id' do
  Recipe.find(params[:id]).destroy

  redirect '/recipes'
end

patch '/patch/:id' do
  recipe = Recipe.find(params[:id])
  recipe.name = params[:name]
  recipe.ingredients = params[:ingredients]
  recipe.cook_time = params[:cook_time]
  recipe.save

  redirect "recipes/#{recipe.id}"

end

get '/recipes/:id/edit' do
  @recipe = Recipe.find(params[:id])

  erb :edit
end

get '/recipes/:id' do
  @recipe = Recipe.find(params[:id])

  erb :show
  end
end