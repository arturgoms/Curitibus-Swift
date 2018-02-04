platform :ios, '10.0'
use_frameworks!

target 'CuritiBus' do

  # API Client
  pod 'CodableAlamofire'

  # Fabric
  pod 'Fabric'
  pod 'Crashlytics'
  
  # Firebase
  pod 'Firebase/Core'
  pod 'Firebase/Performance'
  pod 'Firebase/Auth'
  
  # GoogleMaps
  pod 'GoogleMaps'
  pod 'GooglePlaces'
  
  # Auth
  pod 'Simplicity', :git => 'https://github.com/diegotl/Simplicity.git', :branch => 'firebase'
  pod 'TwitterKit'
  
  # UI
  pod 'TinyConstraints'
  
  # For mocking http requests (temporary)
  pod 'OHHTTPStubs/Swift'

  target 'CuritiBusTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CuritiBusUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
