class GamesController < ApplicationController

  
  get '/library' do
    if logged_in?
      @games = current_user.games
      erb :'/library'
    else
      redirect to '/login'
    end
  end

  get '/games/new' do
    if logged_in?
      erb :'games/addgame'
    else
      redirect to '/login'
    end
  end

  post '/games' do
    if logged_in?
        @game = current_user.games.build(params)
        @game.save
        redirect to "/games/#{@game.id}"
    else
      redirect to '/login'
    end
  end

  get '/games/:id' do
    if logged_in?
      get_game
      if @game && @game.user == current_user
        erb :'games/showgame'
      else
        redirect to '/library'
      end
    else
      redirect to '/login'
    end
  end

  get '/games/:id/edit' do
    if logged_in?
      get_game
      if @game && @game.user == current_user
        erb :'games/editgame'
      else
        redirect to '/library'
      end
    else
      redirect to '/login'
    end
  end

  patch '/games/:id' do
    if logged_in?
        get_game
        if @game && @game.user == current_user
          if @game.update(params)
            redirect to "/games/#{@game.id}"
          else
            redirect to "/games/#{@game.id}/edit"
          end
        else
          redirect to '/library'
        end
    end
      redirect to '/login'
  end

  delete '/games/:id' do
    if logged_in?
      get_game
      if @game && @game.user == current_user
        @game.delete
      end
      redirect to '/library'
    else
      redirect to '/login'
    end
  end

  private 

    def get_game
       @game = Game.find_by_id(params[:id])
     end
 end

