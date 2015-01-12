Gem::Specification.new do |spec|
  spec.date        = '2015-01-12'
  spec.version     = '0.0.4'
  spec.name        = 'console_view_helper'
  spec.summary     = 'Set of components and methods used to build clean and beautiful console application interfaces.'
  spec.description =
    [
      "The console_view_helper library is used to build clean and beautiful console application interfaces.",
      "Customizable Components such as banners, tables, menus, lists, text inputs, hidden text inputs and",
      "methods as colorize,  putsi, printi, align, explain, among others,",
      "will help you build a good console application interface with less code and in less time."
    ].join("\n")
  spec.license     = 'MIT'
  spec.homepage    = 'https://github.com/ammancilla/console_view_helper'

  spec.authors     = ['Alfonso Mancilla']
  spec.email       = ['almancill@gmail.com']

  spec.files       = ['lib/console_view_helper.rb']

  spec.add_runtime_dependency 'colored', ['= 1.2']
end