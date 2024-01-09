project('helloworld', 'c', default_options: ['buildtype=release'])

deps_dynamic = []
deps_static = []

sources = files(
  'main.c'
)

deps_dynamic += dependency('libdpdk')
deps_static += dependency('libdpdk', static: true)

# Workaround for link failure
deps_static += dependency('libsystemd')
deps_static += dependency('libisal', required: false)

executable('helloworld-dynamic', sources, dependencies: deps_dynamic)
executable('helloworld-static', sources, dependencies: deps_static,
  link_args: ['-Wl,--allow-multiple-definition'])
