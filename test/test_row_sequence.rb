require 'test/unit'
require 'shoulda'
require 'simple_iif/rows'

include SimpleIif

class TestRowSequence < Test::Unit::TestCase

  def setup
    @rs = RowSequence.new
  end

  context "An empty row sequence" do
    should "have no headers or values" do
      assert_equal [], @rs.to_iif
    end
  end

  context "A row sequence containing a vendor" do
    setup do
      @params = {
        name: "Dave Thomas",
        printas: "Mr Smith",
        addr1: "123 Main St",
        addr2: "Anytown",
        vtype: "Author",
        firstname: "David",
        lastname:  "Thomas",
        :'1099' =>  "YES"
      }

      @rs.add(:vend, @params)
      @iif = @rs.to_iif
    end

    should "contain two lines of iff data" do
      assert_equal 2, @iif.size
    end

    should "contain a valid header" do
      hdr = @iif.first
      assert_not_nil hdr
      fields = hdr.split("\t")
      assert_equal "!VEND", fields.shift
      expected = @params.keys.map(&:to_s).map(&:upcase).sort
      assert_equal expected, fields
    end

    should "contain the values" do
      hdrs = @iif.first.split("\t")[1..-1].map(&:downcase).map(&:to_sym)
      data = @iif.last
      fields = data.split("\t")
      assert_equal "VEND", fields.shift
      assert_equal hdrs.size, fields.size
      hdrs.zip(fields).each do |hdr, field|
        assert_equal @params[hdr], field
        @params.delete(hdr)
      end
      assert @params.empty?, "All headers should have been used"
    end
  end

  context "a row sequence containing 2 rows" do
    setup do
      @rs.add(:trns, date: '1/2/3', accnt: 'bank', amount: '12.34')
      @rs.add(:endtrns)
      @iif = @rs.to_iif
    end

    should "contain 4 rows of iif data" do
      assert_equal 4, @iif.size
    end

    should "contain two headers and two data rows" do
      %w{ !TRNS !ENDTRNS TRNS ENDTRNS }.each do |row_type|
        row = @iif.shift
        assert row.start_with?(row_type), "#{row} should start #{row_type}"
      end
    end
  end
end
