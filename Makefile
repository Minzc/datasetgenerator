HFILES1 = glob.h dist.h
HFILES2 = gen.h

CFILES1 =  ran1.c expdev.c gammln.c gasdev.c poidev.c dist.c
CFILES2 =  gen.c main.c command.c

OBJECTS1 = ran1.o expdev.o gammln.o gasdev.o poidev.o dist.o
OBJECTS2 = gen.o main.o command.o

LIBES = -lm
CC = g++-4.9
CFLAGS = -ansi -std=c++11 -fabi-version=6 -Ofast -pipe -march=native -mtune=native -Wextra -Wall -Wshadow -Wstrict-aliasing=1 -Werror -pedantic-errors

EXEC = gen 

default: $(EXEC)

gen:	$(OBJECTS1) $(OBJECTS2)
	$(CC) $(CFLAGS) $(OBJECTS1) $(OBJECTS2) $(LIBES) -o gen

test:	$(OBJECTS1) test.o
	$(CC) $(CFLAGS) $(OBJECTS1) test.o $(LIBES) -o test

mrproper:
	/bin/rm -f $(OBJECTS1) $(OBJECTS2) $(EXEC)

clean:
	/bin/rm -f $(OBJECTS1) $(OBJECTS2)

$(OBJECTS1): $(HFILES1)
$(OBJECTS2): $(HFILES1) $(HFILES2)

