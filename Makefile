# ------------------------------------------------
# Yet Another Rogue-Like
#
# Author: Philip Nickerson <pgnickerson98@gmail.com>
# Date  : 2020-10-03
#
# ------------------------------------------------

TARGET		=	YARL

# compiling flags here
CC			=	gcc
CFLAGS		=	-O -Wall

# linking flags here
LINKER		=	gcc
LFLAGS		=	-Wall -lm


SRCDIR		=	src
INCDIR		=	src/include
OBJDIR		=	obj
BINDIR		=	bin

SOURCES		:=	$(wildcard $(SRCDIR)/*.c)
INCLUDES	:=	$(wildcard $(INCDIR)/*.h)
OBJECTS		:=	$(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
rm			=	rm -f


$(BINDIR)/$(TARGET): $(OBJECTS)
		@$(LINKER) $(OBJECTS) $(LFLAGS) -o $@
		@echo "Linking complete!"

$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.c
		@$(CC) $(CFLAGS) -c $< -o $@
		@echo "Compiled "$<" successfully!"

.PHONY: clean
clean:
		@$(rm) $(OBJECTS)
		@$(rm) $(BINDIR)/$(TARGET)
		@echo "Cleanup complete!"
