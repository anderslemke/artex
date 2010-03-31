require 'tempfile'

module ArTeX
  module Framework #:nodoc:   
    module Rails #:nodoc:
      
      def self.setup
        ArTeX::Document.options[:tempdir] = File.expand_path(File.join(RAILS_ROOT, 'tmp'))
      end
            
      module HelperMethods
        # Similar to h()
        def latex_escape(*args)
          # Since Rails' I18n implementation aliases l() to localize(), LaTeX
          # escaping should only be done if ArTeX is doing the rendering.
          # Otherwise, control should be be passed to localize().
          if Thread.current[:_rendering_rtex]
            ArTeX::Document.escape(*args)
          else
            localize(*args)
          end
        end
        alias :l :latex_escape
      end
      
    end
  end
end
