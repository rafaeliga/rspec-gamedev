require 'spec_helper'

describe Level do
  
  context "Basic" do
    it { should have_many :level_items }
    it { should have_many :enemies }
    it { should belong_to :farmer }
    it { should validate_presence_of :farmer }

    it "should have default levels" do
      default_levels = Level::DEFAULT_LEVELS
      default_levels.count.should == 5
    end
  end

  context "Actions" do

    before :each do
      @level = FactoryGirl.create :level
    end

  end

end
