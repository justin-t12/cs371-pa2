CC = gcc
CFLAGS = -pthread -Wall -Wextra -Werror -fanalyzer -O2
SOURCES = pa2_task1.c pa2_task2.c
EXECUTABLES = pa2_task1 pa2_task2

all: $(EXECUTABLES)

pa2_task1: pa2_task1.o
	$(CC) $(CFLAGS) -o $@ $<

pa2_task2: pa2_task2.o
	$(CC) $(CFLAGS) -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

debug: CFLAGS += -g -DDEBUG
debug: CFLAGS := $(filter-out -O2,$(CFLAGS))
debug: clean all

clean:
	rm -f $(EXECUTABLES) *.o
