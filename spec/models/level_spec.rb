require 'spec_helper'

describe Level do
  
  context "Basic" do
    it { should have_many :items }
    it { should have_many :enemies }
    it { should belong_to :farmer }
    it { should validate_presence_of :farmer }
  end

  context "Actions" do

    before :each do
      @level = FactoryGirl.create :level
    end

  end

end
