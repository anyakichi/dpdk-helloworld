project('helloworld', 'c',
  default_options: ['warning_level=2'])

sources = files(
  'main.c'
)

dpdk = dependency('libdpdk')

if get_option('dpdk-static')
  pkgconfig = find_program('pkg-config')

  cflags_cmd = run_command(pkgconfig, '--cflags', 'libdpdk', check: true)
  cflags = cflags_cmd.stdout().split()

  ldflags_cmd = run_command(pkgconfig, '--static', '--libs', 'libdpdk', check: true)
  ldflags = ldflags_cmd.stdout().split()

  executable('helloworld', sources, c_args: cflags, link_args: ldflags)
else
  executable('helloworld', sources, dependencies: [dpdk])
endif
