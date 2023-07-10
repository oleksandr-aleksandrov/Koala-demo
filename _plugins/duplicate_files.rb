# Jekyll::Hooks.register :site, :post_write do |site|
#   root_directory = Dir.pwd
#   source_directory = '_documentation'
#   destination_directory_mobile = '_mobile'
#   destination_directory_tablet = '_tablet'
#
#    files_to_duplicate = Dir.glob("#{source_directory}/**/*", base: root_directory)
#
#   files_to_duplicate.each do |file|
#     relative_path = file.sub(/^#{source_directory}\//, '')
#     mobile_path = File.join(Dir.pwd, destination_directory_mobile, relative_path)
#     tablet_path = File.join(Dir.pwd, destination_directory_tablet, relative_path)
#
#     FileUtils.mkdir_p(File.dirname(mobile_path))
#     FileUtils.mkdir_p(File.dirname(tablet_path))
#     FileUtils.cp_r(file, mobile_path)
#     FileUtils.cp_r(file, tablet_path)
#
#     # Add the duplicated files to the exclude list
#     site.config['exclude'] << mobile_path
#     site.config['exclude'] << tablet_path
#   end
# end

Jekyll::Hooks.register :site, :post_write do |site|
  root_directory = Dir.pwd
  source_directory = '_documentation'
  destination_directory_mobile = '_mobile'
  destination_directory_tablet = '_tablet'

  files_to_duplicate = Dir.glob("#{source_directory}/**/*.*", base: root_directory)

  files_to_duplicate.each do |file|
    relative_path = file.sub(/^#{source_directory}\//, '')
    mobile_path = File.join(root_directory, destination_directory_mobile, relative_path)
    tablet_path = File.join(root_directory, destination_directory_tablet, relative_path)

    if File.file?(file)
      FileUtils.mkdir_p(File.dirname(mobile_path))
      FileUtils.mkdir_p(File.dirname(tablet_path))
      FileUtils.cp(file, mobile_path)
      FileUtils.cp(file, tablet_path)
    else
      FileUtils.mkdir_p(mobile_path)
      FileUtils.mkdir_p(tablet_path)
    end

    # Add the duplicated files to the exclude list
    site.config['exclude'] << mobile_path
    site.config['exclude'] << tablet_path
  end
end
