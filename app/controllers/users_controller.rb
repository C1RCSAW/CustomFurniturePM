class UsersController < ApplicationController
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
  if logged_in?
    redirect to '/clients'
  else
    erb :'users/create_user'
  end
end

post '/signup' do
  if params[:email] == "" || params[:username] == "" || params[:password] == ""
    redirect to '/signup'
  else
    user = User.create(params)
    session[:user_id] = user.id
    redirect to '/clients'
  end
end

  get '/login' do
    if !logged_in?
      erb :'login'
    else
      redirect to '/clients'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/clients'
    else
      redirect to '/'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
