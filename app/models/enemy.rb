class Enemy < Character

  belongs_to :level, :foreign_key => "enemy_level_id"

  def immobilized?
    life == 0 ? true : false
  end
end