class ProjectsController < ApplicationController
  # Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  get '/projects/:id' do
    if logged_in?
      @client = Client.find_by_id(params[:id])
      @project = Project.find_by_id(params[:id])
      erb :'projects/show_project'
    else
      redirect to '/login'
    end
  end
end
