/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMessageInfo.h"

#import "OGCamelFolderSummary.h"

@implementation OGCamelMessageInfo

- (instancetype)init:(OGCamelFolderSummary*)summary
{
	self = [super initWithGObject:(GObject*)camel_message_info_new([summary FOLDERSUMMARY])];

	return self;
}

- (instancetype)initFromHeadersWithSummary:(OGCamelFolderSummary*)summary headers:(const CamelNameValueArray*)headers
{
	self = [super initWithGObject:(GObject*)camel_message_info_new_from_headers([summary FOLDERSUMMARY], headers)];

	return self;
}

- (CamelMessageInfo*)MESSAGEINFO
{
	return CAMEL_MESSAGE_INFO([self GOBJECT]);
}

- (OGCamelMessageInfo*)clone:(OGCamelFolderSummary*)assignSummary
{
	return [[[OGCamelMessageInfo alloc] initWithGObject:(GObject*)camel_message_info_clone([self MESSAGEINFO], [assignSummary FOLDERSUMMARY])] autorelease];
}

- (void)dump
{
	camel_message_info_dump([self MESSAGEINFO]);
}

- (CamelNameValueArray*)dupHeaders
{
	return camel_message_info_dup_headers([self MESSAGEINFO]);
}

- (GArray*)dupReferences
{
	return camel_message_info_dup_references([self MESSAGEINFO]);
}

- (CamelNamedFlags*)dupUserFlags
{
	return camel_message_info_dup_user_flags([self MESSAGEINFO]);
}

- (OFString*)dupUserTag:(OFString*)name
{
	return [OFString stringWithUTF8String:camel_message_info_dup_user_tag([self MESSAGEINFO], [name UTF8String])];
}

- (CamelNameValueArray*)dupUserTags
{
	return camel_message_info_dup_user_tags([self MESSAGEINFO]);
}

- (void)freezeNotifications
{
	camel_message_info_freeze_notifications([self MESSAGEINFO]);
}

- (bool)abortNotifications
{
	return camel_message_info_get_abort_notifications([self MESSAGEINFO]);
}

- (OFString*)cc
{
	return [OFString stringWithUTF8String:camel_message_info_get_cc([self MESSAGEINFO])];
}

- (gint64)dateReceived
{
	return camel_message_info_get_date_received([self MESSAGEINFO]);
}

- (gint64)dateSent
{
	return camel_message_info_get_date_sent([self MESSAGEINFO]);
}

- (bool)dirty
{
	return camel_message_info_get_dirty([self MESSAGEINFO]);
}

- (guint32)flags
{
	return camel_message_info_get_flags([self MESSAGEINFO]);
}

- (bool)folderFlagged
{
	return camel_message_info_get_folder_flagged([self MESSAGEINFO]);
}

- (guint)folderFlaggedStamp
{
	return camel_message_info_get_folder_flagged_stamp([self MESSAGEINFO]);
}

- (OFString*)from
{
	return [OFString stringWithUTF8String:camel_message_info_get_from([self MESSAGEINFO])];
}

- (const CamelNameValueArray*)headers
{
	return camel_message_info_get_headers([self MESSAGEINFO]);
}

- (guint64)messageId
{
	return camel_message_info_get_message_id([self MESSAGEINFO]);
}

- (OFString*)mlist
{
	return [OFString stringWithUTF8String:camel_message_info_get_mlist([self MESSAGEINFO])];
}

- (bool)notificationsFrozen
{
	return camel_message_info_get_notifications_frozen([self MESSAGEINFO]);
}

- (const GArray*)references
{
	return camel_message_info_get_references([self MESSAGEINFO]);
}

- (guint32)size
{
	return camel_message_info_get_size([self MESSAGEINFO]);
}

- (OFString*)subject
{
	return [OFString stringWithUTF8String:camel_message_info_get_subject([self MESSAGEINFO])];
}

- (OFString*)to
{
	return [OFString stringWithUTF8String:camel_message_info_get_to([self MESSAGEINFO])];
}

- (OFString*)uid
{
	return [OFString stringWithUTF8String:camel_message_info_get_uid([self MESSAGEINFO])];
}

- (bool)userFlag:(OFString*)name
{
	return camel_message_info_get_user_flag([self MESSAGEINFO], [name UTF8String]);
}

- (const CamelNamedFlags*)userFlags
{
	return camel_message_info_get_user_flags([self MESSAGEINFO]);
}

