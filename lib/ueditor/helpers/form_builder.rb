module Ueditor
  module Helpers
    module FormBuilder
      extend ActiveSupport::Concern
      
      def ueditor_area(method, options = {})
        @template.send("ueditor_area", @object_name, method, objectify_options(options))
      end
    end
  end
end
