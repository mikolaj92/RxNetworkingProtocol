Pod::Spec.new do |s|
  s.name         = "RxNetworkingProtocol"
  s.version      = "0.1.2"
  s.summary      = 'Simple protocol for URLSession.'
  s.description  = <<-DESC
    RxWrapper Around NetworkingProtocol https://github.com/mikolaj92/NetworkingProtocol
  DESC
  s.homepage     = 'https://github.com/mikolaj92/RxNetworkingProtocol'
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Patryk Mikolajczyk" => "mikpat92@gmail.com" }
  s.ios.deployment_target = "10.0"
  s.tvos.deployment_target = "10.0"
  s.source       = { :git => "https://github.com/mikolaj92/RxNetworkingProtocol.git", :tag => s.version.to_s }
  s.source_files  = "RxNetworkingProtocol/**/*.{swift}"
  s.frameworks  = "Foundation"
  s.swift_version = "4.2"
  s.dependency "NetworkingProtocol", "~> 0.2.4"
  s.dependency "RxSwift", "~> 4.4.0"
end
