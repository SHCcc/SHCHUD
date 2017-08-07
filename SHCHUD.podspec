
Pod::Spec.new do |s|

  s.name         = "SHCHUD"
  s.version      = "1.0.0"
  s.summary      = "A short description of SHCHUD."

  s.description  = "test"

  s.homepage     = "https://github.com/SHCcc/SHCHUD"
  s.license      = "MIT"
  s.ios.deployment_target = '8.0'

  s.author             = { "SHCcc" => "578013836@qq.com" }
  s.source       = { :git => "https://github.com/SHCcc/SHCHUD.git", :tag => s.version }


  s.source_files  = "SHCHUD/*.swift"
  #s.exclude_files = "Classes/Exclude"

end
