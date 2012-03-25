require 'spec_helper'

describe Farmer do
  
  it { should have_many :level_items }

  context "Actions" do

    before :each do
      @farmer = FactoryGirl.create :farmer
      @enemy  = FactoryGirl.create :enemy, :life => 1
      @level  = FactoryGirl.create :level
      @item   = FactoryGirl.create :item
      @recipient = FactoryGirl.create :recipient
    end

    it "should init jump" do
      @farmer.init_jump.should be_true
    end

    it "should hit a enemy" do
      @farmer.hit @enemy
      @enemy.reload.life.should == 0
    end

    it "should get a item" do
      @farmer.get_a_item @item, @level
      @level_item = LevelItem.find_by_itemnable_id_and_itemnable_type_and_level_id_and_item_id @farmer.id, "Character", @level.id, @item.id
      @farmer.reload.level_items.should == [@level_item]
    end

    it "should immobilize a enemy" do
      @farmer.immobilize @enemy
      @enemy.reload.immobilized?.should be_true
    end

    it "should save items on a recipient" do
      level_item = @farmer.get_a_item @item, @level
      level_item2 = @farmer.get_a_item FactoryGirl.create(:corn), @level

      @farmer.save_a_item_on_recipient level_item, @recipient
      @farmer.save_a_item_on_recipient level_item2, @recipient

      @farmer.items_on_recipient(@recipient).should == [level_item, level_item2]
    end

  end

  context "Items" do

    before :each do
      @farmer = FactoryGirl.create :farmer
      @level  = FactoryGirl.create :level
      @corn   = FactoryGirl.create :corn
      @corn_2 = FactoryGirl.create :corn
      @life   = FactoryGirl.create :life

      @farmer.get_a_item @corn, @level
      @farmer.get_a_item @corn_2, @level
      @farmer.get_a_item @life, @level
    end

    it "can have corns per level" do
      @farmer.items_per(@level, "Corn").count.should == 2
    end

    it "can get extra lifes per level" do
      @farmer.items_per(@level, "Life").count.should == 1
    end

  end

end
