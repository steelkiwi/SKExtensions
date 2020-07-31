Pod::Spec.new do |s|

  s.name         = "SKExtensions"
  s.version      = "1.1.0"
  s.summary      = "Common used Extensions in Swift"

  s.description  = <<-DESC
  Pack of common used and convenience extension in Steelkiwi iOS team
                   DESC

  s.homepage     = "https://github.com/steelkiwi/SKExtensions"
  s.license      = {
    :type => "MIT",
    :file => "LICENSE"
  }
  s.author       = { "Steelkiwi Inc." => "olesenko@steelkiwi.com" }

  s.platform     = :ios
  s.source       = {
    :git => "https://github.com/steelkiwi/SKExtensions.git",
    :tag => s.version
  }
  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '4.2' }
  s.swift_version         = "4.2"

  s.source_files  = "Classes", "SKExtensions/Sources/*.swift"

end
