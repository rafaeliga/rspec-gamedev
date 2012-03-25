require 'spec_helper'

describe Player do
  
  context "Basic" do
    it { should belong_to :game_save }
    it { should belong_to :current_level }
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  context "Actions" do

    before :each do
      @level  = FactoryGirl.create :level, :number_of_items_to_collect => 3
      @player = FactoryGirl.create :player, :current_level => @level
      @farmer = @level.farmer
      @recipient = @level.recipient
    end

    it "should save a game" do
      @player.save_a_game(:level_id => @level.id)
      @player.reload.game_save.level.should == @level
    end

    it "should start a game" do
      @player.start_a_game(:level_id => @level.id)
      @player.reload.current_level.should == @level
    end

    it "should check if a level is completed" do
      level_item = @farmer.get_a_item FactoryGirl.create(:corn), @level
      level_item2 = @farmer.get_a_item FactoryGirl.create(:corn), @level
      level_item3 = @farmer.get_a_item FactoryGirl.create(:corn), @level

      @farmer.save_a_item_on_recipient level_item, @recipient
      @farmer.save_a_item_on_recipient level_item2, @recipient

      @player.level_completed?.should be_false

      @farmer.save_a_item_on_recipient level_item3, @recipient

      @player.level_completed?.should be_true
    end
    
  end

end
