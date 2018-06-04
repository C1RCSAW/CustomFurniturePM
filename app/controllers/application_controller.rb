class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'welderiaint'
  end

  get '/' do
    if logged_in?
      user = User.find(current_user.id)
      redirect to "/users/#{user.slug}"
    else
      erb :index
    end
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def authenticate_user
      redirect('/login') unless logged_in?
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def current_client
      @current_client ||= @current_user.clients.find_by(id: session[:client_id]) if session[:client_id]
    end

    def current_project
      @current_project ||= @current_client.projects.find_by(id: session[:project_id]) if session[:project_id]
    end

  end

end
