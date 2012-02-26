# encoding: utf-8
module Ueditor
  module Utils
    class << self
      def escape_single_quotes(str)
        str.gsub('\\','\0\0').gsub('</','<\/').gsub(/\r\n|\n|\r/, "\\n").gsub(/["']/) { |m| "\\#{m}" }
      end
      
      def parameterize_filename(filename)
        extension = File.extname(filename)
        basename = filename.gsub(/#{extension}$/, "")
        
        [basename.parameterize('_'), extension].join.downcase
      end
      
      def js_replace(dom_id, options = {})
        js_options = applay_options(options)
        editor_id = "#{Ueditor.config.dom_prefix}#{dom_id}"
        js = ""
        if js_options.blank?
          js << "var #{editor_id} = new baidu.editor.ui.Editor();"
        else
          js << "var #{editor_id}= new baidu.editor.ui.Editor({ #{js_options} });"
        end
        js << "#{editor_id}.render('#{dom_id}');"
      end
      
      def applay_options(options)
        str = []
        
        options.each do |key, value|
          item = case value
            when String then
              value.split(//).first == '^' ? value.slice(1..-1) : "'#{value}'"
            when Hash then 
              "{ #{applay_options(value)} }"
            when Array then 
              arr = value.collect { |v| "'#{v}'" }
              "[ #{arr.join(',')} ]"
            else value
          end
          
          str << %Q{"#{key}": #{item}}
        end
        
        str.sort.join(',')
      end
      
    end
  end
end
