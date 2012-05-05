class Level < ActiveRecord::Base

  DEFAULT_LEVELS = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"]

  belongs_to :farmer
  belongs_to :recipient
  belongs_to :level
  has_many :enemies, :foreign_key => "enemy_level_id"
  has_many :level_items

  validates :farmer, :presence => true

end
