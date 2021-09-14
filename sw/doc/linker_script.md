1. To generate the linker script needed to build bare metal application execute:

```
riscv64-unknown-elf-ld --verbose >> riscv.ld
```

2. Put in comments the lines in the start of the file

```
/*
GNU ld (GNU Binutils) 2.36.1
  Émulations prises en charge :
   elf64lriscv
   elf32lriscv
   elf64briscv
   elf32briscv
utilisation du script interne d'édition de liens :
==================================================
*/
 ...
```
and at the end of the file

```
  ...
 /* DWARF 5.  */
  .debug_addr     0 : { *(.debug_addr) }
  .debug_line_str 0 : { *(.debug_line_str) }
  .debug_loclists 0 : { *(.debug_loclists) }
  .debug_macro    0 : { *(.debug_macro) }
  .debug_names    0 : { *(.debug_names) }
  .debug_rnglists 0 : { *(.debug_rnglists) }
  .debug_str_offsets 0 : { *(.debug_str_offsets) }
  .debug_sup      0 : { *(.debug_sup) }
  .gnu.attributes 0 : { KEEP (*(.gnu.attributes)) }
  /DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) }
}


/*
==================================================
*/
```

3. Replace 
 ```
 OUTPUT_FORMAT("elf64-littleriscv", "elf64-littleriscv",
	      "elf64-littleriscv")
```
 with
 ```
 OUTPUT_FORMAT("elf32-littleriscv", "elf32-littleriscv",
	      "elf32-littleriscv")
 ```

4. Between SEARCH_DIR and SECTIONS add in the file

```
MEMORY {
  RAM      (rwx): ORIGIN = 0x00000000, LENGTH = 128k
}
```

Adjust ORIGIN and LENGTH to your requirements. TODO: explain why this is added

5. Adjust SEGMENT_START address. Default is 0x10000. I set this to 0x00000


```
/* Read-only sections, merged into text segment: */
  PROVIDE (__executable_start = SEGMENT_START("text-segment", 0x00000)); . = SEGMENT_START("text-segment", 0x00000) + SIZEOF_HEADERS;
```