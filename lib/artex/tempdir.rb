require 'fileutils'

module ArTeX

  class Tempdir #:nodoc:

    def self.open(parent_path = ArTeX::Document.options[:tempdir])
      tempdir = new(parent_path)
      FileUtils.mkdir_p tempdir.path
     # result = Dir.chdir(tempdir.path) do
        yield tempdir
     # end
      # We don't remove the temporary directory when exceptions occur,
      # so that the source of the exception can be dubbed (logfile kept)
      
     # result
    ensure
      tempdir.remove!
    end

    def initialize(parent_path, basename = 'artex')
      @parent_path = parent_path
      @basename = basename
      @removed = false
    end

    def path
      @path ||= File.expand_path(File.join(@parent_path, 'artex', "#{@basename}-#{uuid}"))
    end

    def remove!
      return false if @removed
      FileUtils.rm_rf path
      @removed = true
    end

    #######

    private

    #######

    # Try using uuidgen, but if that doesn't work drop down to
    # a poor-man's UUID; timestamp, thread & object hashes
    # Note: I don't want to add any dependencies (so no UUID library)
    def uuid
      SecureRandom.uuid
    end

  end

end
