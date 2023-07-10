module Jekyll
  class ImageTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @markup = markup
    end

        def render(context)
          baseurl = context['site']['baseurl']
          image_folder = "#{baseurl}/assets/images"

            filename, alt_text, css_classes = parse_markup(context)

          if context['page']['url'].include?('tablet')
            generate_tablet_images(image_folder, filename, alt_text, css_classes)
          else
            generate_default_image(image_folder, filename, alt_text, css_classes)
          end
        end

#     def render(context)
#       baseurl = context.registers[:site].config['baseurl']
#       image_folder = "#{baseurl}/assets/images"
#
#       if context["page"]["url"].include?("tablet")
#         generate_tablet_images(image_folder, context)
#       else
#         generate_default_image(image_folder)
#       end
#     end

   def parse_markup(context)
      # Extract the filename, alt text, and class attributes from the markup
      params = @markup.split(' ')

      filename = params[0]
      alt_text = params[1] || ""
      css_classes = params[2..] || []

      [filename, alt_text, css_classes]
    end



    def generate_tablet_images(folder, filename, alt_text, css_classes)
    tablet_filename = filename.sub(/(\.\w+)$/, '_tablet\1')
    image_tag = "<a href=\"#{folder}#{tablet_filename}\" data-fancybox=\"gallery\" class=\"fancybox\">"
    image_tag += "<img src=\"#{folder}#{tablet_filename}\" alt=\"#{alt_text}\" class=\"#{css_classes.join(' ')}\" />"
    image_tag += "</a>"

    image_tag
    end

    def generate_default_image(folder, filename, alt_text, css_classes)
    image_tag = "<a href=\"#{folder}#{filename}\" data-fancybox=\"gallery\" class=\"fancybox\">"
    image_tag += "<img src=\"#{folder}#{filename}\" alt=\"#{alt_text}\" class=\"#{css_classes.join(' ')}\" />"
    image_tag += "</a>"

    image_tag
    end
  end
end

Liquid::Template.register_tag('flexible_image', Jekyll::ImageTag)
