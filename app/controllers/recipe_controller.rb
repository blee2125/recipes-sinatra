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
            
        else

        end
    end

end