OPTIMIZE ?= -flto=auto

FLAGS ?= -Wall
FLAGS += -Wextra
FLAGS += -Werror
FLAGS += -Wpedantic
FLAGS += -Wconversion
FLAGS += -std=c++20
FLAGS += $(OPTIMIZE)

LDFLAGS ?= -fno-strict-aliasing
LDFLAGS += $(OPTIMIZE)
LDFLAGS += -fwrapv
LDFLAGS += -lm

ANALYZER ?=
#ANALYZER ?= -fanalyzer
#ANALYZER += -Wanalyzer-too-complex

#SANITIZER ?= -fsanitize=address,undefined
SANITIZER ?=

LDFLAGS += -lfmt
