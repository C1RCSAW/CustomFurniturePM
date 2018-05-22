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
end
