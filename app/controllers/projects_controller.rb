class ProjectsController < ApplicationController
  # Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

  get '/projects' do
    authenticate_user
    @user = current_user
    @client = current_client
    erb :'projects/index'
  end

  get '/projects/new' do
    authenticate_user
    @user = current_user
    @client = current_client
    erb :'projects/new'
  end

  post '/projects' do
    authenticate_user
    @project = current_client.projects.build(params[:project])
    if @project.save
      redirect '/projects'
    else
      @user = current_user
      @client = current_client
      erb :'projects/new'
    end
  end

  get '/projects/:id' do
    authenticate_user
    @user = current_user
    @client = current_client
    @project = @client.projects.find_by_id(params[:id])
    session[:project_id] = @project.id
    erb :'projects/show'
  end

  get '/projects/:id/edit' do
    authenticate_user
    @user = current_user
    @client = current_client
    @project = @client.projects.find_by_id(params[:id])
    erb :'projects/edit'
  end

  patch '/projects/:id' do
    authenticate_user
    @project = Project.find(params[:id])
    @project.update(params[:project])
    if !@project.valid?
      @client = current_client
      erb :'projects/edit'
    else
      redirect("projects/#{@project.id}")
    end
  end

  delete '/projects/:id/delete' do
    authenticate_user
    project = current_client.projects.find(params[:id])
    project.delete
    redirect '/projects'
  end

end
