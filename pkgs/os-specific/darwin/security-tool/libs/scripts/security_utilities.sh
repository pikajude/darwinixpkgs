preBuild_security_utilities() {
  cat >utilities_dtrace.h <<EOF
#define SECURITY_DEBUG_DELAY(...)
#define SECURITY_DEBUG_LOG(...)
#define SECURITY_DEBUG_LOG_ENABLED(...) 0
#define SECURITY_DEBUG_REFCOUNT_CREATE(...)
#define SECURITY_DEBUG_REFCOUNT_DOWN(...)
#define SECURITY_DEBUG_REFCOUNT_UP(...)
#define SECURITY_DEBUG_SEC_CREATE(...)
#define SECURITY_DEBUG_SEC_CREATE_ENABLED(...) 0
#define SECURITY_DEBUG_SEC_DESTROY(...)
#define SECURITY_EXCEPTION_COPY(...)
#define SECURITY_EXCEPTION_HANDLED(...)
#define SECURITY_EXCEPTION_THROW_CSSM(...)
#define SECURITY_EXCEPTION_THROW_CF(...)
#define SECURITY_EXCEPTION_THROW_MACH(...)
#define SECURITY_EXCEPTION_THROW_OSSTATUS(...)
#define SECURITY_EXCEPTION_THROW_OTHER(...)
#define SECURITY_EXCEPTION_THROW_PCSC(...)
#define SECURITY_EXCEPTION_THROW_SQLITE(...)
#define SECURITY_EXCEPTION_THROW_UNIX(...)
#define SECURITY_MACHSERVER_ALLOC_REGISTER(...)
#define SECURITY_MACHSERVER_ALLOC_RELEASE(...)
#define SECURITY_MACHSERVER_BEGIN(...)
#define SECURITY_MACHSERVER_END(...)
#define SECURITY_MACHSERVER_END_THREAD(...)
#define SECURITY_MACHSERVER_PORT_ADD(...)
#define SECURITY_MACHSERVER_PORT_REMOVE(...)
#define SECURITY_MACHSERVER_REAP(...)
#define SECURITY_MACHSERVER_RECEIVE(...)
#define SECURITY_MACHSERVER_RECEIVE_ENABLED(...) 0
#define SECURITY_MACHSERVER_RECEIVE_ERROR(...)
#define SECURITY_MACHSERVER_SEND_ERROR(...)
#define SECURITY_MACHSERVER_START_THREAD(...)
#define SECURITY_MACHSERVER_TIMER_END(...)
#define SECURITY_MACHSERVER_TIMER_START(...)
EOF

  substituteInPlace cfclass.h \
    --replace CoreFoundation/CFRuntime.h "$srcs_CF/CFRuntime.h"
  substituteInPlace seccfobject.h \
    --replace CoreFoundation/CFRuntime.h "$srcs_CF/CFRuntime.h"
  substituteInPlace cfclass.cpp \
    --replace auto_zone.h "$srcs_libauto/auto_zone.h"
  substituteInPlace seccfobject.cpp \
    --replace auto_zone.h "$srcs_libauto/auto_zone.h"
  substituteInPlace hashing.h \
    --replace CommonCrypto/CommonDigestSPI.h "$srcs_CommonCrypto/include/CommonDigestSPI.h"
  substituteInPlace mach++.cpp \
    --replace bootstrap_priv.h "$srcs_launchd/liblaunch/bootstrap_priv.h"
  substituteInPlace osxcode.cpp \
    --replace CoreFoundation/CFBundlePriv.h "$srcs_CF/CFBundlePriv.h"
  substituteInPlace powerwatch.h \
    --replace IOKit/pwr_mgt/IOPMLibPrivate.h "$srcs_IOKitUser/pwr_mgt.subproj/IOPMLibPrivate.h"
  substituteInPlace unix++.cpp \
    --replace vproc_priv.h "$srcs_launchd/liblaunch/vproc_priv.h"
  substituteInPlace vproc++.cpp \
    --replace vproc_priv.h "$srcs_launchd/liblaunch/vproc_priv.h"
}
