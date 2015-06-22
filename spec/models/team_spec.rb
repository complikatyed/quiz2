require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it "should allow valid values for name" do
      should allow_value("HFA-A", "HFA2", "team 1", "JV").for(:name)
    end
    it "should have a working factory" do
      Fabricate.build(:team).should be_valid
    end
  end
end