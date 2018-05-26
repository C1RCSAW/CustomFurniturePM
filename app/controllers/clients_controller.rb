class ClientsController < ApplicationController
  # Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

  get '/clients' do
    if logged_in?
      @user = User.find(current_user.id)
      @client = Client.find_by_id(params[:id])
      erb :'clients/index'
    else
      redirect '/login'
    end
  end

  post '/clients' do
    params.to_s
  end



  get '/clients/new' do
    if logged_in?
      @user = User.find(current_user.id)
      erb :'clients/new'
    else
      redirect '/login'
    end
  end

  get '/clients/:id' do
    if logged_in?
      @client = Client.find_by_id(params[:id])
      erb :'clients/show'
    else
      redirect '/login'
    end
  end


end
