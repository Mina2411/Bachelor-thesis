# mkdir: -p = --parents. No error if dir exists
#        -v = --verbose. print a message for each created directory
MKDIR = mkdir -pv

# rm: -r = --recursive. Remove the contents of dirs recursively
#     -v = --verbose. Explain what is being done
#     -f = --force.Ignore nonexistent files, never prompt
#     --no-preserve-root.
RM = rm -rvf --no-preserve-root

TOP_DIR=.
SRC_DIR = $(TOP_DIR)/src
OBJ_DIR = $(TOP_DIR)/obj
BIN_DIR = $(TOP_DIR)/bin
SYSTEM_DIR = $(TOP_DIR)/../common/system


CC=/home/shemin00/opt/riscv/bin/riscv64-unknown-elf-gcc
CPP=/home/shemin00/opt/riscv/bin/riscv64-unknown-elf-g++
OBJDUMP=/home/shemin00/opt/riscv/bin/riscv64-unknown-elf-objdump
LIB_NAMES=gcc c m

FPU_ENABLED=1

CFLAGS= -c -g -static -std=gnu99 -O0 -fno-common -fno-builtin-printf -DSYS_HZ=40000000 
ifeq ($(FPU_ENABLED), 1)
  CFLAGS += -DFPU_ENABLED -march=rv64g
  # -march=rv64imafd
else
  CFLAGS += -march=rv64imac -mabi=lp64 -march=rv64g
endif

LDFLAGS = -T linkerscript.ld -nostdlib -nostartfiles -march=rv64imafdc_zicsr_zifencei
ifeq ($(FPU_ENABLED), 1)
else
  LDFLAGS += -mabi=lp64 -march=rv64g
  # -march=rv64imac
endif

INCL_KEY=-I
DIR_KEY=-B


# include sub-folders list
INCL_PATH=\
        $(SYSTEM_DIR) \
	$(TOP_DIR)/../common/maps \
        $(TOP_DIR)/../common \
        $(SRC_DIR)


# All of the sources participating in the build are defined here
OBJS_fromC := $(patsubst %,$(OBJ_DIR)/%,$(patsubst $(SRC_DIR)/%.c,%.o,$(wildcard $(SRC_DIR)/*.c)))

OBJS_fromS_in_System := $(patsubst %,$(OBJ_DIR)/%,$(patsubst $(SYSTEM_DIR)/%.S,%.o,$(wildcard $(SYSTEM_DIR)/*.S)))

OBJS_fromS_in_SRC := $(patsubst %,$(OBJ_DIR)/%,$(patsubst $(SRC_DIR)/%.S,%.o,$(wildcard $(SRC_DIR)/*.S)))

COMMONNAME = MyHelloWorld
EXECUTABLE = $(BIN_DIR)/$(COMMONNAME).elf
DUMPFILE = $(BIN_DIR)/$(COMMONNAME).dump
LSTFILE = $(BIN_DIR)/$(COMMONNAME).lst
HEXFILE_HI = $(BIN_DIR)/$(COMMONNAME)_hi.hex
HEXFILE_LO = $(BIN_DIR)/$(COMMONNAME)_lo.hex


#-----------------------------------------------------------------------------
.SILENT:
	TEA = 2>&1 | tee _$@-comp.err


$(COMMONNAME): $(DUMPFILE) $(LSTFILE) $(HEXFILE_HI)

$(DUMPFILE): $(EXECUTABLE)
	echo "Invoking Objdump"
	echo "$(OBJDUMP) -S $< > $@"
	$(OBJDUMP) --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.data $< > $@
	echo "Finished building: $@"
	echo " "

$(LSTFILE): $(EXECUTABLE)
	echo "Invoking Objdump"
	echo "$(OBJDUMP) -S $< > $@"
	$(OBJDUMP) -S $< > $@
	echo "Finished building: $@"
	echo " "

$(HEXFILE_HI): $(EXECUTABLE)
	echo "Invoking elf2rawx"
	echo "elf2rawx $< -h -f 65536 -l 8 -o $(HEXFILE_HI) -o $(HEXFILE_LO)"
	elf2rawx $< -h -f 65536 -l 8 -o $(HEXFILE_HI) -o $(HEXFILE_LO)
	echo "Finished building: $(HEXFILE_HI) $(HEXFILE_LO)"
	echo " "

$(EXECUTABLE): $(OBJS_fromC) $(OBJS_fromS_in_System) $(OBJS_fromS_in_SRC)
	echo "Invoking Linker"
	echo "$(CPP) $(LDFLAGS) $(OBJS_fromC) $(OBJS_fromS_in_System) $(OBJS_fromS_in_SRC) -o $@ $(addprefix -l,$(LIB_NAMES))"
	$(CPP) $(LDFLAGS) $(OBJS_fromC) $(OBJS_fromS_in_System) $(OBJS_fromS_in_SRC) -o $@ $(addprefix -l,$(LIB_NAMES))
	echo "Finished building: $@"
	echo " "

$(OBJS_fromC): $(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(wildcard $(SRC_DIR)/*.h) $(wildcard ../common/*.h) $(wildcard ../common/maps/*.h) $(wildcard ../common/system/*.h)
	echo "Processing file: $<"
	echo "Invoking C Compiler"
	echo "$(CC) $(CFLAGS) $(addprefix $(INCL_KEY),$(INCL_PATH)) $< -o $@"
	$(CC) $(CFLAGS) $(addprefix $(INCL_KEY),$(INCL_PATH)) $< -o $@
	echo "Finished building: $@"
	echo " "

$(OBJS_fromS_in_System): $(OBJ_DIR)/%.o: $(SYSTEM_DIR)/%.S $(wildcard $(SRC_DIR)/*.h) $(wildcard ../common/*.h) $(wildcard ../common/maps/*.h) $(wildcard ../common/system/*.h)
	echo "Processing file: $<"
	echo "Invoking Assembler"
	echo "$(CC) $(CFLAGS) -D__ASSEMBLY__=1 $(addprefix $(INCL_KEY),$(INCL_PATH)) $< -o $@"
	$(CC) $(CFLAGS) -D__ASSEMBLY__=1 $(addprefix $(INCL_KEY),$(INCL_PATH)) $< -o $@
	echo "Finished building: $@"
	echo " "

$(OBJS_fromS_in_SRC): $(OBJ_DIR)/%.o: $(SRC_DIR)/%.S $(wildcard $(SRC_DIR)/*.h) $(wildcard ../common/*.h) $(wildcard ../common/maps/*.h) $(wildcard ../common/system/*.h)
	echo "Processing file: $<"
	echo "Invoking Assembler"
	echo "$(CC) $(CFLAGS) -D__ASSEMBLY__=1 $(addprefix $(INCL_KEY),$(INCL_PATH)) $< -o $@"
	$(CC) $(CFLAGS) -D__ASSEMBLY__=1 $(addprefix $(INCL_KEY),$(INCL_PATH)) $< -o $@
	echo "Finished building: $@"
	echo " "



# Other Targets
clean:
	echo "$(RM) $(OBJS_fromC) $(OBJS_fromS_in_System) $(OBJS_fromS_in_SRC) $(DUMPFILE) $(LSTFILE) $(HEXFILE_HI) $(HEXFILE_LO) $(EXECUTABLE)"
	$(RM) $(OBJS_fromC) $(OBJS_fromS_in_System) $(OBJS_fromS_in_SRC) $(DUMPFILE) $(LSTFILE) $(HEXFILE_HI) $(HEXFILE_LO) $(EXECUTABLE)


.PHONY: all clean
.SECONDARY:

