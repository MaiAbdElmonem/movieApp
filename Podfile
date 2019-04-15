source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'


target "movieApp" do

pod 'SDWebImage', '~> 5.0'
pod 'AFNetworking', '~> 3.0'
pod 'HCSStarRatingView', '~> 1.5'
pod 'Realm'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete('CODE_SIGNING_ALLOWED')
      config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
  end
  installer.pods_project.build_configurations.each do |config|
    config.build_settings.delete('CODE_SIGNING_ALLOWED')
    config.build_settings.delete('CODE_SIGNING_REQUIRED')
  end
end
end
