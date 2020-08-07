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

# ifdef BUILD_FLAGS
# EXTRA_CFLAGS+=${BUILD_FLAGS}
# else
# EXTRA_CFLAGS+=-DMINIMAL_CIPHERS -DNO_QINFO -DNO_SERVER \
# 	-DNO_ERR_REASONS -DNO_OOO_0RTT \
# 	-DNO_MIGRATION -DNO_SRT_MATCHING
# endif

# # -DDSTACK -finstrument-functions -DNDEBUG -DRELEASE_BUILD
# # -finstrument-functions-exclude-file-list=deps/micro-ecc,deps/cifra
# EXTRA_CFLAGS+=-fstack-usage -foptimize-strlen -ffast-math \
# 	-Wno-error -Wno-parentheses -Wno-undef -Wno-unknown-pragmas \
# 	-Wno-unused-value -Wno-address -DNDEBUG -DRELEASE_BUILD \
# 	-DDLEVEL=DBG -DNO_TLS_LOG -DNO_QLOG -DNO_ECN \
# 	-D'ntoh16(x)=__builtin_bswap16(*(uint16_t*)(x))' \
# 	-D'ntoh32(x)=__builtin_bswap32(*(uint32_t*)(x))' \
# 	-D'ntoh64(x)=__builtin_bswap64(*(uint64_t*)(x))'

EXTRA_CFLAGS+=-DHAVE_NETINET_IN_H -DHAVE_POLL_H -DHAVE_UNISTD_H \
	-DHAVE_SOCKADDR_STORAGE -DHAVE_ARPA_INET_H -DHAVE_STRINGS_H \
	-DHAVE_SYS_TIME_H -DHAVE_NETDB_H -DHAVE_SYS_SOCKET_H 

EXTRA_CFLAGS+=-D'_U_=__attribute__((unused))' -DIPPORT_RESERVED=1024

EXTRA_CFLAGS+=-Wno-format



# TODO: figure out how to do this using make rules
$(shell	cd $(SOURCE_PATH) && ln -sf ../../examples)
$(shell	cd $(SOURCE_PATH) && ln -sf ../../include)
$(shell	cd $(SOURCE_PATH) && ln -sf ../../mount)
$(shell	cd $(SOURCE_PATH) && ln -sf ../../nfs)
$(shell	cd $(SOURCE_PATH) && ln -sf ../../portmap)
$(shell	cd $(SOURCE_PATH) && ln -sf ../../rquota)
$(shell	cd $(SOURCE_PATH) && ln -sf ../../lib)

# WARPCORE_VERSION:=$(shell grep 'warpcore.*VERSION' $(SOURCE_PATH)/../../$(WARPCORE)/../CMakeLists.txt | cut -d' ' -f3)
# $(shell	mkdir -p $(SOURCE_PATH)/warpcore)
# $(shell [ -s $(SOURCE_PATH)/warpcore/config.c ] || \
# 	sed -E -e 's|@PROJECT_NAME@|warpcore|g; s|@PROJECT_NAME_UC@|WARPCORE|g; s|@PROJECT_VERSION@|$(WARPCORE_VERSION)|g;' \
# 		$(SOURCE_PATH)/../../$(WARPCORE)/src/config.c.in > $(SOURCE_PATH)/warpcore/config.c)
# $(shell [ -s $(SOURCE_PATH)/warpcore/config.h ] || \
# 	sed -E -e 's|@PROJECT_NAME@|warpcore|g; s|@PROJECT_NAME_UC@|WARPCORE|g; s|@PROJECT_VERSION@|$(WARPCORE_VERSION)|g; s|(#cmakedefine)|// \1|g; s|(@.*@)|0|g;' \
# 		$(SOURCE_PATH)/../../$(WARPCORE)/include/warpcore/config.h.in > $(SOURCE_PATH)/warpcore/config.h)

# QUANT_VERSION:=$(shell grep 'quant.*VERSION' $(SOURCE_PATH)/../../CMakeLists.txt | cut -d' ' -f3)
# DRAFT_VERSION:=$(shell grep 'quant.*VERSION' $(SOURCE_PATH)/../../CMakeLists.txt | cut -d' ' -f3 | cut -d. -f3)
# $(shell	mkdir -p $(SOURCE_PATH)/quant)
# $(shell [ -s $(SOURCE_PATH)/../lib/src/config.c ] || \
# 	sed -E -e 's|@PROJECT_NAME@|quant|g; s|@PROJECT_NAME_UC@|QUANT|g; s|@PROJECT_VERSION@|$(QUANT_VERSION)|g; s|@PROJECT_VERSION_PATCH@|$(DRAFT_VERSION)|g; s|(@.*@)|0|g;' \
# 		$(SOURCE_PATH)/../../lib/src/config.c.in > $(SOURCE_PATH)/quant/config.c)
# $(shell [ -s $(SOURCE_PATH)/../lib/include/quant/config.h ] || \
# 	sed -E -e 's|@PROJECT_NAME@|quant|g; s|@PROJECT_NAME_UC@|QUANT|g; s|@PROJECT_VERSION@|$(QUANT_VERSION)|g; s|@PROJECT_VERSION_PATCH@|$(DRAFT_VERSION)|g; s|(#cmakedefine)|// \1|g; s|(@.*@)|0|g;' \
# 		$(SOURCE_PATH)/../../lib/include/quant/config.h.in > $(SOURCE_PATH)/quant/config.h)
