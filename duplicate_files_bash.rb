require 'fileutils'

files_to_duplicate = Dir.glob('_documentation/*.md')

files_to_duplicate.each do |file|
  base_filename = File.basename(file)
  mobile_path = "_mobile/#{base_filename}"
  tablet_path = "_tablet/#{base_filename}"

  FileUtils.copy(file, mobile_path)
  FileUtils.copy(file, tablet_path)
end
