
OBJECTS = Console.o main.o

CC = g++
CFLAGS = -std=c++0x

pokeredwavptnvis: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o "../../extras/pokeredwavptnvis.exe"

Console.o: Console.h
	$(CC) $(CFLAGS) -c Console.cpp

main.o: main.cpp Console.h
	$(CC) $(CFLAGS) -c main.cpp Console.cpp

clean:
	rm *.o
	rm ../../extras/pokeredwavptnvis.exe
