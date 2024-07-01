include ../extra.mk

SHARED_LIB = ${OGEBOOKCONTACTS_SHARED_LIB}
STATIC_LIB = ${OGEBOOKCONTACTS_STATIC_LIB}
FRAMEWORK = ${OGEBOOKCONTACTS_FRAMEWORK}
LIB_MAJOR = 1
LIB_MINOR = 2

SRCS = OGEContact.m \
	OGESourceBackendSummarySetup.m \
	OGEVCard.m \
	

INCLUDES = ${SRCS:.m=.h} \
	OGEBookContacts-Umbrella.h

include ../buildsys.mk

LD = ${OBJC}
