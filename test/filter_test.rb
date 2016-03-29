require File.dirname(__FILE__) << '/test_helper'

class FilterTest < Minitest::Test

  describe "Filtering Documents" do

    it "filters through Textile" do
      doc = document('text.textile', :filter => 'textile')
      source = doc.source(binding)
      assert source.include?('\item')
    end

    # FIXME temporary skipped: don't know how to fix LocalJumpError: no block given (yield)
    # See: http://hostiledeveloper.com/2015/05/28/working-with-templates-in-ruby-erb.html
#     it "does not affect layouts" do
#       doc = document('text.textile',
#               :filter => 'textile',
#               :layout => "* layout\n* is\n<%= yield %>")
#       source = doc.source(binding)
#       assert source.include?("* layout"), "filtered layout"
#       assert source.include?('\item'), "didn't filter content"
#     end

  end

end
