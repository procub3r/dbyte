nasm -fbin -Isrc/ src/dbyte.asm -o bin/dbyte.img
qemu-system-x86_64 -drive format=raw,file=bin/dbyte.img
