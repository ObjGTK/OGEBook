/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFolderSummary.h"

#import "OGCamelMessageInfo.h"
#import "OGCamelMimeMessage.h"
#import "OGCamelFolder.h"
#import "OGCamelIndex.h"
#import "OGCamelMimeParser.h"
#import "OGCamelStore.h"

@implementation OGCamelFolderSummary

+ (void)freeArray:(GPtrArray*)array
{
	camel_folder_summary_free_array(array);
}

- (instancetype)init:(OGCamelFolder*)folder
{
	CamelFolderSummary* gobjectValue = CAMEL_FOLDER_SUMMARY(camel_folder_summary_new([folder castedGObject]));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (CamelFolderSummary*)castedGObject
{
	return CAMEL_FOLDER_SUMMARY([self gObject]);
}

- (void)addWithInfo:(OGCamelMessageInfo*)info forceKeepUid:(bool)forceKeepUid
{
	camel_folder_summary_add([self castedGObject], [info castedGObject], forceKeepUid);
}

- (bool)checkUid:(OFString*)uid
{
	bool returnValue = camel_folder_summary_check_uid([self castedGObject], [uid UTF8String]);

	return returnValue;
}

- (bool)clear
{
	GError* err = NULL;

	bool returnValue = camel_folder_summary_clear([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (guint)count
{
	guint returnValue = camel_folder_summary_count([self castedGObject]);

	return returnValue;
}

- (OGCamelMessageInfo*)get:(OFString*)uid
{
	CamelMessageInfo* gobjectValue = CAMEL_MESSAGE_INFO(camel_folder_summary_get([self castedGObject], [uid UTF8String]));

	OGCamelMessageInfo* returnValue = [OGCamelMessageInfo wrapperFor:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GPtrArray*)array
{
	GPtrArray* returnValue = camel_folder_summary_get_array([self castedGObject]);

	return returnValue;
}

- (GPtrArray*)changed
{
	GPtrArray* returnValue = camel_folder_summary_get_changed([self castedGObject]);

	return returnValue;
}

- (guint32)deletedCount
{
	guint32 returnValue = camel_folder_summary_get_deleted_count([self castedGObject]);

	return returnValue;
}

- (guint32)flags
{
	guint32 returnValue = camel_folder_summary_get_flags([self castedGObject]);

	return returnValue;
}

- (OGCamelFolder*)folder
{
	CamelFolder* gobjectValue = CAMEL_FOLDER(camel_folder_summary_get_folder([self castedGObject]));

	OGCamelFolder* returnValue = [OGCamelFolder wrapperFor:gobjectValue];
	return returnValue;
}

- (GHashTable*)hash
{
	GHashTable* returnValue = camel_folder_summary_get_hash([self castedGObject]);

	return returnValue;
}

- (OGCamelIndex*)index
{
	CamelIndex* gobjectValue = CAMEL_INDEX(camel_folder_summary_get_index([self castedGObject]));

	OGCamelIndex* returnValue = [OGCamelIndex wrapperFor:gobjectValue];
	return returnValue;
}

- (guint32)infoFlags:(OFString*)uid
{
	guint32 returnValue = camel_folder_summary_get_info_flags([self castedGObject], [uid UTF8String]);

	return returnValue;
}

- (guint32)junkCount
{
	guint32 returnValue = camel_folder_summary_get_junk_count([self castedGObject]);

	return returnValue;
}

- (guint32)junkNotDeletedCount
{
	guint32 returnValue = camel_folder_summary_get_junk_not_deleted_count([self castedGObject]);

	return returnValue;
}

- (guint32)nextUid
{
	guint32 returnValue = camel_folder_summary_get_next_uid([self castedGObject]);

	return returnValue;
}

- (guint32)savedCount
{
	guint32 returnValue = camel_folder_summary_get_saved_count([self castedGObject]);

	return returnValue;
}

- (gint64)timestamp
{
	gint64 returnValue = camel_folder_summary_get_timestamp([self castedGObject]);

	return returnValue;
}

- (guint32)unreadCount
{
	guint32 returnValue = camel_folder_summary_get_unread_count([self castedGObject]);

	return returnValue;
}

- (guint32)version
{
	guint32 returnValue = camel_folder_summary_get_version([self castedGObject]);

	return returnValue;
}

- (guint32)visibleCount
{
	guint32 returnValue = camel_folder_summary_get_visible_count([self castedGObject]);

	return returnValue;
}

- (bool)headerLoadWithStore:(OGCamelStore*)store folderName:(OFString*)folderName
{
	GError* err = NULL;

	bool returnValue = camel_folder_summary_header_load([self castedGObject], [store castedGObject], [folderName UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)headerSave
{
	GError* err = NULL;

	bool returnValue = camel_folder_summary_header_save([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OGCamelMessageInfo*)infoNewFromHeaders:(const CamelNameValueArray*)headers
{
	CamelMessageInfo* gobjectValue = CAMEL_MESSAGE_INFO(camel_folder_summary_info_new_from_headers([self castedGObject], headers));

	OGCamelMessageInfo* returnValue = [OGCamelMessageInfo wrapperFor:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelMessageInfo*)infoNewFromMessage:(OGCamelMimeMessage*)message
{
	CamelMessageInfo* gobjectValue = CAMEL_MESSAGE_INFO(camel_folder_summary_info_new_from_message([self castedGObject], [message castedGObject]));

	OGCamelMessageInfo* returnValue = [OGCamelMessageInfo wrapperFor:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelMessageInfo*)infoNewFromParser:(OGCamelMimeParser*)parser
{
	CamelMessageInfo* gobjectValue = CAMEL_MESSAGE_INFO(camel_folder_summary_info_new_from_parser([self castedGObject], [parser castedGObject]));

	OGCamelMessageInfo* returnValue = [OGCamelMessageInfo wrapperFor:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)load
{
	GError* err = NULL;

	bool returnValue = camel_folder_summary_load([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)lock
{
	camel_folder_summary_lock([self castedGObject]);
}

- (guint32)nextUid
{
	guint32 returnValue = camel_folder_summary_next_uid([self castedGObject]);

	return returnValue;
}

- (OFString*)nextUidString
{
	gchar* gobjectValue = camel_folder_summary_next_uid_string([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OGCamelMessageInfo*)peekLoaded:(OFString*)uid
{
	CamelMessageInfo* gobjectValue = CAMEL_MESSAGE_INFO(camel_folder_summary_peek_loaded([self castedGObject], [uid UTF8String]));

	OGCamelMessageInfo* returnValue = [OGCamelMessageInfo wrapperFor:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)prepareFetchAll
{
	GError* err = NULL;

	camel_folder_summary_prepare_fetch_all([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (bool)remove:(OGCamelMessageInfo*)info
{
	bool returnValue = camel_folder_summary_remove([self castedGObject], [info castedGObject]);

	return returnValue;
}

- (bool)removeUid:(OFString*)uid
{
	bool returnValue = camel_folder_summary_remove_uid([self castedGObject], [uid UTF8String]);

	return returnValue;
}

- (bool)removeUids:(GList*)uids
{
	bool returnValue = camel_folder_summary_remove_uids([self castedGObject], uids);

	return returnValue;
}

- (bool)replaceFlags:(OGCamelMessageInfo*)info
{
	bool returnValue = camel_folder_summary_replace_flags([self castedGObject], [info castedGObject]);

	return returnValue;
}

- (bool)save
{
	GError* err = NULL;

	bool returnValue = camel_folder_summary_save([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setFlags:(guint32)flags
{
	camel_folder_summary_set_flags([self castedGObject], flags);
}

- (void)setIndex:(OGCamelIndex*)index
{
	camel_folder_summary_set_index([self castedGObject], [index castedGObject]);
}

- (void)setNextUid:(guint32)uid
{
	camel_folder_summary_set_next_uid([self castedGObject], uid);
}

- (void)setTimestamp:(gint64)timestamp
{
	camel_folder_summary_set_timestamp([self castedGObject], timestamp);
}

- (void)setVersion:(guint32)version
{
	camel_folder_summary_set_version([self castedGObject], version);
}

- (void)touch
{
	camel_folder_summary_touch([self castedGObject]);
}

- (void)unlock
{
	camel_folder_summary_unlock([self castedGObject]);
}


@end