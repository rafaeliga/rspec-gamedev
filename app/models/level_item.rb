# A itemnable can be:
# - blank: a item 'flying' on the level
# - character: a item that farmer gets
# - recipient: a item that the character puts on

class LevelItem < ActiveRecord::Base
  belongs_to :itemnable, :polymorphic => true
  belongs_to :level
  belongs_to :item

  validates :level, :item, :presence => true
end
