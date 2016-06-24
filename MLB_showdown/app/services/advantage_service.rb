class AdvantageService

  attr_accessor :roll_1, :control, :onbase

  def initialize(roll_1, control, onbase)
    @roll_1 = roll_1
    @control = control
    @onbase = onbase
  end

  def advantage
    if @control.to_i + @roll_1.to_i > @onbase
      @advantage = "pitcher"
    else
      @advantage = "batter"
    end
  end
end
