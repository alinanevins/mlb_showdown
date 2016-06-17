class BattersController < ApplicationController
  def index
    @t1_batters = T1Batter.all
  end
end
