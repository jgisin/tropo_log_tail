# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tropo_tail/version'

Gem::Specification.new do |spec|
  spec.name          = "tropo_tail"
  spec.license="Nonstandard"
  spec.version       = TropoTail::VERSION
  spec.authors       = ["Jeffrey Gisin"]
  spec.email         = ["jgisin@gmail.com"]

  spec.summary       = "A log tailing application for Tropo's scripting API"
  spec.description   = "Currently the only way to access Tropo logs is to download a text file from the Tropo FTP site. This requires constant redownloads of files that can grow to very large sizes. Tropo tail allows you to live tail your logs with log rollovers when Tropo creates a new log file, for a better development experience."
  spec.homepage      = "http://www.cloverhound.com"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  #if spec.respond_to?(:metadata)
    #spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  #else
    #raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = "tropo_tail"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_dependency('methadone', '~> 1.9.2')
  spec.add_development_dependency('test-unit')
  spec.add_dependency('colorize')
end
