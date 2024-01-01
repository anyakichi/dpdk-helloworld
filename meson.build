project('helloworld', 'c')

deps_dynamic = []

sources = files(
  'main.c'
)

dpdk = dependency('libdpdk')
deps_dynamic += dpdk

executable('helloworld-dynamic', sources, dependencies: deps_dynamic)

# dependency('libdpdk', static: true) doesn't work intendedly.  Dynamic link
# libraries which are required by DPDK library are not linked.
# Use pkg-config directly for workaround.
pkgconfig = find_program('pkg-config')

cflags_cmd = run_command(pkgconfig, '--cflags', 'libdpdk', check: true)
cflags = cflags_cmd.stdout().split()

ldflags_cmd = run_command(pkgconfig, '--static', '--libs', 'libdpdk', check: true)
ldflags = ldflags_cmd.stdout().split()

executable('helloworld-static', sources, c_args: cflags, link_args: ldflags)
