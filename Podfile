# Uncomment the next line to define a global platform for your project
platform :ios, '12.1'

target 'TestSalinas' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TestSalinas
  pod 'SwiftLint'	
  pod 'ConnectionLayer'
  pod 'NUTComponents'
  pod 'NutUtils'
  pod 'Charts'
  pod 'lottie-ios'
  pod 'SwiftMessages'
  pod 'Firebase'
  pod 'Firebase/Database'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.1'
      end
    end
  end
end
