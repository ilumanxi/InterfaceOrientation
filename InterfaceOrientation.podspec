#
# Be sure to run `pod lib lint InterfaceOrientation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InterfaceOrientation'
  s.version          = '1.0.1'
  s.summary          = 'Screen rotation'
  
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Items are portrait by default, but sometimes the screen rotation is required.
                       DESC

  s.homepage         = 'https://github.com/ilumanxi/InterfaceOrientation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '风起兮' => 'fanfan.wind@gmail.com' }
  s.source           = { :git => 'https://github.com/ilumanxi/InterfaceOrientation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'InterfaceOrientation/Classes/**/*'
  
end
