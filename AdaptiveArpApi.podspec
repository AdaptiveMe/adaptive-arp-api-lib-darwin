Pod::Spec.new do |s|
  s.name             = "AdaptiveArpApi"
  s.version          = "2.2.10"
  s.summary          = "The Adaptive Runtime Platform (ARP) provides native “containers” for Hybrid Apps. This is the API all platforms must adhere to."
  s.description      = <<-DESC
                       The Adaptive Runtime Platform (ARP) provides these native “containers” for the main mobile and desktop platforms so that Hybrid apps can be compiled and deployed on a multiplicity of devices leveraging the same code developed using modern web technologies. This project represents the APIs to be supported on the given language domain.
                       DESC
  s.homepage         = "https://github.com/AdaptiveMe/adaptive-arp-api-lib-darwin"
  s.license          = 'Apache 2.0 License'
  s.author           = { "Carlos Lozano" => "carlos@adaptive.me" }
  s.source           = { :git => "https://github.com/AdaptiveMe/adaptive-arp-api-lib-darwin.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/adaptiveme'

  s.platforms	     = {:ios => '8.0'}
  s.requires_arc 	 = true

  s.source_files 	 = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'AdaptiveArpApi' => ['Pod/Assets/*.png']
  }
  s.framework    = 'Foundation'
end
