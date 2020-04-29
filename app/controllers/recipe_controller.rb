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

    post '/recipes' do
        if logged_in?
            if params[:recipe_name] == "" || params[:ingredients] == "" || params[:directions] == ""
                redirect to '/recipes/new'
            else
                @recipe= current_user.recipes.create(name: params[:recipe_name],
                    ingredients: params[:ingredients].split(/\r\n/),
                    directions: params[:directions].split(/\r\n/))
                redirect to '/recipes'
            end
        else
            redirect to '/login'
        end
    end

end