class UserController < ApplicationController

    

    get '/signup' do
        if !session[:user_id]
            erb :'/user/new'
        else
            redirect to '/recipes'
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @user= User.create(:username => params[:username], :password => params[:password])
            session[:user_id]= @user.id
            redirect to '/recipes'
        end
    end

    get '/login' do
        if logged_in?
            redirect to '/recipes'
        else
            erb :'/user/login'
        end
    end

    post '/login' do
        user= User.find_by("username"=> params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/recipes'
        else
            redirect to '/signup'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect to '/login'
        else
            redirect to '/'
        end
    end

end