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

  get '/clients/new' do
    if logged_in?
      @user = User.find(current_user.id)
      erb :'clients/new'
    else
      redirect '/login'
    end
  end

  post '/clients' do
    client = current_user.clients.build(params[:client])
    if client.save
      redirect '/clients'
    else
      # flash[:message] = client.errors.collect{|field, error| "#{field.to_s.capitalize}: #{error}"}.join("<br/>")
      redirect '/client/new'
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

  get '/clients/:id/edit' do
    if logged_in?
     @user = User.find(current_user.id)
     @client = Client.find(params[:id])
     erb :'clients/edit'
   else
     redirect to '/login'
   end
 end




end
