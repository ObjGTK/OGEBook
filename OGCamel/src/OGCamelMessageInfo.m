/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMessageInfo.h"

#import "OGCamelFolderSummary.h"
#import "OGCamelMimeMessage.h"

@implementation OGCamelMessageInfo

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MESSAGE_INFO;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)messageInfoWithSummary:(OGCamelFolderSummary*)summary
{
	CamelMessageInfo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_message_info_new([summary castedGObject]), CamelMessageInfo, CamelMessageInfo);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMessageInfo* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMessageInfo alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)messageInfoFromHeadersWithSummary:(OGCamelFolderSummary*)summary headers:(const CamelNameValueArray*)headers
{
	CamelMessageInfo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_message_info_new_from_headers([summary castedGObject], headers), CamelMessageInfo, CamelMessageInfo);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMessageInfo* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMessageInfo alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)messageInfoFromMessageWithSummary:(OGCamelFolderSummary*)summary message:(OGCamelMimeMessage*)message
{
	CamelMessageInfo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_message_info_new_from_message([summary castedGObject], [message castedGObject]), CamelMessageInfo, CamelMessageInfo);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMessageInfo* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMessageInfo alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMessageInfo*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMessageInfo, CamelMessageInfo);
}

- (OGCamelMessageInfo*)cloneWithAssignSummary:(OGCamelFolderSummary*)assignSummary
{
	CamelMessageInfo* gobjectValue = camel_message_info_clone([self castedGObject], [assignSummary castedGObject]);

	OGCamelMessageInfo* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)dump
{
	camel_message_info_dump([self castedGObject]);
}

- (CamelNameValueArray*)dupHeaders
{
	CamelNameValueArray* returnValue = (CamelNameValueArray*)camel_message_info_dup_headers([self castedGObject]);

	return returnValue;
}

- (OFString*)dupPreview
{
	gchar* gobjectValue = camel_message_info_dup_preview([self castedGObject]);

	OFString* returnValue = gobjectValue;
	return returnValue;
}

- (GArray*)dupReferences
{
	GArray* returnValue = (GArray*)camel_message_info_dup_references([self castedGObject]);

	return returnValue;
}

- (CamelNamedFlags*)dupUserFlags
{
	CamelNamedFlags* returnValue = (CamelNamedFlags*)camel_message_info_dup_user_flags([self castedGObject]);

	return returnValue;
}

