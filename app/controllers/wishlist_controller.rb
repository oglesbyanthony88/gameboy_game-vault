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

  get '/wishlist/:id/showwishgame' do
    if logged_in?
      @wishlist = Wishlist.find_by_id(params[:id])
      if @wishlist && @wishlist.user == current_user
        erb :'wishlist/showwishgame'
      else
        redirect to '/wishlist'
      end
    else
      redirect to '/login'
    end
  end

    delete '/wishlist/:id/delete' do
    if logged_in?
      @wishlist = Wishlist.find_by_id(params[:id])
      if @wishlist && @wishlist.user == current_user
        @wishlist.delete
      end
      redirect to '/wishlist'
    else
      redirect to '/login'
    end
  end

end