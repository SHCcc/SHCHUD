
Pod::Spec.new do |s|

s.name         = 'SHCHUD'
s.version      = '1.0.8'
s.summary      = 'A short description of SHCHUD. 这是一个简单的HUD '
s.description  = 'iOS swift HUD '
s.homepage     = 'https://github.com/SHCcc/SHCHUD'
s.license      = 'MIT'
s.ios.deployment_target = '8.0'
s.author             = { "SHCcc" => "578013836@qq.com" }
s.source       = { :git => "https://github.com/SHCcc/SHCHUD.git", :tag => s.version.to_s }
s.source_files  = ["SHCHUD/*/**", "SHCHUD/**"]
s.requires_arc = true
end
