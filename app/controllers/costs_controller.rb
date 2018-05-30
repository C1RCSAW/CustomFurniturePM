class CostsController < ApplicationController
  # Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

  get '/costs' do
    authenticate_user
    @user = User.find(current_user.id)
    @client = Client.find(current_client.id)
    @project = Project.find(current_project.id)
    erb :'costs/index'
  end

  get '/costs/new' do
    authenticate_user
    @user = User.find(current_user.id)
    @client = Client.find(current_client.id)
    @project = Project.find(current_project.id)
    erb :'costs/new'
  end

  post '/costs' do
    authenticate_user
  end

end
