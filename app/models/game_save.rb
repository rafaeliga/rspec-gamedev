class GameSave < ActiveRecord::Base
  belongs_to :player
  belongs_to :level

  validates :player, :level, :presence => true
end
