require 'rubygems'

Gem::Specification.new do |gem|
  gem.name      = 'rack-auth-cheat'
  gem.version   = '0.1.0'
  gem.authors   = ["Daniel Berger", "Charlie O'Keefe"]
  gem.email     = 'cokeefe@globe.gov'
  gem.homepage  = 'http://www.github.com/rack-auth-cheat'
  gem.summary   = 'Rack middleware that authenticates requests with matching username and password'
  gem.test_file = 'test/test_rack_auth_cheat.rb'
  gem.files     = Dir['**/*'].delete_if{ |item| item.include?('git') } 

  gem.extra_rdoc_files = ['CHANGES', 'README', 'MANIFEST']

  gem.add_dependency('rack', '>= 1.0.0')
  
  gem.description = <<-EOF
    The rack-auth-cheat library provides a Rack middleware interface which authenticates
    any request with a matching username and password. This is useful in development
    environments, especially as a way to stub out an external authentication system. Be
    sure to include this from an environment-specific file such as
    config/environments/development.rb rather than from a global configuration file such
    as config/environment.rb
  EOF
end
