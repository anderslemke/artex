module ArTeX
  module Framework #:nodoc:
    module Rails #:nodoc:

      def self.setup
        ArTeX::Document.options[:tempdir] = File.expand_path(File.join(::Rails.root, 'tmp'))
        ActionView::Template.register_template_handler(:rtex, TemplateHandler)
        ActionView::Base.send :include, HelperMethods
      end

      module HelperMethods
        # Similar to h()
        def latex_escape(*args)
          raw ArTeX::Document.escape(*args)
        end

        alias lesc latex_escape
      end

      # action-specific options can be passed from the view by setting
      # @latex_options, for example:
      #
      #    @latex_options = { preprocess: true }
      #
      # WARNING: MUST use a layout, else only pure latex will be returned by response
      class TemplateHandler < ::ActionView::Template::Handlers::ERB
        def self.call(template)
          new.compile(template)
        end

        def compile(template)
          erb = "<% __in_erb_template=true %>#{template.source}"
          return <<-EORUBY
            source = #{self.class.erb_implementation.new(erb, :trim => (self.class.erb_trim_mode == '-')).src}
            if content_for?(:layout) # (inner) already rendered
              ::ArTeX::Document.new(content_for(:layout), (@latex_options || {}).merge(layout: source)).to_pdf(binding)
            else
              # in the view, just parse erb and wait for layout
              source
            end
          EORUBY
        end
      end

    end
  end
end
