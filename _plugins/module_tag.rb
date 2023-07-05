module Jekyll
  class ModuleTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @module_path = text.strip
    end

    def render(context)
      site = context.registers[:site]
      module_file = site.collections['documentation'].docs.find { |doc| doc.relative_path == @module_path }

      if module_file
        module_file.content
      else
        "Module not found: #{@module_path}"
      end
    end
  end
end

Liquid::Template.register_tag('module', Jekyll::ModuleTag)
