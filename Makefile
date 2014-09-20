include Makefile.inc

DIRS	= SOIL
EXE	= a
OBJS	= main.o glm.o imageloader.o md2model.o vec3f.o
OBJLIBS	= libSOIL.a
LIBS	= -L. -lSOIL -lglut -lGL -lGLU -lrt
LDFLAGS = -g

all : $(EXE)

$(EXE) :  $(OBJLIBS) $(OBJS)
	$(ECHO) $(LD) -o $(EXE) $(OBJS) $(LIBS)
	$(LD) $(LDFLAGS) -o $(EXE) $(OBJS) $(LIBS)

libSOIL.a : force_look
	$(ECHO) looking into SOIL : $(MAKE) $(MFLAGS)
	cd SOIL; $(MAKE) $(MFLAGS)


clean :
	$(ECHO) cleaning up in .
	-$(RM) -f $(EXE) $(OBJS) $(OBJLIBS)
	-for d in $(DIRS); do (cd $$d; $(MAKE) clean ); done

force_look :
	true

