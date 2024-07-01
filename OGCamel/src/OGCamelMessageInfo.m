/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMessageInfo.h"

#import "OGCamelFolderSummary.h"

@implementation OGCamelMessageInfo

- (instancetype)init:(OGCamelFolderSummary*)summary
{
	CamelMessageInfo* gobjectValue = CAMEL_MESSAGE_INFO(camel_message_info_new([summary castedGObject]));

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

- (instancetype)initFromHeadersWithSummary:(OGCamelFolderSummary*)summary headers:(const CamelNameValueArray*)headers
{
	CamelMessageInfo* gobjectValue = CAMEL_MESSAGE_INFO(camel_message_info_new_from_headers([summary castedGObject], headers));

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

- (CamelMessageInfo*)castedGObject
{
	return CAMEL_MESSAGE_INFO([self gObject]);
}

- (OGCamelMessageInfo*)clone:(OGCamelFolderSummary*)assignSummary
{
	CamelMessageInfo* gobjectValue = CAMEL_MESSAGE_INFO(camel_message_info_clone([self castedGObject], [assignSummary castedGObject]));

	OGCamelMessageInfo* returnValue = [OGCamelMessageInfo withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)dump
{
	camel_message_info_dump([self castedGObject]);
}

- (CamelNameValueArray*)dupHeaders
{
	CamelNameValueArray* returnValue = camel_message_info_dup_headers([self castedGObject]);

	return returnValue;
}

- (OFString*)dupPreview
{
	gchar* gobjectValue = camel_message_info_dup_preview([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (GArray*)dupReferences
{
	GArray* returnValue = camel_message_info_dup_references([self castedGObject]);

	return returnValue;
}

- (CamelNamedFlags*)dupUserFlags
{
	CamelNamedFlags* returnValue = camel_message_info_dup_user_flags([self castedGObject]);

	return returnValue;
}

- (OFString*)dupUserHeader:(OFString*)name
{
	gchar* gobjectValue = camel_message_info_dup_user_header([self castedGObject], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (CamelNameValueArray*)dupUserHeaders
{
	CamelNameValueArray* returnValue = camel_message_info_dup_user_headers([self castedGObject]);

	return returnValue;
}

- (OFString*)dupUserTag:(OFString*)name
{
	gchar* gobjectValue = camel_message_info_dup_user_tag([self castedGObject], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (CamelNameValueArray*)dupUserTags
{
	CamelNameValueArray* returnValue = camel_message_info_dup_user_tags([self castedGObject]);

	return returnValue;
}

- (void)freezeNotifications
{
	camel_message_info_freeze_notifications([self castedGObject]);
}

- (bool)abortNotifications
{
	bool returnValue = camel_message_info_get_abort_notifications([self castedGObject]);

	return returnValue;
}

- (OFString*)cc
{
	const gchar* gobjectValue = camel_message_info_get_cc([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (gint64)dateReceived
{
	gint64 returnValue = camel_message_info_get_date_received([self castedGObject]);

	return returnValue;
}

- (gint64)dateSent
{
	gint64 returnValue = camel_message_info_get_date_sent([self castedGObject]);

	return returnValue;
}

- (bool)dirty
{
	bool returnValue = camel_message_info_get_dirty([self castedGObject]);

	return returnValue;
}

- (guint32)flags
{
	guint32 returnValue = camel_message_info_get_flags([self castedGObject]);

	return returnValue;
}

- (bool)folderFlagged
{
	bool returnValue = camel_message_info_get_folder_flagged([self castedGObject]);

	return returnValue;
}

- (guint)folderFlaggedStamp
{
	guint returnValue = camel_message_info_get_folder_flagged_stamp([self castedGObject]);

	return returnValue;
}

- (OFString*)from
{
	const gchar* gobjectValue = camel_message_info_get_from([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const CamelNameValueArray*)headers
{
	const CamelNameValueArray* returnValue = camel_message_info_get_headers([self castedGObject]);

	return returnValue;
}

- (guint64)messageId
{
	guint64 returnValue = camel_message_info_get_message_id([self castedGObject]);

	return returnValue;
}

- (OFString*)mlist
{
	const gchar* gobjectValue = camel_message_info_get_mlist([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)notificationsFrozen
{
	bool returnValue = camel_message_info_get_notifications_frozen([self castedGObject]);

	return returnValue;
}

- (OFString*)preview
{
	const gchar* gobjectValue = camel_message_info_get_preview([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const GArray*)references
{
	const GArray* returnValue = camel_message_info_get_references([self castedGObject]);

	return returnValue;
}

- (guint32)size
{
	guint32 returnValue = camel_message_info_get_size([self castedGObject]);

	return returnValue;
}

- (OFString*)subject
{
	const gchar* gobjectValue = camel_message_info_get_subject([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)to
{
	const gchar* gobjectValue = camel_message_info_get_to([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)uid
{
	const gchar* gobjectValue = camel_message_info_get_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)userFlag:(OFString*)name
{
	bool returnValue = camel_message_info_get_user_flag([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (const CamelNamedFlags*)userFlags
{
	const CamelNamedFlags* returnValue = camel_message_info_get_user_flags([self castedGObject]);

	return returnValue;
}

- (OFString*)userHeader:(OFString*)name
{
	const gchar* gobjectValue = camel_message_info_get_user_header([self castedGObject], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const CamelNameValueArray*)userHeaders
{
	const CamelNameValueArray* returnValue = camel_message_info_get_user_headers([self castedGObject]);

	return returnValue;
}

- (OFString*)userTag:(OFString*)name
{
	const gchar* gobjectValue = camel_message_info_get_user_tag([self castedGObject], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const CamelNameValueArray*)userTags
{
	const CamelNameValueArray* returnValue = camel_message_info_get_user_tags([self castedGObject]);

	return returnValue;
}

- (bool)loadWithRecord:(const struct _CamelMIRecord*)record bdataPtr:(gchar**)bdataPtr
{
	bool returnValue = camel_message_info_load([self castedGObject], record, bdataPtr);

	return returnValue;
}

- (OFString*)pooldupUid
{
	const gchar* gobjectValue = camel_message_info_pooldup_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)propertyLock
{
	camel_message_info_property_lock([self castedGObject]);
}

- (void)propertyUnlock
{
	camel_message_info_property_unlock([self castedGObject]);
}

- (OGCamelFolderSummary*)refSummary
{
	CamelFolderSummary* gobjectValue = CAMEL_FOLDER_SUMMARY(camel_message_info_ref_summary([self castedGObject]));

	OGCamelFolderSummary* returnValue = [OGCamelFolderSummary withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)saveWithRecord:(CamelMIRecord*)record bdataStr:(GString*)bdataStr
{
	bool returnValue = camel_message_info_save([self castedGObject], record, bdataStr);

	return returnValue;
}

- (void)setAbortNotifications:(bool)abortNotifications
{
	camel_message_info_set_abort_notifications([self castedGObject], abortNotifications);
}

- (bool)setCc:(OFString*)cc
{
	bool returnValue = camel_message_info_set_cc([self castedGObject], [cc UTF8String]);

	return returnValue;
}

- (bool)setDateReceived:(gint64)dateReceived
{
	bool returnValue = camel_message_info_set_date_received([self castedGObject], dateReceived);

	return returnValue;
}

- (bool)setDateSent:(gint64)dateSent
{
	bool returnValue = camel_message_info_set_date_sent([self castedGObject], dateSent);

	return returnValue;
}

- (void)setDirty:(bool)dirty
{
	camel_message_info_set_dirty([self castedGObject], dirty);
}

- (bool)setFlagsWithMask:(guint32)mask set:(guint32)set
{
	bool returnValue = camel_message_info_set_flags([self castedGObject], mask, set);

	return returnValue;
}

- (bool)setFolderFlagged:(bool)folderFlagged
{
	bool returnValue = camel_message_info_set_folder_flagged([self castedGObject], folderFlagged);

	return returnValue;
}

- (bool)setFrom:(OFString*)from
{
	bool returnValue = camel_message_info_set_from([self castedGObject], [from UTF8String]);

	return returnValue;
}

- (bool)setMessageId:(guint64)messageId
{
	bool returnValue = camel_message_info_set_message_id([self castedGObject], messageId);

	return returnValue;
}

- (bool)setMlist:(OFString*)mlist
{
	bool returnValue = camel_message_info_set_mlist([self castedGObject], [mlist UTF8String]);

	return returnValue;
}

- (bool)setPreview:(OFString*)preview
{
	bool returnValue = camel_message_info_set_preview([self castedGObject], [preview UTF8String]);

	return returnValue;
}

- (bool)setSize:(guint32)size
{
	bool returnValue = camel_message_info_set_size([self castedGObject], size);

	return returnValue;
}

- (bool)setSubject:(OFString*)subject
{
	bool returnValue = camel_message_info_set_subject([self castedGObject], [subject UTF8String]);

	return returnValue;
}

- (bool)setTo:(OFString*)to
{
	bool returnValue = camel_message_info_set_to([self castedGObject], [to UTF8String]);

	return returnValue;
}

- (bool)setUid:(OFString*)uid
{
	bool returnValue = camel_message_info_set_uid([self castedGObject], [uid UTF8String]);

	return returnValue;
}

- (bool)setUserFlagWithName:(OFString*)name state:(bool)state
{
	bool returnValue = camel_message_info_set_user_flag([self castedGObject], [name UTF8String], state);

	return returnValue;
}

- (bool)setUserHeaderWithName:(OFString*)name value:(OFString*)value
{
	bool returnValue = camel_message_info_set_user_header([self castedGObject], [name UTF8String], [value UTF8String]);

	return returnValue;
}

- (bool)setUserTagWithName:(OFString*)name value:(OFString*)value
{
	bool returnValue = camel_message_info_set_user_tag([self castedGObject], [name UTF8String], [value UTF8String]);

	return returnValue;
}

- (bool)takeHeaders:(CamelNameValueArray*)headers
{
	bool returnValue = camel_message_info_take_headers([self castedGObject], headers);

	return returnValue;
}

- (bool)takeReferences:(GArray*)references
{
	bool returnValue = camel_message_info_take_references([self castedGObject], references);

	return returnValue;
}

- (bool)takeUserFlags:(CamelNamedFlags*)userFlags
{
	bool returnValue = camel_message_info_take_user_flags([self castedGObject], userFlags);

	return returnValue;
}

- (bool)takeUserHeaders:(CamelNameValueArray*)headers
{
	bool returnValue = camel_message_info_take_user_headers([self castedGObject], headers);

	return returnValue;
}

- (bool)takeUserTags:(CamelNameValueArray*)userTags
{
	bool returnValue = camel_message_info_take_user_tags([self castedGObject], userTags);

	return returnValue;
}

- (void)thawNotifications
{
	camel_message_info_thaw_notifications([self castedGObject]);
}


@end