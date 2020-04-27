Pod::Spec.new do |s|
  s.name = "BrainKit"
  s.summary = "Useful extensions and classes."
  s.version = "0.0.5"
  s.swift_version = "5.0"
  s.homepage = "https://userbrain.co"
  s.license = {:type => "MIT", :file => "LICENSE"}
  s.authors = {"Ondrej Hanak" => "oh@ondrejhanak.cz", "Jakub Heglas" => "jakub@userbrain.co"}
  s.source = {:git => "https://bitbucket.org/userbrain/brainkit.git", :tag => s.version.to_s}
  s.ios.deployment_target = "10.0"
  s.default_subspecs = "Foundation", "UIKit"

  s.subspec "Foundation" do |ss|
    ss.source_files = "Sources/Foundation/**/*.swift"
    ss.ios.frameworks = "Foundation"
  end

  s.subspec "UIKit" do |ss|
    ss.source_files = "Sources/UIKit/**/*.swift"
    ss.ios.frameworks = "UIKit"
  end

  s.subspec "SwiftyJSON" do |ss|
    ss.source_files = "Sources/SwiftyJSON/**/*.swift"
    ss.dependency "BrainKit/Foundation"
    ss.dependency "SwiftyJSON", "~> 5"
  end
end
