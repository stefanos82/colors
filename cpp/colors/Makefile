COMPILER := g++
FILE_EXT := cpp

include flags.mk

CCACHE := $(shell basename $(shell command -v ccache 2>/dev/null))

ifdef CCACHE
CC = $(CCACHE) $(COMPILER)
else
CC = $(COMPILER)
endif

SRC := src
INC = -I $(SRC)

OBJDIR := obj
BINDIR := bin

TARGET = $(BINDIR)/$(notdir $(basename $(shell pwd)))

SOURCES = $(wildcard $(SRC)/*.$(FILE_EXT))
TMPOBJ = $(patsubst %.$(FILE_EXT), %.o, $(notdir $(SOURCES)))
OBJECTS = $(addprefix $(OBJDIR)/, $(TMPOBJ))

CPUS ?= $(shell nproc)
ifdef CPUS
MAKEFLAGS += --jobs=$(CPUS)
endif

PLUSFLAGS ?=
PLUSLDFLAGS ?=

$(TARGET): $(OBJECTS)
ifneq ($(PLUSLDFLAGS),)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS) $(PLUSLDFLAGS)
else
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)
endif
makedirs:
	@mkdir -p $(OBJDIR) $(BINDIR)

$(OBJECTS): $(OBJDIR)/%.o: $(SRC)/%.$(FILE_EXT)
ifneq ($(PLUSFLAGS),)
	$(CC) $(FLAGS) $(PLUSFLAGS) $(INC) -c $< -o $@
else
	$(CC) $(FLAGS) $(INC) -c $< -o $@
endif

ifeq ($(COMPILER),g++)
debug: FLAGS += -g -Og
debug: FLAGS += -fno-omit-frame-pointer
debug: FLAGS += -D_GLIBCXX_DEBUG
debug: FLAGS += -DDEBUG
else
debug: FLAGS += -g -Og -fno-omit-frame-pointer
debug: FLAGS += -DDEBUG
endif

SANITIZER ?= -fsanitize=address,undefined
sanitize: FLAGS += $(SANITIZER)
sanitize: LDFLAGS += $(SANITIZER)
sanitize: debug

ANALYZER ?= -fanalyzer
ANALYZER += -Wanalyzer-too-complex
analyze: FLAGS += $(ANALYZER)
analyze: debug

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
