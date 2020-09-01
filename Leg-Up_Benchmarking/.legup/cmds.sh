g++ -g -pg -I/cygdrive/c/LegUp-7.5/legup/legup-library  -I/cygdrive/c/LegUp-7.5/legup/examples/../dependencies/include -I/cygdrive/c/LegUp-7.5/legup/examples/../dependencies/gcc/include/c++/5.4.0 -I/cygdrive/c/LegUp-7.5/legup/examples/../dependencies/gcc/include/c++/5.4.0/x86_64-unknown-linux-gnu/ -DLEGUP_SW -O3 -pg -Wall -Wno-strict-aliasing -Wno-unused-label -Wno-unknown-pragmas -Wno-attributes -Werror=implicit-function-declaration  \
     cpu.c   \
-Wno-attributes \
-Wno-unknown-pragmas \
-I/cygdrive/c/LegUp-7.5/legup/legup-library \
-L/cygdrive/c/LegUp-7.5/legup/legup-library/legup -llegup \
-o CPU_Benchmarking.sw_binary \
-fopenmp -pthread -lm -lrt
