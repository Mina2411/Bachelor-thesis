# mkdir: -p = --parents. No error if dir exists
#        -v = --verbose. print a message for each created directory
MKDIR = mkdir -pv

# rm: -r = --recursive. Remove the contents of dirs recursively
#     -v = --verbose. Explain what is being done
#     -f = --force.Ignore nonexistent files, never prompt
#     --no-preserve-root.
RM = rm -rvf --no-preserve-root

ECHO = echo

TOP_DIR=../
OBJ_DIR = $(TOP_DIR)linuxbuild/obj
ELF_DIR = $(TOP_DIR)linuxbuild/bin

CC=/home/shemin00/opt/riscv/bin/riscv64-unknown-elf-gcc
CPP=/home/shemin00/opt/riscv/bin/riscv64-unknown-elf-g++
OBJDUMP=/home/shemin00/opt/riscv/bin/riscv64-unknown-elf-objdump

FPU_ENABLED=1

CFLAGS= -c -g -static -std=gnu99 -O0 -fno-common -fno-builtin-printf -DSYS_HZ=40000000 
ifeq ($(FPU_ENABLED), 1)
  CFLAGS += -DFPU_ENABLED -march=rv64g
  # -march=rv64imafd
else
  CFLAGS += -march=rv64imac -mabi=lp64 -march=rv64g
endif

LDFLAGS = -T test.ld -nostdlib -nostartfiles -march=rv64imafdc_zicsr_zifencei
ifeq ($(FPU_ENABLED), 1)
else
  LDFLAGS += -mabi=lp64 -march=rv64g
  # -march=rv64imac
endif

INCL_KEY=-I
DIR_KEY=-B


# include sub-folders list
INCL_PATH=\
        $(TOP_DIR)../common/system \
        $(TOP_DIR)../common \
        $(TOP_DIR)src

# source files directories list:
SRC_PATH =\
        $(TOP_DIR)../common/system \
        $(TOP_DIR)src

LIB_NAMES =\
        gcc \
        c \
        m

VPATH = $(SRC_PATH)


TARGET := MyHelloWorld

# All of the sources participating in the build are defined here
OBJS := $(patsubst ../linuxbuild/obj/%,%,$(patsubst ../src/%.c,%.o,$(wildcard ../src/*.c)))


#-----------------------------------------------------------------------------
.SILENT:
	TEA = 2>&1 | tee _$@-comp.err


all:	$(TARGET)
	$(ECHO) "    All done.\n"


$(TARGET): $(OBJS)
	$(ECHO) "$(TARGET) tests image building started:"
	$(MKDIR) ./$(OBJ_DIR)
	$(MKDIR) ./$(ELF_DIR)
	#make -f make_bootrom_tests TOP_DIR=$(TOP_DIR) OBJ_DIR=$(OBJ_DIR) ELF_DIR=$(ELF_DIR) $@ $(TEA)

	#@echo 'Invoking: GCC C++ Linker'
	#g++ -L$(xercesPath)/lib -L$(systemcLibPath) -L$(boostPath)/lib -o $(TARGET) $(OBJS) $(LIBS) $(LINKFLAGS)
	@echo 'Finished building target: $(TARGET)'
	@echo ' '


$(OBJS): %.o: ../%.c $(wildcard ../*.h)
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	#g++ -isystem $(systemcPath)/include -isystem $(xercesPath)/include -isystem $(boostPath)/include $(CFLAGS) -c -fmessage-length=100 -o "$@" "$<"
	touch $@
	@echo 'Finished building: $<'
	@echo ' '



# Other Targets
clean:
	$(RM) $(OBJS) $(TARGET)


.PHONY: all clean
.SECONDARY:

