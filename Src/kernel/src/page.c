// #include "../inc/page.h"

// extern void loadPageDirectory(unsigned int*);
// extern void enablePaging();
// void initialize_paging() {
//     for(int i = 0; i < 1024; i++)
//     {
//         // This sets the following flags to the pages:
//         //   Supervisor: Only kernel-mode can access them
//         //   Write Enabled: It can be both read from and written to
//         //   Not Present: The page table is not present
//         page_directory[i] = 0x00000002;
//     }
//     for(int i = 0; i < 1024; i++)
//     {
//         // As the address is page aligned, it will always leave 12 bits zeroed.
//         // Those bits are used by the attributes ;)
//         first_page_table[i] = (i * 0x1000) | 3; // attributes: supervisor level, read/write, present.
//     }

//     page_directory[0] = ((unsigned int) first_page_table) | 3;

//     loadPageDirectory(page_directory);
//     enablePaging();
// }