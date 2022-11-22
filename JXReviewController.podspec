#
# Be sure to run `pod lib lint JXReviewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JXReviewController'
  s.version          = '0.1.4'
  s.summary          = 'Request rating by 1-5 stars.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Request rating by 1-5 stars. iOS 13+ is required.
                       DESC

  s.homepage         = 'https://bailushuyuan.org'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jianqiu Xiao' => 'swordray@gmail.com' }
  s.source           = { :git => 'https://github.com/swordray/JXReviewController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'JXReviewController/Classes/**/*'

  s.resource_bundles = {
    'JXReviewController' => ['JXReviewController/*.lproj/*.strings']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SnapKit'
  s.dependency 'UIButtonSetBackgroundColorForState'

  s.swift_versions = '5.2'
end
