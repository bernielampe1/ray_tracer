CC = g++

CPPFLAGS = -O3 $(INCLUDES) -Wall

LIBS = -lpng

OBJS = srtmain.o raytracer.o scene.o loadscene.o

all : rt

clean : 
	rm -f rt *.o

loadscene.o: mesh.h ball.h triangle.h camera.h

srtmain.o: srtmain.cpp scene.h raytracer.h

raytracer.o: raytracer.cpp raytracer.h camera.h scene.h

rt : $(OBJS)
	$(CC) -o $@ $(COPTS) $(OBJS) $(LIBS)

