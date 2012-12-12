require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "list" do
  before :each do
    @l = ColorNameI18n::keys
  end

  it "should be enumerable" do
    @l.each.should_not be_nil
    @l.count.should > 0
  end

  it "should have type string for each member" do
    @l.each do |c|
      c.class.should == String
    end
  end

  it "should have key 000000" do
    @l.include?('000000').should == true
  end

end
