class Farmer < Character

  has_many :level_items, :as => :itemnable

  # init jump, assign key to space, maybe
  def init_jump
    true
  end

  def hit enemy
    enemy.update_attribute(:life, enemy.life - 1)
  end

  def get_a_item item, level
    level_items.create! :item => item, :level => level
  end

  def immobilize enemy
    enemy.update_attribute(:life, 0)
  end

  # item_type can be 'Corn', 'Life', 'Timer' and etc
  def items_per level, item_type
    level_items.joins(:item).where(:level_id => level.id, :items => {:type => item_type})
  end

  def save_a_item_on_recipient level_item, recipient
    recipient.save_a_item level_item
  end

  def items_on_recipient recipient
    recipient.level_items
  end

end