require 'spec_helper'

describe Recipient do
  
  it { should have_many :level_items }
  it { should belong_to :farmer }

  context "Items" do

    before :each do
      @level = FactoryGirl.create :level
      @corn  = FactoryGirl.create :corn
      @recipient = FactoryGirl.create :recipient
      @level_item = FactoryGirl.create :level_item, :level => @level, :item => @corn
    end

    it "can have a item" do
      @recipient.save_a_item @level_item
      @level_item = LevelItem.find_by_itemnable_id_and_itemnable_type_and_level_id_and_item_id @recipient.id, "Recipient", @level.id, @corn.id
      @recipient.reload.level_items.should == [@level_item]
    end
  end

end
