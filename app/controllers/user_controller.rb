class UsersController < ApplicationController


  get '/signup' do
    if !logged_in?
      erb :'users/signup', locals: {message: "Please sign up before you login"}
    else
      redirect to "users/#{user.id}"
    end
  end


  post '/signup' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = "Invalid Username. Try again"
      redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to "users/#{@user.id}"
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "users/#{user.id}"
    else
      flash[:notice] = "Invalid Userrname or Password. Please Try again or Sign Up!"
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/home'
    else
      redirect to '/home'
    end
  end

  get '/users/:id' do
    erb :index
  end
end