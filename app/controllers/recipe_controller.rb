class RecipeController < ApplicationController

    get '/recipes' do
        if logged_in?
            @recipes= Recipe.all
            erb :'recipes/index'
        else
            redirect to "/"
        end
    end

    get '/recipes/new' do
        if logged_in?
            @user= current_user
            erb :'recipes/new'
        else
            redirect to '/'
        end
    end

    get '/recipes/:slug' do
        @recipe= Recipe.find_by_slug(params[:slug])
        erb :'recipes/show'
    end

    post '/recipes' do
        if logged_in?
            if params[:recipe_name] == "" || params[:ingredients] == "" || params[:directions] == ""
                redirect to '/recipes/new'
            else
                
                @recipe= current_user.recipes.create(name: params[:recipe_name],
                    ingredients: params[:ingredients],
                    directions: params[:directions])
                redirect to '/recipes'
            end
        else
            redirect to '/login'
        end
    end

end