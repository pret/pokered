
OBJECTS = main.o Jump.o Modulation.o Note.o Octave.o Parser.o Stop.o \
Tempo.o UnkCode.o UnkEB.o Velocity.o Volume.o Console.o AbstractData.o Call.o \
Duty.o args.o

CC = g++
CFLAGS = -std=c++0x

pokeredmusicdisasm: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o "../../extras/pokeredmusicdisasm.exe"

Parser.o: Jump.h Modulation.h Note.h Octave.h Parser.h Stop.h \
Tempo.h UnkCode.h UnkEB.h Velocity.h Volume.h
	$(CC) $(CFLAGS) -c main.cpp Jump.cpp Modulation.cpp \
Note.cpp Octave.cpp Parser.cpp Stop.cpp Tempo.cpp UnkCode.cpp UnkEB.cpp \
Velocity.cpp Volume.cpp

Duty.o: Duty.h AbstractData.h
	$(CC) $(CFLAGS) -c Duty.cpp AbstractData.cpp

Console.o: Console.h
	$(CC) $(CFLAGS) -c Console.cpp

AbstractData.o: AbstractData.h
	$(CC) $(CFLAGS) -c AbstractData.cpp

Call.o: Call.h Call.cpp AbstractData.h
	$(CC) $(CFLAGS) -c Call.cpp AbstractData.cpp

main.o: main.cpp Console.h Parser.h args.h
	$(CC) $(CFLAGS) -c main.cpp Console.cpp Parser.cpp args.cpp

Jump.o: Jump.h AbstractData.h
	$(CC) $(CFLAGS) -c Jump.cpp AbstractData.cpp

Modulation.o: Modulation.h AbstractData.h
	$(CC) $(CFLAGS) -c Modulation.cpp AbstractData.cpp

Note.o: Note.h AbstractData.h
	$(CC) $(CFLAGS) -c Note.cpp AbstractData.cpp

Octave.o: Octave.h AbstractData.h
	$(CC) $(CFLAGS) -c Octave.cpp AbstractData.cpp

Stop.o: Stop.h AbstractData.h
	$(CC) $(CFLAGS) -c Stop.cpp AbstractData.cpp

Tempo.o: Tempo.h AbstractData.h
	$(CC) $(CFLAGS) -c Tempo.cpp AbstractData.cpp

UnkCode.o: UnkCode.h AbstractData.h
	$(CC) $(CFLAGS) -c UnkCode.cpp AbstractData.cpp

UnkEB.o: UnkEB.h AbstractData.h
	$(CC) $(CFLAGS) -c UnkEB.cpp AbstractData.cpp

Velocity.o: Velocity.h AbstractData.h
	$(CC) $(CFLAGS) -c Velocity.cpp AbstractData.cpp

Volume.o: Volume.h AbstractData.h
	$(CC) $(CFLAGS) -c Volume.cpp AbstractData.cpp

args.o: args.h
	$(CC) $(CFLAGS) -c args.cpp
	
clean:
	rm *.o
	rm ../../extras/pokeredmusicdisasm.exe
