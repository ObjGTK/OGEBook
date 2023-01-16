include ../extra.mk

SHARED_LIB = ${OGCAMEL_SHARED_LIB}
STATIC_LIB = ${OGCAMEL_STATIC_LIB}
FRAMEWORK = ${OGCAMEL_FRAMEWORK}
LIB_MAJOR = 1
LIB_MINOR = 2

SRCS = OGCamelAddress.m \
	OGCamelBlockFile.m \
	OGCamelCertDB.m \
	OGCamelCipherContext.m \
	OGCamelDB.m \
	OGCamelDataCache.m \
	OGCamelDataWrapper.m \
	OGCamelFilterDriver.m \
	OGCamelFilterInputStream.m \
	OGCamelFilterOutputStream.m \
	OGCamelFolder.m \
	OGCamelFolderSearch.m \
	OGCamelFolderSummary.m \
	OGCamelGpgContext.m \
	OGCamelHTMLParser.m \
	OGCamelIndex.m \
	OGCamelIndexCursor.m \
	OGCamelIndexName.m \
	OGCamelInternetAddress.m \
	OGCamelKeyFile.m \
	OGCamelKeyTable.m \
	OGCamelLocalSettings.m \
	OGCamelMedium.m \
	OGCamelMessageInfo.m \
	OGCamelMessageInfoBase.m \
	OGCamelMimeFilter.m \
	OGCamelMimeFilterBasic.m \
	OGCamelMimeFilterBestenc.m \
	OGCamelMimeFilterCRLF.m \
	OGCamelMimeFilterCanon.m \
	OGCamelMimeFilterCharset.m \
	OGCamelMimeFilterEnriched.m \
	OGCamelMimeFilterFrom.m \
	OGCamelMimeFilterGZip.m \
	OGCamelMimeFilterHTML.m \
	OGCamelMimeFilterIndex.m \
	OGCamelMimeFilterLinewrap.m \
	OGCamelMimeFilterPgp.m \
	OGCamelMimeFilterProgress.m \
	OGCamelMimeFilterToHTML.m \
	OGCamelMimeFilterWindows.m \
	OGCamelMimeFilterYenc.m \
	OGCamelMimeMessage.m \
	OGCamelMimeParser.m \
	OGCamelMimePart.m \
	OGCamelMultipart.m \
	OGCamelMultipartEncrypted.m \
	OGCamelMultipartSigned.m \
	OGCamelNNTPAddress.m \
	OGCamelNullOutputStream.m \
	OGCamelObject.m \
	OGCamelOfflineFolder.m \
	OGCamelOfflineSettings.m \
	OGCamelOfflineStore.m \
	OGCamelOperation.m \
	OGCamelPartitionTable.m \
	OGCamelSExp.m \
	OGCamelSMIMEContext.m \
	OGCamelSasl.m \
	OGCamelSaslAnonymous.m \
	OGCamelSaslCramMd5.m \
	OGCamelSaslDigestMd5.m \
	OGCamelSaslGssapi.m \
	OGCamelSaslLogin.m \
	OGCamelSaslNTLM.m \
	OGCamelSaslPOPB4SMTP.m \
	OGCamelSaslPlain.m \
	OGCamelSaslXOAuth2.m \
	OGCamelSaslXOAuth2Google.m \
	OGCamelSaslXOAuth2Outlook.m \
	OGCamelService.m \
	OGCamelSession.m \
	OGCamelSettings.m \
	OGCamelStore.m \
	OGCamelStoreSettings.m \
	OGCamelStoreSummary.m \
	OGCamelStream.m \
	OGCamelStreamBuffer.m \
	OGCamelStreamFilter.m \
	OGCamelStreamFs.m \
	OGCamelStreamMem.m \
	OGCamelStreamNull.m \
	OGCamelStreamProcess.m \
	OGCamelTextIndex.m \
	OGCamelTextIndexCursor.m \
	OGCamelTextIndexKeyCursor.m \
	OGCamelTextIndexName.m \
	OGCamelTransport.m \
	OGCamelVTrashFolder.m \
	OGCamelVeeDataCache.m \
	OGCamelVeeFolder.m \
	OGCamelVeeMessageInfo.m \
	OGCamelVeeMessageInfoData.m \
	OGCamelVeeStore.m \
	OGCamelVeeSubfolderData.m \
	OGCamelVeeSummary.m \
	

INCLUDES = ${SRCS:.m=.h} \
	OGCamel-Umbrella.h

include ../buildsys.mk

LD = ${OBJC}
