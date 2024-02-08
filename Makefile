SUBDIRS := c_lib/i2c-driver c_lib/libaximemmap c_lib/libxhelper c_lib/sysmon-driver

INSTALL_DIR_RAFT := $(DESTDIR)/usr/share/raft

.PHONY: all clean install $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

clean:
	for dir in $(SUBDIRS); do \
        	$(MAKE) -C $$dir clean; \
	done

install:
	for dir in $(SUBDIRS); do \
        	$(MAKE) DESTDIR=$(DESTDIR) -C $$dir install; \
	done
	install -d $(INSTALL_DIR_RAFT)
	cp -r * $(INSTALL_DIR_RAFT)
