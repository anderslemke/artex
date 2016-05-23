#TODO Translate comments.
module ArTeX
  class PDF
    # Wir bilden das Verhalten von render :partial nach.
    # So wird die Abhängigkeit zu ActionView aufgelöst.
    # Dabei gehen sicherlich Möglichkeiten verloren, die hier aber auch nicht benötigt werden.
    # Ziel ist die Verlagerung der PDF-Generierung aus dem Controller in Klassen bzw. Models,
    # so dass dies auch im Hintergrund erfolgen kann.
    #
    # === Beispiele
    #   render :partial => "layouts/brandings/#{@bill.branding.template_name}"
    #   render :partial => 'bills/form/billing_position/_billing_position.pdf.rtex', :collection => @bill.billing_positions
    def render(options = {})
      content = ''

      # Relativer Pfad zum Template
      # z.B. 'bills/form/billing_position/_billing_position.pdf.rtex'
      template_name = get_template_name_from_partial_name(options[:partial])

      handle_locals(options)

      content = if is_collection?(options) then
        render_collection(options[:collection], binding, template_name)
                else
        render_to_latex(binding, template_name)
                end
      content
    end

    def is_collection?(options)
      options[:collection] && options[:collection].is_a?(Array)
    end

    def render_collection(collection, binding, template_name)
      content = ''

      #TODO refactor
      collection.each do |billing_position|
          @billing_position = billing_position
          latex = render_to_latex(binding, template_name)
          content += latex
      end
      content
    end

    # 'bills/form/billing_position/_billing_position.pdf.rtex' -> 'bills/form/billing_position/_billing_position.pdf.rtex'
    def get_template_name_from_partial_name(partial_name)
      parts = partial_name.split(/\//)

      # "_" vor das letzte Element setzen.
      parts[-1] = '_' + parts.last
      template_name = parts.join('/')
      template_name
    end

    # creates the posibility of locals renderign
    def handle_locals(options = {})
      return unless options[:locals]
      options[:locals].each do |name, value|
        l = lambda { return value }
        self.class.send(:define_method, name.to_sym, l)

      end
    end

    def render_to_latex(binding, path)
      template_path = get_template_path(path)
      template = File.read(template_path)

      latex_code = ERB.new(template).result(binding)
      latex_code
    end

    # Nimmt Latex und schreibt ein PDF. Gibt den Pfad zum PDF zurück.
      def latex_to_pdf(latex_content)
        pdf_file = ''
        ::ArTeX::Document.new(latex_content, :process => true).to_pdf do |filename|
          pdf_file = Tempfile.new('artex-pdf')
          FileUtils.mv filename, pdf_file.path
        end
        pdf_file.path
      end

    def get_template_path(path)
      raise 'unimplemented'
    end

    def l(*args)
      ArTeX::Document.escape(*args)
    end
  end
end
