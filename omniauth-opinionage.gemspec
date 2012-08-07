# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/opinionage/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-opinionage'
  s.version  = OmniAuth::Opinionage::VERSION
  s.authors  = ['Carlo Alberto Degli Atti']
  s.email    = ['lordkada@opinionage.com']
  s.summary  = 'Opinionage strategy for OmniAuth'
  s.homepage = 'https://github.com/opinionage/omniauth-opinionage'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  s.add_development_dependency 'rake'
end
