class Player < ActiveRecord::Base
  belongs_to :game_save
  belongs_to :current_level, :class_name => "Level"

  validates :name, :email, :presence => true

  def save_a_game level_id
    update_attribute(:game_save_id, GameSave.create!(:level_id => level_id, :player_id => self.id).id)
  end

  def start_a_game level_id
    update_attribute(:current_level_id, GameSave.create!(:level_id => level_id, :player_id => self.id).id)
  end

  def level_completed?
    current_level.farmer.items_on_recipient(current_level.recipient).count == current_level.number_of_items_to_collect
  end

end
