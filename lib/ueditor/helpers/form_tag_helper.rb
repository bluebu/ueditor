# encoding: utf-8
module Ueditor
  module Helpers
    module FormTagHelper
      extend ActiveSupport::Concern
      
      include ActionView::Helpers::JavaScriptHelper
      
      def ueditor_area_tag(name, value = nil, options = {})
        element_id = sanitize_to_id(name)
        input_html = { :id => element_id }.merge( options.delete(:input_html) || {} )
        
        output_buffer = ActiveSupport::SafeBuffer.new
        output_buffer << text_area_tag(name, value, input_html)
        output_buffer << javascript_tag(Utils.js_replace(element_id, options))
        
        output_buffer
      end
      
    end
  end
end