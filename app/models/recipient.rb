class Recipient < ActiveRecord::Base

  belongs_to :level
  belongs_to :farmer
  has_many   :level_items, :as => :itemnable

  def save_a_item level_item
    level_items << level_item
  end

end
