include ../extra.mk

SHARED_LIB = ${OGJSON_SHARED_LIB}
STATIC_LIB = ${OGJSON_STATIC_LIB}
FRAMEWORK = ${OGJSON_FRAMEWORK}
LIB_MAJOR = 1
LIB_MINOR = 0

SRCS = OGJsonBuilder.m \
	OGJsonGenerator.m \
	OGJsonParser.m \
	OGJsonPath.m \
	OGJsonReader.m \
	

INCLUDES = ${SRCS:.m=.h} \
	OGJson-Umbrella.h

include ../buildsys.mk

LD = ${OBJC}
