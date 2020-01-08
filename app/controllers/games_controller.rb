class GamesController < ApplicationController
  
  get '/library' do
    if logged_in?
      @games = Games.all
      erb :'games/library'
    else
      redirect to '/login'
    end
  end

  get '/games/addgame' do
    if logged_in?
      erb :'games/addgame'
    else
      redirect to '/login'
    end
  end

  post '/games' do
    if logged_in?
        game = current_user.games.build(gamename: params[:gamename], console_format: params[:console_format],
         developer:  params[:developer], publisher: params[:publisher], authentic: params[:authentic],
          releasedate: params[:releasedate], condition: params[:condition])
        game.save
        redirect to "/games/#{game.id}"
    else
      redirect to '/login'
    end
  end

  get '/games/:id' do
    if logged_in?
      game = Games.find_by_id(params[:id])
      erb :'/games/showgame'
    else
      redirect to '/login'
    end
  end

#   get '/tweets/:id/edit' do
#     if logged_in?
#       @tweet = Tweet.find_by_id(params[:id])
#       if @tweet && @tweet.user == current_user
#         erb :'tweets/edit_tweet'
#       else
#         redirect to '/tweets'
#       end
#     else
#       redirect to '/login'
#     end
#   end

#   patch '/tweets/:id' do
#     if logged_in?
#       if params[:content] == ""
#         redirect to "/tweets/#{params[:id]}/edit"
#       else
#         @tweet = Tweet.find_by_id(params[:id])
#         if @tweet && @tweet.user == current_user
#           if @tweet.update(content: params[:content])
#             redirect to "/tweets/#{@tweet.id}"
#           else
#             redirect to "/tweets/#{@tweet.id}/edit"
#           end
#         else
#           redirect to '/tweets'
#         end
#       end
#     else
#       redirect to '/login'
#     end
#   end

#   delete '/tweets/:id/delete' do
#     if logged_in?
#       @tweet = Tweet.find_by_id(params[:id])
#       if @tweet && @tweet.user == current_user
#         @tweet.delete
#       end
#       redirect to '/tweets'
#     else
#       redirect to '/login'
#     end
#   end
 end