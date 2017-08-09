# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'BIT-LoanCalculator' do
 pod 'Alamofire', '~> 4.0.1'
 pod 'SwiftyJSON', '~> 3.1.1'
 pod 'PKHUD', :git => 'https://github.com/toyship/PKHUD.git'
 pod 'RxSwift', '~> 3.0'
 pod 'RxCocoa', '~> 3.0'
 pod 'SnapKit', '~> 3.0.2'
 pod 'Eureka', '~> 2.0.0-beta.1' 
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
