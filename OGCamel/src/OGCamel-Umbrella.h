/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import <ObjFW/ObjFW.h>


// Generated classes
#import "OGCamelAddress.h"
#import "OGCamelBlockFile.h"
#import "OGCamelCertDB.h"
#import "OGCamelCipherContext.h"
#import "OGCamelDB.h"
#import "OGCamelDataCache.h"
#import "OGCamelDataWrapper.h"
#import "OGCamelFilterDriver.h"
#import "OGCamelFilterInputStream.h"
#import "OGCamelFilterOutputStream.h"
#import "OGCamelFolder.h"
#import "OGCamelFolderSearch.h"
#import "OGCamelFolderSummary.h"
#import "OGCamelGpgContext.h"
#import "OGCamelHTMLParser.h"
#import "OGCamelIndex.h"
#import "OGCamelIndexCursor.h"
#import "OGCamelIndexName.h"
#import "OGCamelInternetAddress.h"
#import "OGCamelKeyFile.h"
#import "OGCamelKeyTable.h"
#import "OGCamelLocalSettings.h"
#import "OGCamelMedium.h"
#import "OGCamelMessageInfo.h"
#import "OGCamelMessageInfoBase.h"
#import "OGCamelMimeFilter.h"
#import "OGCamelMimeFilterBasic.h"
#import "OGCamelMimeFilterBestenc.h"
#import "OGCamelMimeFilterCRLF.h"
#import "OGCamelMimeFilterCanon.h"
#import "OGCamelMimeFilterCharset.h"
#import "OGCamelMimeFilterEnriched.h"
#import "OGCamelMimeFilterFrom.h"
#import "OGCamelMimeFilterGZip.h"
#import "OGCamelMimeFilterHTML.h"
#import "OGCamelMimeFilterIndex.h"
#import "OGCamelMimeFilterLinewrap.h"
#import "OGCamelMimeFilterPgp.h"
#import "OGCamelMimeFilterProgress.h"
#import "OGCamelMimeFilterToHTML.h"
#import "OGCamelMimeFilterWindows.h"
#import "OGCamelMimeFilterYenc.h"
#import "OGCamelMimeMessage.h"
#import "OGCamelMimeParser.h"
#import "OGCamelMimePart.h"
#import "OGCamelMultipart.h"
#import "OGCamelMultipartEncrypted.h"
#import "OGCamelMultipartSigned.h"
#import "OGCamelNNTPAddress.h"
#import "OGCamelNullOutputStream.h"
#import "OGCamelObject.h"
#import "OGCamelOfflineFolder.h"
#import "OGCamelOfflineSettings.h"
#import "OGCamelOfflineStore.h"
#import "OGCamelOperation.h"
#import "OGCamelPartitionTable.h"
#import "OGCamelSExp.h"
#import "OGCamelSMIMEContext.h"
#import "OGCamelSasl.h"
#import "OGCamelSaslAnonymous.h"
#import "OGCamelSaslCramMd5.h"
#import "OGCamelSaslDigestMd5.h"
#import "OGCamelSaslGssapi.h"
#import "OGCamelSaslLogin.h"
#import "OGCamelSaslNTLM.h"
#import "OGCamelSaslPOPB4SMTP.h"
#import "OGCamelSaslPlain.h"
#import "OGCamelSaslXOAuth2.h"
#import "OGCamelSaslXOAuth2Google.h"
#import "OGCamelSaslXOAuth2Outlook.h"
#import "OGCamelSaslXOAuth2Yahoo.h"
#import "OGCamelService.h"
#import "OGCamelSession.h"
#import "OGCamelSettings.h"
#import "OGCamelStore.h"
#import "OGCamelStoreSettings.h"
#import "OGCamelStoreSummary.h"
#import "OGCamelStream.h"
#import "OGCamelStreamBuffer.h"
#import "OGCamelStreamFilter.h"
#import "OGCamelStreamFs.h"
#import "OGCamelStreamMem.h"
#import "OGCamelStreamNull.h"
#import "OGCamelStreamProcess.h"
#import "OGCamelTextIndex.h"
#import "OGCamelTextIndexCursor.h"
#import "OGCamelTextIndexKeyCursor.h"
#import "OGCamelTextIndexName.h"
#import "OGCamelTransport.h"
#import "OGCamelVTrashFolder.h"
#import "OGCamelVeeDataCache.h"
#import "OGCamelVeeFolder.h"
#import "OGCamelVeeMessageInfo.h"
#import "OGCamelVeeMessageInfoData.h"
#import "OGCamelVeeStore.h"
#import "OGCamelVeeSubfolderData.h"
#import "OGCamelVeeSummary.h"
