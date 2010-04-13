# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{artex}
  s.version = "2.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bruce Williams, Wiebe Cazemier, Julian Fischer"]
  s.date = %q{2010-03-31}
  s.default_executable = %q{artex}
  s.description = %q{LaTeX preprocessor for PDF generation; Rails plugin}
  s.email = %q{artex@avarteq.de}
  s.executables = ["artex"]
  s.extra_rdoc_files = ["CHANGELOG", "README.rdoc", "README_RAILS.rdoc", "bin/artex", "lib/artex.rb", "lib/artex/document.rb", "lib/artex/escaping.rb", "lib/artex/framework/merb.rb", "lib/artex/framework/rails.rb", "lib/artex/pdf.rb", "lib/artex/tempdir.rb", "lib/artex/version.rb"]
  s.files = ["CHANGELOG", "Manifest", "README.rdoc", "README_RAILS.rdoc", "Rakefile", "artex.gemspec", "bin/artex", "init.rb", "lib/artex.rb", "lib/artex/document.rb", "lib/artex/escaping.rb", "lib/artex/framework/merb.rb", "lib/artex/framework/rails.rb", "lib/artex/pdf.rb", "lib/artex/tempdir.rb", "lib/artex/version.rb", "rails/init.rb", "test/document_test.rb", "test/filter_test.rb", "test/fixtures/first.tex", "test/fixtures/first.tex.erb", "test/fixtures/fragment.tex.erb", "test/fixtures/text.textile", "test/tempdir_test.rb", "test/test_helper.rb", "vendor/instiki/LICENSE", "vendor/instiki/redcloth_for_tex.rb"]
  s.homepage = %q{http://github.com/avarteq/artex}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Artex", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{artex}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{LaTeX preprocessor for PDF generation; Rails plugin}
  s.test_files = ["test/document_test.rb", "test/filter_test.rb", "test/tempdir_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<Shoulda>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<Shoulda>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<Shoulda>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
