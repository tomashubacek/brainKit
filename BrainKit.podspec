Pod::Spec.new do |s|
  s.name = "BrainKit"
  s.summary = "Useful extensions and classes."
  s.version = "0.0.7"
  s.swift_version = "5.0"
  s.homepage = "https://userbrain.co"
  s.license = {:type => "MIT", :file => "LICENSE"}
  s.authors = {"Ondrej Hanak" => "oh@ondrejhanak.cz", "Jakub Heglas" => "jakub@userbrain.co"}
  s.source = {:git => "https://bitbucket.org/userbrain/brainkit.git", :tag => s.version.to_s}
  s.ios.deployment_target = "10.0"
  s.watchos.deployment_target = "5.0"
  s.default_subspecs = "Foundation", "UIKit"

  s.subspec "AVFoundation" do |ss|
    ss.source_files = "Sources/AVFoundation/**/*.swift"
    ss.ios.frameworks = "AVFoundation", "UIKit"
  end

  s.subspec "CoreData" do |ss|
    ss.source_files = "Sources/CoreData/**/*.swift"
    ss.ios.frameworks = "Coredata"
  end

  s.subspec "Foundation" do |ss|
    ss.source_files = "Sources/Foundation/**/*.swift"
    ss.ios.frameworks = "Foundation"
  end

  s.subspec "SafariServices" do |ss|
    ss.source_files = "Sources/SafariServices/**/*.swift"
    ss.ios.frameworks = "SafariServices"
  end

  s.subspec "SwiftyJSON" do |ss|
    ss.source_files = "Sources/SwiftyJSON/**/*.swift"
    ss.dependency "BrainKit/Foundation"
    ss.dependency "SwiftyJSON", "~> 5"
  end

  s.subspec "UIKit" do |ss|
    ss.source_files = "Sources/UIKit/**/*.swift"
    ss.ios.frameworks = "UIKit"
  end

  s.subspec "WebKit" do |ss|
    ss.source_files = "Sources/WebKit/**/*.swift"
    ss.ios.frameworks = "WebKit", "UIKit"
  end
end
