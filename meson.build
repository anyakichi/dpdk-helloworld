project('helloworld', 'c',
  default_options: ['warning_level=2'])

sources = files(
  'main.c'
)

dpdk = dependency('libdpdk')

if get_option('dpdk-static')
  pkgconfig = find_program('pkg-config')

  # run_command does not point pkg-config into the sysroot as dependency
  # does, so the environment is set here from the cross file.
  pkgconfig_env = environment()
  sys_root = meson.get_external_property('sys_root', '')
  if sys_root != ''
    pkgconfig_env.set('PKG_CONFIG_SYSROOT_DIR', sys_root)
  endif
  pkg_config_libdir = meson.get_external_property('pkg_config_libdir', [])
  if pkg_config_libdir.length() > 0
    pkgconfig_env.set('PKG_CONFIG_LIBDIR', ':'.join(pkg_config_libdir))
  endif
  pkg_config_path = get_option('pkg_config_path')
  if pkg_config_path.length() > 0
    pkgconfig_env.set('PKG_CONFIG_PATH', ':'.join(pkg_config_path))
  endif

  cflags_cmd = run_command(pkgconfig, '--cflags', 'libdpdk',
    env: pkgconfig_env, check: true)
  cflags = cflags_cmd.stdout().split()

  ldflags_cmd = run_command(pkgconfig, '--static', '--libs', 'libdpdk',
    env: pkgconfig_env, check: true)
  ldflags = ldflags_cmd.stdout().split()

  executable('helloworld', sources, c_args: cflags, link_args: ldflags)
else
  executable('helloworld', sources, dependencies: [dpdk])
endif
