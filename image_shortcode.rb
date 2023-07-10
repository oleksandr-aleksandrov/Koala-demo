module Jekyll
  class ImageTag < Liquid::Tag
  def initialize(tag_name, markup, tokens)
       super
       @markup = markup
     end

        def render(context)
#           baseurl = context['site']['baseurl']
 baseurl = context.registers[:site].config['baseurl']
          image_folder = "#{baseurl}/assets/images"

         filename, alt_text, css_classes = parse_markup(context)

          if context['page']['url'].include?('mobile')
              generate_mobile_images(image_folder, filename, alt_text, css_classes)
          else
            generate_default_image(image_folder, filename, alt_text, css_classes)
          end
        end

#     def render(context)
#       baseurl = context.registers[:site].config['baseurl']
#       image_folder = "#{baseurl}/assets/images"
#
#       if context["page"]["url"].include?("mobile")
#         generate_mobile_images(image_folder, context)
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

    def mobile_image?(filename)
      # Check if the filename includes the word 'mobile'
      filename.include?('mobile')
    end

 def generate_mobile_images(folder, filename, alt_text, css_class)
      "<img width='200' src=\"#{folder}#{@filename}\" alt=\"\" />"
    end

    def generate_default_image(folder, filename, alt_text, css_class)
    "<img width='200' src=\"#{folder}#{@filename}\" alt=\"\" />"
    end
  end
end

Liquid::Template.register_tag('image', Jekyll::ImageTag)
