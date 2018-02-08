TOP = ..
include $(TOP)/configure/CONFIG

CMDSEP = ;

SCRIPTS_PREFIX ?=
PWD = $(shell pwd)

# Prefixes
BIN_FILES_PREFIX ?= /usr/local

# OS information
SERVICE_NAME = $(shell basename $(realpath ${TOP}))
INIT_SYSTEM := $(shell ./get-init-system.sh)
SCRIPTS_FULL_NAME := $(shell cd $(INIT_SYSTEM) && find . -type f)

# Strip off a leading ./
SCRIPTS=$(SCRIPTS_FULL_NAME:./%=%)

# Binary files
BIN_FILES_FULL_NAME := $(shell cd ${INIT_SYSTEM} && find bin -type f)
# Strip off a leading ./
BIN_FILES=$(BIN_FILES_FULL_NAME:./%=%)

.PHONY: all clean mrproper install uninstall

all:

install:
	$(foreach script,$(SCRIPTS),mkdir -p $(dir ${SCRIPTS_PREFIX}/$(script)) $(CMDSEP))
	$(foreach script,$(SCRIPTS),cp --preserve=mode $(INIT_SYSTEM)/$(script) ${SCRIPTS_PREFIX}/$(script) $(CMDSEP))
	$(foreach bin,$(BIN_FILES),cp --preserve=mode ${INIT_SYSTEM}/$(bin) ${BIN_FILES_PREFIX}/$(bin) $(CMDSEP))

uninstall:
	-$(foreach bin,$(BIN_FILES),rm -f ${BIN_FILES_PREFIX}/$(bin) $(CMDSEP))
	$(foreach script,$(SCRIPTS),rm -f ${SCRIPTS_PREFIX}/$(script) $(CMDSEP))

realuninstall: uninstall

clean:

realclean: clean

distclean: realclean realuninstall

mrproper: cleaninclude $(TOP)/configure/CONFIG

CMDSEP = ;

SCRIPTS_PREFIX ?=
PWD = $(shell pwd)

# OS information
SERVICE_NAME = $(shell basename $(realpath ${TOP}))
INIT_SYSTEM := $(shell ./get-init-system.sh)
SCRIPTS_FULL_NAME := $(shell cd $(INIT_SYSTEM) && find . -type f)

# Strip off a leading ./
SCRIPTS=$(SCRIPTS_FULL_NAME:./%=%)

.PHONY: all clean mrproper install uninstall

all:

install:
        $(foreach script,$(SCRIPTS),mkdir -p $(dir ${SCRIPTS_PREFIX}/$(script)) $(CMDSEP))
        $(foreach script,$(SCRIPTS),cp --preserve=mode $(INIT_SYSTEM)/$(script) ${SCRIPTS_PREFIX}/$(script) $(CMDSEP))

uninstall:
        $(foreach script,$(SCRIPTS),rm -f ${SCRIPTS_PREFIX}/$(script) $(CMDSEP))

realuninstall: uninstall

clean:

realclean: clean

distclean: realclean realuninstall

mrproper: clean

