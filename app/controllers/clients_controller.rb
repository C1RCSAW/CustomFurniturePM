class ClientsController < ApplicationController
  # Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  get '/clients/:id' do
    if logged_in?
      @client = Client.find_by_id(params[:id])
      erb :'clients/show_client'
    else
      redirect to '/login'
    end
  end

  get '/clients' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      @client = Client.find_by_id(params[:id])
      erb :'clients/clients'
    else
      redirect to '/login'
    end
  end
end
