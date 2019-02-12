Pod::Spec.new do |s|

  s.name                  = "InPos+RestKit"
  s.version               = "1.0.21"
  s.summary               = "InPos wrapper classes for RestKit"
  s.description           = <<-DESC "This framework uses the factory method, facade, command design patterns to modularize the work with the RestKit framework."
                               DESC
  s.homepage              = "https://github.com/cognitivecreators/inpos-restkit"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "Zsolt Balint" => "bzsolt@inpossoft.com" }
  s.platform              = :ios
  s.ios.deployment_target = "8.0"
  s.source                = { :git => "git@github.com:cognitivecreators/inpos-restkit.git", :tag => "#{s.version}", :submodules => true }
  s.framework             = "Foundation"
  s.requires_arc          = true
  s.default_subspec       = 'Core'
  s.swift_version         = '4.2'
  s.dependency 'RestKit', '0.27.2'
  s.dependency 'Alamofire', '4.7.0'
  
  ### Subspecs
  
  s.subspec 'Core' do |cs|
    cs.source_files          = "InPos+RestKit/Classes/Core/**/*.{swift}", "InPos+RestKit/Plist/**/*.{swift}", "InPos+RestKit/CoreData/Utils/**/*.{swift}"
  end

  s.subspec 'CoreData' do |os|
    os.source_files          = "InPos+RestKit/Classes/CoreData/**/*.{swift}", "InPos+RestKit/CoreData/**/*.{swift}"
    os.dependency 'InPos+RestKit/Core'
  end
  
end
