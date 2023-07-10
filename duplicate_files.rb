Jekyll::Hooks.register :site, :pre_render do |site|
  files_to_duplicate = Dir.glob('_documentation/*.md')

  files_to_duplicate.each do |file|
    base_filename = File.basename(file)
    mobile_path = File.join(Dir.pwd, '_mobile', base_filename)
    tablet_path = File.join(Dir.pwd, '_tablet', base_filename)

    FileUtils.copy(file, mobile_path)
    FileUtils.copy(file, tablet_path)

    # Add the duplicated files to the exclude list
    site.config['exclude'] << mobile_path
    site.config['exclude'] << tablet_path
  end
end
