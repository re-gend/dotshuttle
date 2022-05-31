# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.author = 'Jeongho Yoo'
  spec.files = ["bin/dotshuttle"]
  spec.name = 'dotshuttle'
  spec.summary = 'A script that allows quick sync between two file locations'\
    ', especially for current and backup dotfiles.'
  spec.version = '1.0.0'

  spec.homepage = 'https://github.com/re-gend/dotshuttle'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.add_runtime_dependency 'toml'

  spec.bindir = 'bin'
  spec.executables = ['dotshuttle']
end
