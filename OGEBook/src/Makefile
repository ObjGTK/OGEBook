include ../extra.mk

SHARED_LIB = ${OGEBOOK_SHARED_LIB}
STATIC_LIB = ${OGEBOOK_STATIC_LIB}
FRAMEWORK = ${OGEBOOK_FRAMEWORK}
LIB_MAJOR = 1
LIB_MINOR = 2

SRCS = OGEBookClient.m \
	OGEBookClientCursor.m \
	OGEBookClientView.m \
	OGEDestination.m \
	

INCLUDES = ${SRCS:.m=.h} \
	OGEBook-Umbrella.h

include ../buildsys.mk

LD = ${OBJC}
