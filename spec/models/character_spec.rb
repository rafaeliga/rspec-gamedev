require 'spec_helper'

describe Character do
  
  context "Basic" do
  end

  context "General Actions" do

    before :each do
      @character = FactoryGirl.create :character
    end

    it "should init controls" do
      @character.init_controls.should be_true
    end

  end

end
