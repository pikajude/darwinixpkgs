postfixPrivateHeaders() {
  # we need to use -idirafter here to ensure that the private headers are searched after
  # regular libc paths, because their include hierarchy cannot be relied on
  NIX_CFLAGS_COMPILE="${NIX_CFLAGS_COMPILE/"-isystem @out@/include"} -idirafter @out@/include"
}

preConfigureHooks+=(postfixPrivateHeaders)
