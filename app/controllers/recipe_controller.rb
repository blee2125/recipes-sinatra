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

end