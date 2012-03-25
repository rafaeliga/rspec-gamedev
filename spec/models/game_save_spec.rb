require 'spec_helper'

describe GameSave do
  
  context "Basic" do
    it { should belong_to :player }
    it { should belong_to :level }
    it { should validate_presence_of :player }
    it { should validate_presence_of :level }
  end

end
