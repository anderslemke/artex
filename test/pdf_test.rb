require File.dirname(__FILE__) << '/test_helper'


class PdfTest < Test::Unit::TestCase

  context "Creating a temporary directory" do
  
    setup do
      @options = {
        :locals => {
        :number => 234,
        :string => "hello",
        :hash => {:dog => :cat},
        :array => ["marshmallow", "candy"]
      }
      }
    end
 
    should "define locals" do
      pdf = ArTeX::PDF.new
      pdf.handle_locals(@options)

      assert_equal 234,     pdf.number
      assert_equal "hello", pdf.string
      assert_equal 1, pdf.hash.count
      assert_equal 2, pdf.array.count
    end

  end
  
end
