class UsersController < ApplicationController
  get '/users/:slug' do
    if current_user == User.find_by_slug(params[:slug])
      @user = User.find_by_slug(params[:slug])
      erb :'users/show_user'
    else
      redirect '/'
    end
  end

  get '/signup' do
    if logged_in?
      redirect '/clients'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      redirect '/login'
    else
      erb :'users/create_user'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'login'
    else
      redirect '/clients'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/clients'
    else
      @login_error = "invalid username or password"
      erb :'login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
  end

end
