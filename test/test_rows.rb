require 'test/unit'
require 'shoulda'
require 'simple_iif/rows'

include SimpleIif

class TestRows < Test::Unit::TestCase

  REQUIRED_VENDOR_ATTRS = {
    name:      "A-00001-9",
    printas:   "Thomas Consulting", 
    addr1:     "123 Main St", 
    addr2:     "Lewisville", 
    vtype:     "Author", 
    firstname: "Dave",
    lastname:  "Thomas",
    :"1099" => "Y"
  }

  context "Creating an unknown row type" do
    should "raise an exception" do
      assert_raises(RuntimeError) do
        Rows.for("WIBBLE")
      end
    end
  end

  context "Creating an empty vendor row" do
    should "raise an exception because some fields are missing" do
      assert_raises(RuntimeError) do
        Rows.for("VEND")
      end
    end
  end

  context "Creating a vendor with all required fields" do
    setup do
      @vendor = Rows.for(:vend, REQUIRED_VENDOR_ATTRS)
    end

    should "succeed" do
      assert true
    end

    should "set all the fields" do
      REQUIRED_VENDOR_ATTRS.each do |k, v|
        assert_equal v, @vendor.data[k.to_s.upcase]
      end
    end

    should "only have the given fields" do
      assert_equal REQUIRED_VENDOR_ATTRS.size, @vendor.data.size
    end

    should "have the correct headers" do
      assert_equal %w{ !VEND 1099 ADDR1 ADDR2 FIRSTNAME LASTNAME NAME PRINTAS VTYPE}, @vendor.headers
    end

    should "have the correct values" do
      assert_equal %w{ VEND Y 123\ Main\ St Lewisville Dave Thomas A-00001-9 Thomas\ Consulting Author}, @vendor.values
    end
  end

  context "creaiting a vendor with required fields but also with an invalid field" do
    should "raise an exception" do
      assert_raises(RuntimeError) do
        Rows.for(:vend, REQUIRED_VENDOR_ATTRS.merge(invalid: 123))
      end
    end
  end

  context "creaiting a vendor with required fields and with a valid field" do
    setup do
      @vendor = Rows.for(:vend, REQUIRED_VENDOR_ATTRS.merge(taxid: 123))
    end

    should "pass the valid field through" do
      assert @vendor.headers.include?("TAXID")
      assert @vendor.values.include?(123)
    end
  end

end
