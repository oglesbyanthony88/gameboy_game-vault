class UsersController < ApplicationController
  # get '/users/:slug' do
  #   @user = User.find_by_slug(params[:slug])
  #   erb :'users/show'
  # end

  get '/signup' do
    if !logged_in?
      erb :'users/signup', locals: {message: "Please sign up before you sign in"}
    else
      redirect to "users/#{user.id}"
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      user = User.new(:username => params[:username], :password => params[:password])
      user.save
      session[:user_id] = user.id
      redirect to "users/#{user.id}"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to "users/#{user.id}"
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "users/#{user.id}"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  get '/users/:id' do
    erb :'/users/show'
  end
end