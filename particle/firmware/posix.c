#include <fcntl.h>


#include "posix.h"


int dup2(int fildes, int fildes2)
{
    close(fildes2);
    return fcntl(fildes, F_DUPFD, fildes2);
}


int _gettimeofday(struct timeval * restrict tp, void * restrict tzp)
{
    return 0;
}


struct servent * getservbyport(int port, const char * proto)
{
    return 0;
}