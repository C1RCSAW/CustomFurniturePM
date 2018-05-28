class ProjectsController < ApplicationController
  # Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

  get '/projects' do
    if logged_in?
      @user = User.find(current_user.id)
      @client = @user.clients.find_by(name: params[:client])
      erb :'projects/index'
    else
      redirect '/login'
    end
  end

  get '/projects/new' do
    authenticate_user
    @user = User.find(current_user.id)
    @client = @user.clients.find_by(name: params[:client])
    erb :'projects/new'
  end

  get '/projects/:id' do
    if logged_in?
      @user = User.find(current_user.id)
      @client = Client.find_by_id(params[:id])
      @project = Project.find_by_id(params[:id])
      erb :'projects/show'
    else
      redirect to '/login'
    end
  end
end
