Pod::Spec.new do |s|
  s.name = "BrainKit"
  s.summary = "Useful extensions and classes."
  s.version = "0.0.10"
  s.swift_version = "5.0"
  s.homepage = "https://userbrain.co"
  s.license = {:type => "MIT", :file => "LICENSE"}
  s.authors = {"Ondrej Hanak" => "oh@ondrejhanak.cz", "Jakub Heglas" => "jakub@userbrain.co"}
  s.source = {:git => "https://bitbucket.org/userbrain/brainkit.git", :tag => s.version.to_s}
  s.ios.deployment_target = "11.0"

  s.subspec "AVFoundation" do |ss|
    ss.ios.deployment_target = "11.0"
    ss.source_files = "Sources/AVFoundation/**/*.swift"
    ss.ios.frameworks = "AVFoundation", "UIKit"
  end

  s.subspec "CoreData" do |ss|
    ss.ios.deployment_target = "11.0"
    ss.watchos.deployment_target = "5.0"
    ss.source_files = "Sources/CoreData/**/*.swift"
    ss.ios.frameworks = "Coredata"
    ss.dependency "BrainKit/SwiftyJSON"
  end

  s.subspec "Foundation" do |ss|
    ss.ios.deployment_target = "11.0"
    ss.watchos.deployment_target = "5.0"
    ss.source_files = "Sources/Foundation/**/*.swift"
    ss.ios.frameworks = "Foundation"
  end

  s.subspec "SafariServices" do |ss|
    ss.ios.deployment_target = "11.0"
    ss.source_files = "Sources/SafariServices/**/*.swift"
    ss.ios.frameworks = "SafariServices"
  end

  s.subspec "SwiftyJSON" do |ss|
    ss.ios.deployment_target = "11.0"
    ss.watchos.deployment_target = "5.0"
    ss.source_files = "Sources/SwiftyJSON/**/*.swift"
    ss.dependency "BrainKit/Foundation"
    ss.dependency "SwiftyJSON", "~> 5"
  end

  s.subspec "SnapKit" do |ss|
    ss.ios.deployment_target = "11.0"
    ss.source_files = "Sources/SnapKit/**/*.swift"
    ss.dependency "SnapKit", "~> 5"
  end

  s.subspec "UIKit" do |ss|
    ss.ios.deployment_target = "11.0"
    ss.source_files = "Sources/UIKit/**/*.swift"
    ss.ios.frameworks = "UIKit"
  end

  s.subspec "WebKit" do |ss|
    ss.ios.deployment_target = "11.0"
    ss.source_files = "Sources/WebKit/**/*.swift"
    ss.ios.frameworks = "WebKit", "UIKit"
  end

  s.subspec "StoreKit" do |ss|
    ss.ios.deployment_target = "11.0"
    ss.source_files = "Sources/StoreKit/**/*.swift"
    ss.ios.frameworks = "StoreKit", "UIKit"
  end
end
