class WishlistController < ApplicationController

get '/wishlist' do
    if logged_in?
      @games = Game.all
      erb :'/wishlist'
    else
      redirect to '/login'
    end
  end

get '/wishlist/addgamewish' do
    if logged_in?
      erb :'wishlist/addgamewish'
    else
      redirect to '/login'
    end
  end

  post '/wishlist' do
    if logged_in?
        @wishlist = current_user.wishlist.build(gamename: params[:gamename], 
        	console_format: params[:console_format])
        @wishlist.save
        redirect to "/wishlist"
    else
      redirect to '/login'
    end
  end

end