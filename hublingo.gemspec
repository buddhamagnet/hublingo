Gem::Specification.new do |s|
  s.name                 = 'hublingo'
  s.version              = '0.0.3'
  s.rubygems_version     = '2.1.11'
  s.platform             = Gem::Platform::RUBY
  s.summary              = 'Hublingo!'
  s.description          = 'Seek the languages they love'
  s.authors              = ['Dave Goodchild']
  s.email                = ['buddhamagnet@gmail.com']
  s.files                = Dir["{lib}/**/*.rb", "LICENSE", "*.md"]
  s.require_path         = 'lib'
  s.homepage             = 'http://github.com/buddhamagnet/hublingo'
  s.license              = 'MIT'
  s.add_runtime_dependency 'octokit', ["=2.7.1"]
  s.post_install_message = 'We hope you enjoy hublingo'
end
