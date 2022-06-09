# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'jaksim_ios' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for jaksim_ios
    pod 'Alamofire'
    pod 'naveridlogin-sdk-ios'
    pod 'KakaoSDK'
    pod 'Kingfisher', '~> 7.0'
    pod 'SwiftKeychainWrapper'
    pod 'Firebase/Analytics'
    pod 'Firebase/Messaging'
    pod 'Firebase/Storage'
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'DropDown'
    pod 'FSCalendar'
end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
end
end
end
