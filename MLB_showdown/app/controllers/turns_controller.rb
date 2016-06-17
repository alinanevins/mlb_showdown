class TurnsController < ApplicationController
  def index
    @turn = Turn.new
     @pitch_decision :pitch_decision
  end

  def create

  end

  def new
  end
end
