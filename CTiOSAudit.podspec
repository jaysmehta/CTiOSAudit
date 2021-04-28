#
#  Be sure to run `pod spec lint CTiOSAudit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  
  spec.name          = "CTiOSAudit"
  spec.version       = "1.0.5"
  spec.summary       = "A cocoapods libraray written in swift"
  spec.homepage      = "https://github.com/jaysmehta/CTiOSAudit"
  spec.license       = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author        = { "jaymehta" => "jaysmehta91@gmail.com@example.com" }
  spec.source        = { :git => "https://github.com/jaysmehta/CTiOSAudit.git", :tag => "#{spec.version}" }
   
  spec.ios.deployment_target  = '11.0'
  
  spec.source_files  = "CTiOSAudit/*.{swift,mlmodel}"
  spec.swift_version = '5.1'
  
end
