# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Creating 10 levels
(1..10) do |i|
  FactoryGirl.create :level, :name => "Fase #{i}"
end

level_1 = Level.first

player_1 = FactoryGirl.create :player, :name => "Rafa", :email => "rafaeliga@gmail.com"
player_1.save_a_game level_1.id

