require File.dirname(__FILE__) << '/test_helper'

class DocumentTest < Minitest::Test

  describe 'Document Generation' do

    before do
      change_tmpdir_for_testing
    end

    it 'has a to_pdf() method' do
      assert document(:first).respond_to?(:to_pdf)
    end

    describe 'when escaping' do
      before do
        @obj = Object.new
        def @obj.to_s
          '\~'
        end
        @escaped = '\textbackslash{}\textasciitilde{}'
      end
      it 'escapes character' do
        assert_equal @escaped, ArTeX::Document.escape(@obj.to_s)
      end
      it 'converts argument to string before attempting escape' do
        assert_equal @escaped, ArTeX::Document.escape(@obj)
      end
    end

    it 'uses a to_pdf() block to move a file to a relative path' do
      begin
        path = File.expand_path(File.dirname(__FILE__) << '/tmp/this_is_relative_to_pwd.pdf')
        document(:first).to_pdf do |filename|
          FileUtils.move filename, path
          assert File.exist?(path)
        end
      ensure
        FileUtils.rm path rescue nil
      end
    end

    it 'generates PDF and returns it as a string' do
      @author = 'Foo'
      assert_equal '%PDF', document(:first).to_pdf(binding)[0, 4]
    end

    it 'generates TeX source and returns it as a string with debug option' do
      @author = 'Foo'
      refute_equal '%PDF', document(:first, tex: true).to_pdf(binding)[0, 4]
    end

    it 'generates PDF and gives access to file directly' do
      @author = 'Foo'
      data_read = nil
      invocation_result = document(:first).to_pdf(binding) do |filename|
        data_read = File.open(filename, 'rb:UTF-8', &:read)
        return :not_the_file_contents
      end
      assert_equal '%PDF', data_read[0, 4]
      assert_equal :not_the_file_contents, invocation_result
    end

    it 'generates TeX source and gives access to file directly' do
      @author = 'Foo'
      data_read = nil
      invocation_result = document(:first, tex: true).to_pdf(binding) do |filename|
        data_read = File.open(filename, 'rb:UTF-8', &:read)
        return :not_the_file_contents
      end
      refute_equal '%PDF', data_read[0, 4]
      assert_equal :not_the_file_contents, invocation_result
    end

    # FIXME temporary skipped: don't know how to fix LocalJumpError: no block given (yield)
    # See: http://hostiledeveloper.com/2015/05/28/working-with-templates-in-ruby-erb.html
#     it "wraps in a layout using 'yield'" do
#       doc = document(:fragment, :layout => 'testing_layout[<%= yield %>]')
#       @name = 'ERB'
#       source = doc.source(binding)
#       assert source =~ /^testing_layout.*?ERB, Fragmented/
#     end

  end

end
