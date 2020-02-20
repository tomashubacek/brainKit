Pod::Spec.new do |s|
  s.name             = "BrainKit"
  s.summary          = "Useful extensions and classes."
  s.version          = "0.0.2"
  s.swift_version    = "5.0"
  s.homepage         = "https://userbrain.co"
  s.license          = {:type => "MIT", :file => "LICENSE"}
  s.authors          = {"Ondrej Hanak" => "oh@ondrejhanak.cz", "Jakub Heglas" => "jakub@userbrain.co"}
  s.source           = {:git => "https://bitbucket.org/userbrain/brainkit.git", :tag => s.version.to_s}
  s.platform         = :ios, "9.0"
  s.source_files     = "Sources/**/*.{swift,h}", "LICENSE"
end