- (OFString*)dupUserHeaderWithName:(OFString*)name
{
	gchar* gobjectValue = camel_message_info_dup_user_header([self castedGObject], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (CamelNameValueArray*)dupUserHeaders
{
	CamelNameValueArray* returnValue = (CamelNameValueArray*)camel_message_info_dup_user_headers([self castedGObject]);

	return returnValue;
}

- (OFString*)dupUserTagWithName:(OFString*)name
{
	gchar* gobjectValue = camel_message_info_dup_user_tag([self castedGObject], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (CamelNameValueArray*)dupUserTags
{
	CamelNameValueArray* returnValue = (CamelNameValueArray*)camel_message_info_dup_user_tags([self castedGObject]);

	return returnValue;
}

- (void)freezeNotifications
{
	camel_message_info_freeze_notifications([self castedGObject]);
}

- (bool)abortNotifications
{
	bool returnValue = (bool)camel_message_info_get_abort_notifications([self castedGObject]);

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
	gint64 returnValue = (gint64)camel_message_info_get_date_received([self castedGObject]);

	return returnValue;
}

- (gint64)dateSent
{
	gint64 returnValue = (gint64)camel_message_info_get_date_sent([self castedGObject]);

	return returnValue;
}

- (bool)dirty
{
	bool returnValue = (bool)camel_message_info_get_dirty([self castedGObject]);

	return returnValue;
}

- (guint32)flags
{
	guint32 returnValue = (guint32)camel_message_info_get_flags([self castedGObject]);

	return returnValue;
}

- (bool)folderFlagged
{
	bool returnValue = (bool)camel_message_info_get_folder_flagged([self castedGObject]);

	return returnValue;
}

- (guint)folderFlaggedStamp
{
	guint returnValue = (guint)camel_message_info_get_folder_flagged_stamp([self castedGObject]);

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
	const CamelNameValueArray* returnValue = (const CamelNameValueArray*)camel_message_info_get_headers([self castedGObject]);

	return returnValue;
}

- (guint64)messageId
{
	guint64 returnValue = (guint64)camel_message_info_get_message_id([self castedGObject]);

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
	bool returnValue = (bool)camel_message_info_get_notifications_frozen([self castedGObject]);

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
	const GArray* returnValue = (const GArray*)camel_message_info_get_references([self castedGObject]);

	return returnValue;
}

- (guint32)size
{
	guint32 returnValue = (guint32)camel_message_info_get_size([self castedGObject]);

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

- (bool)userFlagWithName:(OFString*)name
{
	bool returnValue = (bool)camel_message_info_get_user_flag([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (const CamelNamedFlags*)userFlags
{
	const CamelNamedFlags* returnValue = (const CamelNamedFlags*)camel_message_info_get_user_flags([self castedGObject]);

	return returnValue;
}

- (OFString*)userHeaderWithName:(OFString*)name
{
	const gchar* gobjectValue = camel_message_info_get_user_header([self castedGObject], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const CamelNameValueArray*)userHeaders
{
	const CamelNameValueArray* returnValue = (const CamelNameValueArray*)camel_message_info_get_user_headers([self castedGObject]);

	return returnValue;
}

- (OFString*)userTagWithName:(OFString*)name
{
	const gchar* gobjectValue = camel_message_info_get_user_tag([self castedGObject], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const CamelNameValueArray*)userTags
{
	const CamelNameValueArray* returnValue = (const CamelNameValueArray*)camel_message_info_get_user_tags([self castedGObject]);

	return returnValue;
}

- (bool)loadWithRecord:(const struct _CamelMIRecord*)record bdataPtr:(gchar**)bdataPtr
{
	bool returnValue = (bool)camel_message_info_load([self castedGObject], record, bdataPtr);

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
	CamelFolderSummary* gobjectValue = camel_message_info_ref_summary([self castedGObject]);

	OGCamelFolderSummary* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)saveWithRecord:(CamelMIRecord*)record bdataStr:(GString*)bdataStr
{
	bool returnValue = (bool)camel_message_info_save([self castedGObject], record, bdataStr);

	return returnValue;
}

- (void)setAbortNotifications:(bool)abortNotifications
{
	camel_message_info_set_abort_notifications([self castedGObject], abortNotifications);
}

- (bool)setCc:(OFString*)cc
{
	bool returnValue = (bool)camel_message_info_set_cc([self castedGObject], [cc UTF8String]);

	return returnValue;
}

- (bool)setDateReceived:(gint64)dateReceived
{
	bool returnValue = (bool)camel_message_info_set_date_received([self castedGObject], dateReceived);

	return returnValue;
}

- (bool)setDateSent:(gint64)dateSent
{
	bool returnValue = (bool)camel_message_info_set_date_sent([self castedGObject], dateSent);

	return returnValue;
}

- (void)setDirty:(bool)dirty
{
	camel_message_info_set_dirty([self castedGObject], dirty);
}

- (bool)setFlagsWithMask:(guint32)mask set:(guint32)set
{
	bool returnValue = (bool)camel_message_info_set_flags([self castedGObject], mask, set);

	return returnValue;
}

- (bool)setFolderFlagged:(bool)folderFlagged
{
	bool returnValue = (bool)camel_message_info_set_folder_flagged([self castedGObject], folderFlagged);

	return returnValue;
}

- (bool)setFrom:(OFString*)from
{
	bool returnValue = (bool)camel_message_info_set_from([self castedGObject], [from UTF8String]);

	return returnValue;
}

- (bool)setMessageId:(guint64)messageId
{
	bool returnValue = (bool)camel_message_info_set_message_id([self castedGObject], messageId);

	return returnValue;
}

- (bool)setMlist:(OFString*)mlist
{
	bool returnValue = (bool)camel_message_info_set_mlist([self castedGObject], [mlist UTF8String]);

	return returnValue;
}

- (bool)setPreview:(OFString*)preview
{
	bool returnValue = (bool)camel_message_info_set_preview([self castedGObject], [preview UTF8String]);

	return returnValue;
}

- (bool)setSize:(guint32)size
{
	bool returnValue = (bool)camel_message_info_set_size([self castedGObject], size);

	return returnValue;
}

- (bool)setSubject:(OFString*)subject
{
	bool returnValue = (bool)camel_message_info_set_subject([self castedGObject], [subject UTF8String]);

	return returnValue;
}

- (bool)setTo:(OFString*)to
{
	bool returnValue = (bool)camel_message_info_set_to([self castedGObject], [to UTF8String]);

	return returnValue;
}

- (bool)setUid:(OFString*)uid
{
	bool returnValue = (bool)camel_message_info_set_uid([self castedGObject], [uid UTF8String]);

	return returnValue;
}

- (bool)setUserFlagWithName:(OFString*)name state:(bool)state
{
	bool returnValue = (bool)camel_message_info_set_user_flag([self castedGObject], [name UTF8String], state);

	return returnValue;
}

- (bool)setUserHeaderWithName:(OFString*)name value:(OFString*)value
{
	bool returnValue = (bool)camel_message_info_set_user_header([self castedGObject], [name UTF8String], [value UTF8String]);

	return returnValue;
}

- (bool)setUserTagWithName:(OFString*)name value:(OFString*)value
{
	bool returnValue = (bool)camel_message_info_set_user_tag([self castedGObject], [name UTF8String], [value UTF8String]);

	return returnValue;
}

- (bool)takeHeaders:(CamelNameValueArray*)headers
{
	bool returnValue = (bool)camel_message_info_take_headers([self castedGObject], headers);

	return returnValue;
}

- (bool)takeReferences:(GArray*)references
{
	bool returnValue = (bool)camel_message_info_take_references([self castedGObject], references);

	return returnValue;
}

- (bool)takeUserFlags:(CamelNamedFlags*)userFlags
{
	bool returnValue = (bool)camel_message_info_take_user_flags([self castedGObject], userFlags);

	return returnValue;
}

- (bool)takeUserHeaders:(CamelNameValueArray*)headers
{
	bool returnValue = (bool)camel_message_info_take_user_headers([self castedGObject], headers);

	return returnValue;
}

- (bool)takeUserTags:(CamelNameValueArray*)userTags
{
	bool returnValue = (bool)camel_message_info_take_user_tags([self castedGObject], userTags);

	return returnValue;
}

- (void)thawNotifications
{
	camel_message_info_thaw_notifications([self castedGObject]);
}


@end