#include <inttypes.h>
#include <string.h>
#include <stdio.h>
#include "../../common/axi_maps.h"
#include "../../common/encoding.h"
#include "../../bootrom_tests/src/fw_api.h"
#include "../../bootrom_tests/src/test_fpu.h"

void helloWorld();

void print_uart(const char *buf, int sz);

char *sbrk(int incr);
