#pragma once

#include <unistd.h>

#ifdef __cplusplus
extern "C" {
#endif

extern int dup2(int fildes, int fildes2);

extern int gettimeofday(struct timeval * restrict tp, void * restrict tzp);

extern struct servent * getservbyport(int port, const char * proto);

#ifdef __cplusplus
}
#endif
