# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "artex"
  s.version = "2.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Morris", "Eric Faerber, Bruce Williams, Wiebe Cazemier, Julian Fischer, Matthias Folz, Robert Gogolok"]
  s.date = "2013-12-30"
  s.description = "LaTeX preprocessor for PDF generation; Rails plugin"
  s.email = "artex@avarteq.de"
  s.extra_rdoc_files = ["CHANGELOG", "LICENSE", "README.rdoc", "lib/artex.rb", "lib/artex/document.rb", "lib/artex/escaping.rb", "lib/artex/framework/merb.rb", "lib/artex/framework/rails.rb", "lib/artex/pdf.rb", "lib/artex/tempdir.rb", "lib/artex/version.rb"]
  s.files = ["CHANGELOG", "Gemfile", "LICENSE", "Manifest", "README.rdoc", "Rakefile", "artex.gemspec", "init.rb", "lib/artex.rb", "lib/artex/document.rb", "lib/artex/escaping.rb", "lib/artex/framework/merb.rb", "lib/artex/framework/rails.rb", "lib/artex/pdf.rb", "lib/artex/tempdir.rb", "lib/artex/version.rb", "rails/init.rb", "test/document_test.rb", "test/filter_test.rb", "test/fixtures/first.tex", "test/fixtures/first.tex.erb", "test/fixtures/fragment.tex.erb", "test/fixtures/text.textile", "test/pdf_test.rb", "test/tempdir_test.rb", "test/test_helper.rb", "vendor/instiki/LICENSE", "vendor/instiki/redcloth_for_tex.rb"]
  s.homepage = "http://github.com/wgeric/artex"
  s.rdoc_options = ["--line-numbers", "--title", "Artex", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "artex"
  s.rubygems_version = "2.0.14"
  s.summary = "LaTeX preprocessor for PDF generation; Rails plugin"
  s.test_files = ["test/tempdir_test.rb", "test/test_helper.rb", "test/filter_test.rb", "test/document_test.rb", "test/pdf_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0"])
      s.add_development_dependency(%q<flexmock>, [">= 0"])
      s.add_development_dependency(%q<rails>, ["~> 3.2.14"])
      s.add_development_dependency(%q<shoulda>, ["~> 2.11.3"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
      s.add_dependency(%q<flexmock>, [">= 0"])
      s.add_dependency(%q<rails>, ["~> 3.2.14"])
      s.add_dependency(%q<shoulda>, ["~> 2.11.3"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
    s.add_dependency(%q<flexmock>, [">= 0"])
    s.add_dependency(%q<rails>, ["~> 3.2.14"])
    s.add_dependency(%q<shoulda>, ["~> 2.11.3"])
  end
end
