require 'rails'
require 'ueditor'

module Ueditor
  class Engine < ::Rails::Engine
    isolate_namespace Ueditor

    # config.action_view.javascript_expansions[:ueditor] = "ueditor/ueditor"

    initializer "ueditor.assets_precompile" do |app|
    app.config.assets.precompile += Ueditor.assets
    end

    initializer "ueditor.helpers" do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send(:include, Ueditor::Helpers::FormTagHelper)
        ActionView::Base.send(:include, Ueditor::Helpers::FormHelper)
        ActionView::Helpers::FormBuilder.send(:include, Ueditor::Helpers::FormBuilder)
        ActionView::Base.send(:include, Ueditor::Helpers::AssetTagHelper)
      end
    end

  end
end
