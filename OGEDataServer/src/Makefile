include ../extra.mk

SHARED_LIB = ${OGEDATASERVER_SHARED_LIB}
STATIC_LIB = ${OGEDATASERVER_STATIC_LIB}
FRAMEWORK = ${OGEDATASERVER_FRAMEWORK}
LIB_MAJOR = 1
LIB_MINOR = 2

SRCS = OGEClient.m \
	OGEExtension.m \
	OGEGDataSession.m \
	OGENetworkMonitor.m \
	OGEOAuth2ServiceBase.m \
	OGEOAuth2ServiceGoogle.m \
	OGEOAuth2ServiceOutlook.m \
	OGEOAuth2ServiceYahoo.m \
	OGEOAuth2Services.m \
	OGESource.m \
	OGESourceAddressBook.m \
	OGESourceAlarms.m \
	OGESourceAuthentication.m \
	OGESourceAutocomplete.m \
	OGESourceAutoconfig.m \
	OGESourceBackend.m \
	OGESourceCalendar.m \
	OGESourceCamel.m \
	OGESourceCollection.m \
	OGESourceContacts.m \
	OGESourceCredentialsProvider.m \
	OGESourceCredentialsProviderImpl.m \
	OGESourceCredentialsProviderImplOAuth2.m \
	OGESourceCredentialsProviderImplPassword.m \
	OGESourceExtension.m \
	OGESourceGoa.m \
	OGESourceLDAP.m \
	OGESourceLocal.m \
	OGESourceMDN.m \
	OGESourceMailAccount.m \
	OGESourceMailComposition.m \
	OGESourceMailIdentity.m \
	OGESourceMailSignature.m \
	OGESourceMailSubmission.m \
	OGESourceMailTransport.m \
	OGESourceMemoList.m \
	OGESourceOffline.m \
	OGESourceOpenPGP.m \
	OGESourceProxy.m \
	OGESourceRefresh.m \
	OGESourceRegistry.m \
	OGESourceRegistryWatcher.m \
	OGESourceResource.m \
	OGESourceRevisionGuards.m \
	OGESourceSMIME.m \
	OGESourceSecurity.m \
	OGESourceSelectable.m \
	OGESourceTaskList.m \
	OGESourceUoa.m \
	OGESourceWeather.m \
	OGESourceWebDAVNotes.m \
	OGESourceWebdav.m \
	OGESoupSession.m \
	OGESoupAuthBearer.m \
	OGEWebDAVSession.m \
	OGEXmlDocument.m \
	

INCLUDES = ${SRCS:.m=.h} \
	OGEDataServer-Umbrella.h

include ../buildsys.mk

LD = ${OBJC}
