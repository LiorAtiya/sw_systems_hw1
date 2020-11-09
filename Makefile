CC=gcc
AR=ar
FLAGS= -Wall -g

all: libmyMath.so libmyMath.a mains maind
mains: main.o libmyMath.a
	$(CC) $(FLAGS) -o mains main.o libmyMath.a

maind: main.o
	$(CC) $(FLAGS) -o maind main.o ./libmyMath.so

libmyMath.a: basicMath.o power.o
			$(AR) -rcs libmyMath.a basicMath.o power.o

libmyMath.so: basicMath.o power.o
			$(CC) -shared -o libmyMath.so basicMath.o power.o

main.o: main.c myMath.h
	$(CC) $(FLAGS) -c main.c

basicMath.o: basicMath.c myMath.h
			$(CC) $(FLAGS) -c basicMath.c

power.o: power.c myMath.h
		$(CC) $(FLAGS) -c power.c

clean:
	rm -f *.o *.a *.so mains maind