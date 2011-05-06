require File.expand_path('../lib/panda_canvas/version', __FILE__)
Gem::Specification.new do |s|
  s.name = 'panda_canvas'
  s.version = ::PandaCanvas::VERSION
  s.description = s.summary = 'Educational 2D drawing canvas on top of Gosu and TexPlay.'

  s.required_ruby_version = '~> 1.9.2'
  s.required_rubygems_version = '>= 1.3.6'

  s.author = 'Dimitry Solovyov'

  s.files = Dir.glob('lib/**/*') << 'LICENSE' << 'README.rdoc'

  s.add_runtime_dependency 'gosu', '~> 0.7.24'
  s.add_runtime_dependency 'texplay', '~> 0.2.981'
end
