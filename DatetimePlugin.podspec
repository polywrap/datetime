Pod::Spec.new do |s|
    s.name             = 'DatetimePlugin'
    s.version          = '0.0.2'
    s.summary          = 'Datetime wallet plugin'
    s.homepage         = 'https://github.com/polywrap/datetime'
    s.license          = 'MIT'
    s.author           = { 'Cesar' => 'cesar@polywrap.io' }
  
    s.source_files = 'implementations/swift/Source/**/*.swift'
    s.swift_version  = "5.0"
    s.ios.deployment_target = '13.0'
    s.osx.deployment_target = '10.15'
    s.source = { :git => "https://github.com/polywrap/datetime.git", :branch => 'main' }
    s.static_framework = true
    s.dependency 'PolywrapClient', '~> 0.0.6'
  end