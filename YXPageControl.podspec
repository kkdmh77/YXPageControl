#
#  Be sure to run `pod spec lint YXPageControl.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#


Pod::Spec.new do |s|
  s.name             = "YXPageControl"
  s.version          = "0.1.1"
  s.summary          = "A custom pageControl."
  s.homepage         = "https://github.com/shuleihen/YXPageControl"
  s.license          = 'MIT'
  s.author           = { "zdy" => "shuleihen@126.com" }
  s.source           = { :git => "https://github.com/shuleihen/YXPageControl.git", :tag => s.version.to_s }
  s.ios.deployment_target = '6.0'
  s.source_files = 'YXPageControl/*'
end
