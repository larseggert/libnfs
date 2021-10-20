INCLUDE_DIRS+=$(SOURCE_PATH)
CPPSRC+=main.cpp

INCLUDE_DIRS+=\
	$(SOURCE_PATH)/include \
	$(SOURCE_PATH)/include/nfsc \
	$(SOURCE_PATH)/mount \
	$(SOURCE_PATH)/nfs \
	$(SOURCE_PATH)/portmap \
	$(SOURCE_PATH)/rquota

LIBNFS_SRC+=\
	posix.c \
	nfs.c \
	lib/libnfs.c \
	lib/socket.c \
	lib/init.c \
	lib/pdu.c \
	lib/libnfs-zdr.c \
	portmap/portmap.c \
	portmap/libnfs-raw-portmap.c \
	mount/mount.c \
	mount/libnfs-raw-mount.c \
	nfs/nfs.c \
	nfs/nfsacl.c \
	nfs/libnfs-raw-nfs.c \
	rquota/rquota.c \
	rquota/libnfs-raw-rquota.c

CSRC+=$(LIBNFS_SRC) nfs.c

# comment out for minimally-sized build
EXTRA_CFLAGS+=-DDEBUG_BUILD=y

EXTRA_CFLAGS+=-DHAVE_NETINET_IN_H -DHAVE_POLL_H -DHAVE_UNISTD_H \
	-DHAVE_SOCKADDR_STORAGE -DHAVE_ARPA_INET_H -DHAVE_STRINGS_H \
	-DHAVE_SYS_TIME_H -DHAVE_NETDB_H -DHAVE_SYS_SOCKET_H

EXTRA_CFLAGS+=-D'_U_=__attribute__((unused))' -DIPPORT_RESERVED=1024

EXTRA_CFLAGS+=-Wno-format -Wno-incompatible-pointer-types -Wno-address-of-packed-member -Werror

# TODO: figure out how to do this using make rules
$(shell	cd $(SOURCE_PATH) && ln -sf ../../include)
$(shell	cd $(SOURCE_PATH) && ln -sf ../../mount)
$(shell	cd $(SOURCE_PATH) && ln -sf ../../nfs)
$(shell	cd $(SOURCE_PATH) && ln -sf ../../portmap)
$(shell	cd $(SOURCE_PATH) && ln -sf ../../rquota)
$(shell	cd $(SOURCE_PATH) && ln -sf ../../lib)
