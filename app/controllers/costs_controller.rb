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
    @cost = Project.find(current_project.id).costs.build(params[:cost])
    if @cost.save
      redirect '/costs'
    else
      redirect '/costs/new'
    end
  end

  get '/costs/:id' do
    authenticate_user
    @user = User.find(current_user.id)
    @client = Client.find(current_client.id)
    @project = Project.find(current_project.id)
    @cost = Cost.find_by_id(params[:id])
    erb :'costs/show'
  end

  get '/costs/:id/edit' do
    authenticate_user
    @user = User.find(current_user.id)
    @client = Client.find(current_client.id)
    @project = Project.find(current_project.id)
    @cost = Cost.find_by_id(params[:id])
    session[:cost_id] = @cost.id
    erb :'costs/edit'
  end

  patch '/costs' do
    authenticate_user
    cost = Cost.find_by(id: session[:cost_id]) if session[:cost_id]
    cost.update(params[:cost])
    if !cost.valid?
      redirect("costs/#{cost.id}/edit")
    else
      redirect '/costs'
    end
  end

  delete '/costs/:id/delete' do
    authenticate_user
    @cost = Cost.find(params[:id])
    @cost.delete
    redirect '/costs'
  end

end
