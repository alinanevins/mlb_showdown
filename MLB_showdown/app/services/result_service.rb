class ResultService

  attr_accessor :advantage, :roll_2, :pitcher

  def initialize(advantage, roll_2, pitcher)
    @advantage = advantage
    @roll_2 = roll_2
    @pitcher = pitcher
  end

  def calculate_result
    if advantage == "pitcher"
      if @roll_2 < @pitcher['PU']
        @result = "PU"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'])
        @result = "SO"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'])
        @result = "GB"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'] +  @pitcher['FB'])
        @result = "FB"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'] +  @pitcher['FB'] + @pitcher['BB'])
        @result = "BB"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'] +  @pitcher['FB'] + @pitcher['BB'] + @pitcher['_1B'])
        @result = "_1B"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'] +  @pitcher['FB'] + @pitcher['BB'] + @pitcher['_1B'] + @pitcher['_2B'])
        @result = "_2B"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'] +  @pitcher['FB'] + @pitcher['BB'] + @pitcher['_1B'] + @pitcher['_2B'] + @pitcher['_HR'])
        @result = "_HR"
      end
    elsif advantage == "batter" # fix this part
      if @roll_2 < @pitcher['PU']
        @result = "PU"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'])
        @result = "SO"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'])
        @result = "GB"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'] +  @pitcher['FB'])
        @result = "FB"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'] +  @pitcher['FB'] + @pitcher['BB'])
        @result = "BB"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'] +  @pitcher['FB'] + @pitcher['BB'] + @pitcher['_1B'])
        @result = "_1B"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'] +  @pitcher['FB'] + @pitcher['BB'] + @pitcher['_1B'] + @pitcher['_2B'])
        @result = "_2B"
      elsif @roll_2 < (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'] +  @pitcher['FB'] + @pitcher['BB'] + @pitcher['_1B'] + @pitcher['_2B'] + @pitcher['_HR'])
        @result = "_HR"
      end
    end
  end
end
