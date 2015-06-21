RSpec.describe Player, type: :model do
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_least(2) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_least(2) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:cell) }
    it { should validate_numericality_of(:points)}
    it { should validate_numericality_of(:negs) }
    it "should allow valid values for email" do
      should allow_value("kmr@katyerussell.com", "a@b.co.uk", "jimbob+hash@example.com").for(:email)
    end
    describe "should be invalid if email is not formatted correctly" do
      it { should_not allow_value("katyerussell.com").for(:email) }
      it { should_not allow_value("jimbob@examplecom").for(:email) }
      it { should_not allow_value("@.com").for(:email) }
    end
    describe "should be invalid if cell is not formatted correctly" do
      it { should_not allow_value("343-9833").for(:cell) }
    end
    it "should have a working factory" do
      Fabricate.build(:player).should be_valid
    end
  end
end