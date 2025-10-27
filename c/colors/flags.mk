OPTIMIZE ?= -flto=auto

FLAGS ?= -Wall
FLAGS += -Wextra
FLAGS += -Wconversion
FLAGS += -march=native
FLAGS += $(OPTIMIZE)
FLAGS += -fwrapv

LDFLAGS ?= -fno-strict-aliasing
LDFLAGS += $(OPTIMIZE)
LDFLAGS += -lm

