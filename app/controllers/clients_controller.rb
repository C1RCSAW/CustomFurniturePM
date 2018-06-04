class ClientsController < ApplicationController
  # Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

  get '/clients' do
    authenticate_user
    @user = User.find(current_user.id)
    erb :'clients/index'
  end

  get '/clients/new' do
    authenticate_user
    @user = User.find(current_user.id)
    erb :'clients/new'
  end

  post '/clients' do
    authenticate_user
    client = current_user.clients.build(params[:client])
    if client.save
      redirect '/clients'
    else
      redirect '/clients/new'
    end
  end

  get '/clients/:id' do
    authenticate_user
    @user = User.find(current_user.id)
    @client = @user.clients.find_by_id(params[:id])
    session[:client_id] = @client.id
    erb :'clients/show'
  end

  get '/clients/:id/edit' do
    authenticate_user
    @user = User.find(current_user.id)
    @client = @user.clients.find_by_id(params[:id])
    erb :'clients/edit'
  end

 patch '/clients/:id' do
   authenticate_user
   client = Client.find(params[:id])
   client.update(params[:client])
   if !client.valid?
     redirect("clients/#{client.id}/edit")
   else
     redirect("/clients/#{client.id}")
   end
 end

 delete '/clients/:id/delete' do
   authenticate_user
   @client = @user.clients.find_by_id(params[:id])
   @client.delete
   redirect '/clients'
 end

end
