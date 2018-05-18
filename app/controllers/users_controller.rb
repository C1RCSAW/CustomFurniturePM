class UsersController < ApplicationController
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/login' do
    if !logged_in?
      erb :'login'
    else
      redirect '/clients'
    end
  end
end
