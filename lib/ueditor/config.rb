require 'active_support/configurable'

module Ueditor
  # Configures global settings for Ueditor
  #   Ueditor.configure do |config|
  #     config.default_per_page = 10
  #   end
  def self.configure(&block)
    yield @config ||= Ueditor::Configuration.new
  end

  # Global settings for Ueditor
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :dom_prefix # dom 前缀
    config_accessor :home_url  # 为editor添加一个全局路径
    config_accessor :upload_url # 图片文件夹所在的路径，用于显示时修正后台返回的图片url！具体图片保存路径需要在后台设置。！important
    
    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    # define param_name writer (copied from AS::Configurable)
    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  # this is ugly. why can't we pass the default value to config_accessor...?
  configure do |config|
    config.home_url = "/assets/ueditor/"
    config.upload_url = "/server/upload/"
    config.dom_prefix = "ueditor_"
  end
end