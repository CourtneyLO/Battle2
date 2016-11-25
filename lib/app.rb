require 'sinatra/base'
require_relative 'player'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/hit' do
    @game = $game
    @game.attack
    if @game.lost?
      redirect '/lost'
    else
      @game.switch_turns
    end
    erb :hit
  end

  get '/lost' do
    @game = $game
    erb :lost
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
