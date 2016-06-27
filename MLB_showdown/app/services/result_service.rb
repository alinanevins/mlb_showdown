class ResultService

  attr_accessor :advantage, :roll_2, :pitcher, :batter

  def initialize(advantage, roll_2, pitcher, batter)
    @advantage = advantage
    @roll_2 = roll_2
    @pitcher = pitcher
    @batter = batter
  end

  def calculate_result
    binding.pry
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
      elsif @roll_2 <= (@pitcher['PU'] + @pitcher['SO'] + @pitcher['GB'] +  @pitcher['FB'] + @pitcher['BB'] + @pitcher['_1B'] + @pitcher['_2B'] + @pitcher['_HR'])
        @result = "_HR"
      end
    elsif advantage == "batter"
      if @roll_2 < (@batter['SO'])
        @result = "SO"
      elsif @roll_2 < (@batter['SO'] + @batter['GB'])
        @result = "GB"
      elsif @roll_2 < (@batter['SO'] + @batter['GB'] +  @batter['FB'])
        @result = "FB"
      elsif @roll_2 < (@batter['SO'] + @batter['GB'] +  @batter['FB'] + @batter['BB'])
        @result = "BB"
      elsif @roll_2 < (@batter['SO'] + @batter['GB'] +  @batter['FB'] + @batter['BB'] + @batter['_1B'])
        @result = "_1B"
      elsif @roll_2 < (@batter['SO'] + @batter['GB'] +  @batter['FB'] + @batter['BB'] + @batter['_1B'] + @batter['_1Bplus'])
        @result = "_1Bplus"
      elsif @roll_2 < (@batter['SO'] + @batter['GB'] +  @batter['FB'] + @batter['BB'] + @batter['_1B'] + @batter['_1Bplus'] + @batter['_2B'])
        @result = "_2B"
      elsif @roll_2 < (@batter['SO'] + @batter['GB'] +  @batter['FB'] + @batter['BB'] + @batter['_1B'] + @batter['_1Bplus'] + @batter['_2B'] + @batter['_3B'])
        @result = "_3B"
      elsif @roll_2 <= (@batter['SO'] + @batter['GB'] +  @batter['FB'] + @batter['BB'] + @batter['_1B'] + @batter['_2B'] + @batter['_3B'] + @batter['_HR'])
        @result = "_HR"
      end
    end
  end
end
