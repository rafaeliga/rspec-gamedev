require 'spec_helper'

describe LevelItem do
  
  context "Basic" do

    it { should belong_to :itemnable }
    it { should belong_to :level }
    it { should belong_to :item }
    it { should validate_presence_of :level }
    it { should validate_presence_of :item }

  end

end
