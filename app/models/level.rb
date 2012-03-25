class Level < ActiveRecord::Base

  belongs_to :farmer
  belongs_to :recipient
  has_many :enemies, :foreign_key => "enemy_level_id"
  has_many :items

  validates :farmer, :presence => true

end
