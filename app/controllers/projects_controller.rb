class ProjectsController < ApplicationController
  # Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

  get '/projects' do
    authenticate_user
    @user = User.find(current_user.id)
    @client = Client.find(current_client.id)
    erb :'projects/index'
  end

  get '/projects/new' do
    authenticate_user
    @user = User.find(current_user.id)
    @client = Client.find_by(id: session[:client_id])
    @project = Project.new
    erb :'projects/new'
  end

  post '/projects' do
    authenticate_user
    @project = Client.find_by(id: session[:client_id]).projects.build(params[:project])
    if @project.save
      redirect '/projects'
    else
      redirect '/projects/new'
    end
  end

  get '/projects/:id' do
    authenticate_user
    @user = User.find(current_user.id)
    @client = Client.find_by_id(session[:client_id])
    @project = Project.find_by_id(params[:id])
    session[:project_id] = @project.id
    erb :'projects/show'
  end

  get '/projects/:id/edit' do
    authenticate_user
    @user = User.find(current_user.id)
    @client = Client.find_by_id(session[:client_id])
    @project = Project.find(params[:id])
    erb :'projects/edit'
  end

  patch '/projects/:id' do
    authenticate_user
    project = Project.find(params[:id])
    project.update(params[:project])
    if !project.valid?
      redirect("projects/#{project.id}/edit")
    else
      redirect("projects/#{project.id}")
    end
  end

  delete '/projects/:id/delete' do
    authenticate_user
    @project = Project.find(params[:id])
    @project.delete
    redirect '/projects'
  end

end
