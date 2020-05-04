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

    get '/recipes/:slug/edit' do
        if logged_in?
            @recipe= Recipe.find_by_slug(params[:slug])
            erb :'recipes/edit'
        else
            redirect to '/'
        end
    end

    get '/recipes/:slug' do
        if logged_in?
            @recipe= Recipe.find_by_slug(params[:slug])
            erb :'recipes/show'
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
                    ingredients: params[:ingredients],
                    directions: params[:directions])
                redirect to '/recipes'
            end
        else
            redirect to '/login'
        end
    end

    patch '/recipes/:slug' do
        if logged_in?
            @recipe= Recipe.find_by_slug(params[:slug])
            @recipe.name= params[:recipe_name]
            @recipe.ingredients= params[:ingredients]
            @recipe.directions= params[:directions]
            @recipe.save
            redirect to "/recipes/#{@recipe.slug}"
        else
            redirect to '/login'
        end
    end

end