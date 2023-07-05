module Jekyll
  class ImageTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @filename = text.strip
    end

        def render(context)
          baseurl = context['site']['baseurl']
          image_folder = "#{baseurl}/assets/images"

          if context['page']['url'].include?('mobile')
            generate_mobile_images(image_folder, context)
          else
            generate_default_image(image_folder)
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

    def generate_mobile_images(folder, context)
      "<img width='200' src=\"#{folder}#{@filename}-mobile.jpg\" alt=\"\" />"
    end

    def generate_default_image(folder)
    "<img width='200' src=\"#{folder}#{@filename}\" alt=\"\" />"
    end
  end
end

Liquid::Template.register_tag('image', Jekyll::ImageTag)
