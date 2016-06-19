class Turn < ActiveRecord::Base
  belongs_to :game
  has_many :base_state
  has_many :name, :through => :base_state
  # pitcher and batter tables here
end
