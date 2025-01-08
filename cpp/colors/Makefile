CCACHE := $(shell basename $(shell command -v ccache 2>/dev/null))

COMPILER := g++

ifdef CCACHE
CC = $(CCACHE) $(COMPILER)
else
CC = $(COMPILER)
endif

SRC := src
INC = -I $(SRC)

include flags.mk

OBJDIR := obj
BINDIR := bin

TARGET = $(BINDIR)/$(notdir $(basename $(shell pwd)))

SOURCES = $(wildcard $(SRC)/*.cpp)
TMPOBJ = $(patsubst %.cpp, %.o, $(notdir $(SOURCES)))
OBJECTS = $(addprefix $(OBJDIR)/, $(TMPOBJ))

CPUS ?= $(shell nproc)
ifdef CPUS
MAKEFLAGS += --jobs=$(CPUS)
endif

PLUSFLAGS ?=
PLUSLDFLAGS ?=

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS) $(PLUSLDFLAGS)

makedirs:
	@mkdir -p $(OBJDIR) $(BINDIR)

$(OBJECTS): $(OBJDIR)/%.o: $(SRC)/%.cpp
	$(CC) $(FLAGS) $(PLUSFLAGS) $(INC) -c $< -o $@

ifeq ($(COMPILER),g++)
debug: FLAGS += -g -Og -fno-omit-frame-pointer -D_GLIBCXX_DEBUG $(SANITIZER) $(ANALYZER)
else
debug: FLAGS += -g -Og -fno-omit-frame-pointer $(SANITIZER) $(ANALYZER)
endif
debug: LDFLAGS += $(SANITIZER)
debug:
	@echo "make $(MAKEFLAGS) got executed in debug mode..."
debug: full

release: FLAGS += -O2
release: LDFLAGS += -s
release: full

run:
	@./$(TARGET)

full: makedirs $(TARGET)

.PHONY: clean makedirs

clean:
	@echo "Cleaning target and object files..."

	@$(RM) -r $(OBJDIR)
	@$(RM) -r $(BINDIR)

	@find . -type f -iname "*.gch" -delete

	@echo "All clear!"

.DEFAULT_GOAL := debug
