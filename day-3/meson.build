project('day-3', 'vala', 'c',
  version: '0.0.1')

dependencies = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  # Add C Math Library
  meson.get_compiler('c').find_library('m', required: false),
]

add_project_arguments(['--enable-experimental'], language: 'vala')

subdir('src')
