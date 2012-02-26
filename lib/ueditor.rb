# encoding: utf-8
require 'pathname'
require 'ueditor/config'
module Ueditor
  
  autoload :Utils, 'ueditor/utils'
  
  
  module Helpers
    autoload :FormTagHelper, 'ueditor/helpers/form_tag_helper'
    autoload :FormHelper, 'ueditor/helpers/form_helper'
    autoload :FormBuilder, 'ueditor/helpers/form_builder'
    autoload :AssetTagHelper, 'ueditor/helpers/asset_tag_helper'
  end
  
  
  def self.root_path
    @root_path ||= Pathname.new( File.dirname(File.expand_path('../', __FILE__)) )
  end

  def self.assets
    Dir[root_path.join('app/assets/javascripts/ueditor/**', '*.{js,css}')].inject([]) do |list, path|
      list << Pathname.new(path).relative_path_from(root_path.join('app/assets/javascripts'))
      list
    end << "ueditor.js"
  end
  
end

require 'ueditor/engine'
require 'ueditor/version'