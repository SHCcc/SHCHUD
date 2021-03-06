
Pod::Spec.new do |s|

s.name         = 'SHCHUD'
s.version      = '1.1.9'
s.summary      = 'swift版的HUD'
s.description  = '一个swift4的提示语HUD，包含的顶部底部和中部的三种样式。'
s.homepage     = 'https://github.com/SHCcc/SHCHUD'
s.license      = 'MIT'
s.ios.deployment_target = '8.0'
s.author             = { "SHCcc" => "578013836@qq.com" }
s.source       = { :git => "https://github.com/SHCcc/SHCHUD.git", :tag => s.version.to_s }

s.requires_arc = true
s.source_files  = "SHCHUD/*/**", "SHCHUD/**"
s.resource_bundles = {'Photo' => 'SHCHUD/Photo.bundle/*.png'}

s.swift_version = '4.0'
end
