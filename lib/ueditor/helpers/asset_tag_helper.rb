module Ueditor
  module Helpers
    module AssetTagHelper
      def ueditor_inlcude_tag(*sources)
        output_buffer = ActiveSupport::SafeBuffer.new
        output_buffer << stylesheet_link_tag("ueditor/themes/default/ueditor")
        output_buffer << javascript_include_tag("ueditor")
        output_buffer
      end
    end
  end
end