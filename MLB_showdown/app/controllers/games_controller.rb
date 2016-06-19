class GamesController < ApplicationController
  def index
    @game = Game.all
  end

  def create
    game_hash = params.delete('game')
    a = Game.new
    a.name = game_hash['name']
    a.home_team_user_id = game_hash['home_team_user_id']
    a.visitor_team_user_id = game_hash['visitor_team_user_id']

    if a.save
      # redirect_to turns/new
    end

  end

  def new
    @game = Game.new

  end

  def edit
    id = params[:id]
    @game = Game.find(id)
  end

  def show
    id = params[:id]
    @game = Game.find(id)
  end

  def update
    id = params['id']
    game_hash = params.delete('game')
    @game = Game.find(id)
    @game.name = game_hash['name']
    @game.home_team_user_id = game_hash['home_team_user_id']
    @game.visitor_team_user_id = game_hash['visitor_team_user_id']

    if @game.save
      redirect_to game_path(@game.id)
    end
  end

  def destroy
    id = params['id']
    Game.delete(id)
    flash[:notice] = "You've deleted game #{id}"
    redirect_to game_path
  end
end
