$:.unshift(File.dirname(__FILE__) << '/artex')

require 'document'
require 'version'
require 'pdf'

module ArTeX
  
  def self.filters #:nodoc:
    @filters ||= {}
  end
  
  def self.basic_layout #:nodoc:
    "\\documentclass[12pt]{article}\n\\begin{document}\n<%= yield %>\n\\end{document}"
  end
  
  # Define a processing filter
  # call-seq:
  #   filter(:name) { |text_to_transform| ... } # => result
  def self.filter(name, &block)
    filters[name.to_s] = block
  end
  
  filter :textile do |source|
    require File.dirname(__FILE__) << '/../vendor/instiki/redcloth_for_tex'
    RedClothForTex.new(source).to_tex
  end
  
end


