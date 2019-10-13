require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "x-react-native-env-config"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  x-react-native-env-config
                   DESC
  s.homepage     = "https://github.com/x-react-native/env-config"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = 'Pedro Belo', "Drew Miller"
  s.platforms    = { :ios => "9.0", :tvos => "10.0" }
  s.source       = { :git => "https://github.com/x-react-native/env-config", :tag => "#{s.version}" }

  s.script_phase = {
    name: 'Config codegen',
    script: %(
set -ex
HOST_PATH="$SRCROOT/../.."
"${PODS_TARGET_SRCROOT}/ios/BuildDotenvConfig.rb" "$HOST_PATH" "${PODS_TARGET_SRCROOT}/ios"
),
    execution_position: :before_compile,
    input_files: ['$(SRCROOT)/BuildDotenvConfig.rb']
  }

  s.source_files = 'ios/**/*.{h,m}'
  s.requires_arc = true

  s.dependency 'React'
end
