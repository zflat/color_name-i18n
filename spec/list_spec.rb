require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module ColorNameI18n
  describe "::keys" do
    before :each do
      @l = ColorNameI18n::keys
    end
    
    it "should be enumerable" do
      expect(@l.each).to_not eq nil
      expect(@l.count).to be > 0
    end
    
    it "should have type string for each member" do
    @l.each do |c|
        expect(c.class).to eq String
      end
    end
    
    it "should have key 000000" do
      expect(@l.include?('000000')).to eq true
    end
    
  end # describe "::key"
  
end # module ColrNameI18n
