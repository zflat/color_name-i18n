require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module ColorNameI18n

  describe "Color" do
    context "with nil key" do
      let(:color){Color.new(nil)}

      it "verifies as nil" do
        expect(color).to be_nil
      end
    end

    context "with a list" do
      let(:list){['FFFFFF', '000000'].map{|c| Color.new(c)}}
      let(:color){Color.new('FFFFFF')}
      
      context "given a color from the list" do
        let(:color){Color.new('000000')}
        describe "include?" do
          it "is true" do
            expect(list.include?(color)).to be_true
            # Segal
          end
        end # describe "include?"
      end # context "given a color from the list"
    end

    describe "with custom data" do
      before :each do
        @d = {:key=>'123456',
          :name=>'Test',
          :alt=>'n1,n2,n3'}
        @c = Color.new(@d)
      end
      
      it "should have a name" do
        expect(@c.name).to eq(@d[:name])
      end

      it "should not be valid" do
        expect(@c.valid?).to eq(false)
        expect(@c.invalid?).to eq(true)
      end

      it "should have errors after validation" do
        @c.valid?
        expect(@c.errors).to_not eq nil
        expect(@c.errors.count).to be > 0
      end

      it "should have alt with count 3" do
        expect(@c.alt.count).to eq(3)
      end
    end

    describe "a valid instance" do
      before :each do
        @key = '000000'
        @c = Color.new(@key)
      end

      it "should be valid" do
        expect(@c.valid?).to eq true
      end

      describe "name attribute" do

        it "should not be nil" do
          expect(@c.name).not_to eq(nil)
        end

        it "should be a string" do
          expect(@c.name.class).to eq(String)
        end

        it "should match the name from I18n translate" do
          n = I18n.translate("color_keys.#{@key}.name")
          expect(@c.name).to eq(n)
        end

      end


      describe "alt attribute" do
        before :each do
          @a = @c.alt
        end

        it "should not be nil" do
          expect(@a).to_not eq(nil)
        end
        
        it "should be enumberable" do
          expect(@a.each).to_not eq nil
        end
        
      end
      
    end
    
  end # describe Color

end # module ColorNameI18n
