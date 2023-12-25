#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

uint32_t page_directory[1024] __attribute__((aligned(4096)));
uint32_t first_page_table[1024] __attribute__((aligned(4096)));