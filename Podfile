# Uncomment the next line to define a global platform for your project
platform :ios, '15.1'

target 'SkilTalk' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SkilTalk

  # Core Firebase SDK
  pod 'Firebase/Core'

  # Firebase Services
  pod 'Firebase/Auth'                 # Authentication
  pod 'Firebase/Firestore'              # Firestore Database
  pod 'Firebase/Storage'                # Cloud Storage
  pod 'Firebase/Messaging'              # Cloud Messaging (Push Notifications)
  pod 'Firebase/Analytics'              # Analytics

  # Real-time Communication
  pod 'AgoraRtcEngine_iOS'              # For Voice and Video rooms

  # Add other dependencies below as needed
  # pod 'supabase-swift' # Install via Swift Package Manager (SPM) instead
  pod 'PusherSwift'
  pod 'Ably'
  pod 'RevenueCat'
  pod 'OneSignal'
  pod 'HMSSDK' # For 100ms.live
  pod 'Daily' # For Daily.co

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.1'
    end
  end
end