Jekyll::Hooks.register :site, :after_reset do |jekyll|
  FileUtils.cd("_documentation")

  if Dir.exists?(FileUtils.pwd()+"/mobile")
    FileUtils.rm_rf(FileUtils.pwd()+"/mobile")
  end
  if Dir.exists?(FileUtils.pwd()+"/tablet")
    FileUtils.rm_rf(FileUtils.pwd()+"/tablet")
  end

  FileUtils.mkdir("mobile")
  FileUtils.mkdir("tablet")

  FileUtils.cp(
    Dir.glob(
      FileUtils.pwd() + "/*.md",
    ),
    FileUtils.pwd() + "/mobile"
  )
  FileUtils.cp(
    Dir.glob(
      FileUtils.pwd() + "/*.md",
    ),
    FileUtils.pwd() + "/tablet"
  )
  FileUtils.cd("..")
end

Jekyll::Hooks.register :site, :post_write do |jekyll|
  FileUtils.cd("_documentation")

  if Dir.exists?(FileUtils.pwd()+"/mobile")
    FileUtils.rm_rf(FileUtils.pwd()+"/mobile")
  end
  if Dir.exists?(FileUtils.pwd()+"/tablet")
    FileUtils.rm_rf(FileUtils.pwd()+"/tablet")
  end
  FileUtils.cd("..")
#   FileUtils.cd("_site/documentation")
#   FileUtils.rm_rf Dir.glob("**/*").reject { |f| File.file?(f) ||  f.include?(File.basename("mobile")) || f.include?(File.basename("tablet")) }
#   FileUtils.cd("../..")
end