- (OFString*)userTag:(OFString*)name
{
	return [OFString stringWithUTF8String:camel_message_info_get_user_tag([self MESSAGEINFO], [name UTF8String])];
}

- (const CamelNameValueArray*)userTags
{
	return camel_message_info_get_user_tags([self MESSAGEINFO]);
}

- (bool)loadWithRecord:(const struct _CamelMIRecord*)record bdataPtr:(gchar**)bdataPtr
{
	return camel_message_info_load([self MESSAGEINFO], record, bdataPtr);
}

- (OFString*)pooldupUid
{
	return [OFString stringWithUTF8String:camel_message_info_pooldup_uid([self MESSAGEINFO])];
}

- (void)propertyLock
{
	camel_message_info_property_lock([self MESSAGEINFO]);
}

- (void)propertyUnlock
{
	camel_message_info_property_unlock([self MESSAGEINFO]);
}

- (OGCamelFolderSummary*)refSummary
{
	return [[[OGCamelFolderSummary alloc] initWithGObject:(GObject*)camel_message_info_ref_summary([self MESSAGEINFO])] autorelease];
}

- (bool)saveWithRecord:(CamelMIRecord*)record bdataStr:(GString*)bdataStr
{
	return camel_message_info_save([self MESSAGEINFO], record, bdataStr);
}

- (void)setAbortNotifications:(bool)abortNotifications
{
	camel_message_info_set_abort_notifications([self MESSAGEINFO], abortNotifications);
}

- (bool)setCc:(OFString*)cc
{
	return camel_message_info_set_cc([self MESSAGEINFO], [cc UTF8String]);
}

- (bool)setDateReceived:(gint64)dateReceived
{
	return camel_message_info_set_date_received([self MESSAGEINFO], dateReceived);
}

- (bool)setDateSent:(gint64)dateSent
{
	return camel_message_info_set_date_sent([self MESSAGEINFO], dateSent);
}

- (void)setDirty:(bool)dirty
{
	camel_message_info_set_dirty([self MESSAGEINFO], dirty);
}

- (bool)setFlagsWithMask:(guint32)mask set:(guint32)set
{
	return camel_message_info_set_flags([self MESSAGEINFO], mask, set);
}

- (bool)setFolderFlagged:(bool)folderFlagged
{
	return camel_message_info_set_folder_flagged([self MESSAGEINFO], folderFlagged);
}

- (bool)setFrom:(OFString*)from
{
	return camel_message_info_set_from([self MESSAGEINFO], [from UTF8String]);
}

- (bool)setMessageId:(guint64)messageId
{
	return camel_message_info_set_message_id([self MESSAGEINFO], messageId);
}

- (bool)setMlist:(OFString*)mlist
{
	return camel_message_info_set_mlist([self MESSAGEINFO], [mlist UTF8String]);
}

- (bool)setSize:(guint32)size
{
	return camel_message_info_set_size([self MESSAGEINFO], size);
}

- (bool)setSubject:(OFString*)subject
{
	return camel_message_info_set_subject([self MESSAGEINFO], [subject UTF8String]);
}

- (bool)setTo:(OFString*)to
{
	return camel_message_info_set_to([self MESSAGEINFO], [to UTF8String]);
}

- (bool)setUid:(OFString*)uid
{
	return camel_message_info_set_uid([self MESSAGEINFO], [uid UTF8String]);
}

- (bool)setUserFlagWithName:(OFString*)name state:(bool)state
{
	return camel_message_info_set_user_flag([self MESSAGEINFO], [name UTF8String], state);
}

- (bool)setUserTagWithName:(OFString*)name value:(OFString*)value
{
	return camel_message_info_set_user_tag([self MESSAGEINFO], [name UTF8String], [value UTF8String]);
}

- (bool)takeHeaders:(CamelNameValueArray*)headers
{
	return camel_message_info_take_headers([self MESSAGEINFO], headers);
}

- (bool)takeReferences:(GArray*)references
{
	return camel_message_info_take_references([self MESSAGEINFO], references);
}

- (bool)takeUserFlags:(CamelNamedFlags*)userFlags
{
	return camel_message_info_take_user_flags([self MESSAGEINFO], userFlags);
}

- (bool)takeUserTags:(CamelNameValueArray*)userTags
{
	return camel_message_info_take_user_tags([self MESSAGEINFO], userTags);
}

- (void)thawNotifications
{
	camel_message_info_thaw_notifications([self MESSAGEINFO]);
}


@end