/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFolderSummary.h"

#import "OGCamelIndex.h"
#import "OGCamelMimeParser.h"
#import "OGCamelMimeMessage.h"
#import "OGCamelMessageInfo.h"
#import "OGCamelFolder.h"
#import "OGCamelStore.h"

@implementation OGCamelFolderSummary

+ (void)freeArray:(GPtrArray*)array
{
	camel_folder_summary_free_array(array);
}

- (instancetype)init:(OGCamelFolder*)folder
{
	self = [super initWithGObject:(GObject*)camel_folder_summary_new([folder FOLDER])];

	return self;
}

- (CamelFolderSummary*)FOLDERSUMMARY
{
	return CAMEL_FOLDER_SUMMARY([self GOBJECT]);
}

- (void)addWithInfo:(OGCamelMessageInfo*)info forceKeepUid:(bool)forceKeepUid
{
	camel_folder_summary_add([self FOLDERSUMMARY], [info MESSAGEINFO], forceKeepUid);
}

- (bool)checkUid:(OFString*)uid
{
	return camel_folder_summary_check_uid([self FOLDERSUMMARY], [uid UTF8String]);
}

- (bool)clear:(GError**)err
{
	return camel_folder_summary_clear([self FOLDERSUMMARY], err);
}

- (guint)count
{
	return camel_folder_summary_count([self FOLDERSUMMARY]);
}

- (OGCamelMessageInfo*)instance:(OFString*)uid
{
	return [[[OGCamelMessageInfo alloc] initWithGObject:(GObject*)camel_folder_summary_get([self FOLDERSUMMARY], [uid UTF8String])] autorelease];
}

- (GPtrArray*)array
{
	return camel_folder_summary_get_array([self FOLDERSUMMARY]);
}

- (GPtrArray*)changed
{
	return camel_folder_summary_get_changed([self FOLDERSUMMARY]);
}

- (guint32)deletedCount
{
	return camel_folder_summary_get_deleted_count([self FOLDERSUMMARY]);
}

- (guint32)flags
{
	return camel_folder_summary_get_flags([self FOLDERSUMMARY]);
}

- (OGCamelFolder*)folder
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_folder_summary_get_folder([self FOLDERSUMMARY])] autorelease];
}

- (GHashTable*)hash
{
	return camel_folder_summary_get_hash([self FOLDERSUMMARY]);
}

- (OGCamelIndex*)index
{
	return [[[OGCamelIndex alloc] initWithGObject:(GObject*)camel_folder_summary_get_index([self FOLDERSUMMARY])] autorelease];
}

- (guint32)infoFlags:(OFString*)uid
{
	return camel_folder_summary_get_info_flags([self FOLDERSUMMARY], [uid UTF8String]);
}

- (guint32)junkCount
{
	return camel_folder_summary_get_junk_count([self FOLDERSUMMARY]);
}

- (guint32)junkNotDeletedCount
{
	return camel_folder_summary_get_junk_not_deleted_count([self FOLDERSUMMARY]);
}

- (guint32)nextUid
{
	return camel_folder_summary_get_next_uid([self FOLDERSUMMARY]);
}

- (guint32)savedCount
{
	return camel_folder_summary_get_saved_count([self FOLDERSUMMARY]);
}

- (gint64)timestamp
{
	return camel_folder_summary_get_timestamp([self FOLDERSUMMARY]);
}

- (guint32)unreadCount
{
	return camel_folder_summary_get_unread_count([self FOLDERSUMMARY]);
}

- (guint32)version
{
	return camel_folder_summary_get_version([self FOLDERSUMMARY]);
}

- (guint32)visibleCount
{
	return camel_folder_summary_get_visible_count([self FOLDERSUMMARY]);
}

- (bool)headerLoadWithStore:(OGCamelStore*)store folderName:(OFString*)folderName err:(GError**)err
{
	return camel_folder_summary_header_load([self FOLDERSUMMARY], [store STORE], [folderName UTF8String], err);
}

- (bool)headerSave:(GError**)err
{
	return camel_folder_summary_header_save([self FOLDERSUMMARY], err);
}

- (OGCamelMessageInfo*)infoNewFromHeaders:(const CamelNameValueArray*)headers
{
	return [[[OGCamelMessageInfo alloc] initWithGObject:(GObject*)camel_folder_summary_info_new_from_headers([self FOLDERSUMMARY], headers)] autorelease];
}

- (OGCamelMessageInfo*)infoNewFromMessage:(OGCamelMimeMessage*)message
{
	return [[[OGCamelMessageInfo alloc] initWithGObject:(GObject*)camel_folder_summary_info_new_from_message([self FOLDERSUMMARY], [message MIMEMESSAGE])] autorelease];
}

- (OGCamelMessageInfo*)infoNewFromParser:(OGCamelMimeParser*)parser
{
	return [[[OGCamelMessageInfo alloc] initWithGObject:(GObject*)camel_folder_summary_info_new_from_parser([self FOLDERSUMMARY], [parser MIMEPARSER])] autorelease];
}

- (bool)load:(GError**)err
{
	return camel_folder_summary_load([self FOLDERSUMMARY], err);
}

- (void)lock
{
	camel_folder_summary_lock([self FOLDERSUMMARY]);
}

- (guint32)generateNextUid
{
	return camel_folder_summary_next_uid([self FOLDERSUMMARY]);
}

- (OFString*)nextUidString
{
	return [OFString stringWithUTF8String:camel_folder_summary_next_uid_string([self FOLDERSUMMARY])];
}

- (OGCamelMessageInfo*)peekLoaded:(OFString*)uid
{
	return [[[OGCamelMessageInfo alloc] initWithGObject:(GObject*)camel_folder_summary_peek_loaded([self FOLDERSUMMARY], [uid UTF8String])] autorelease];
}

- (void)prepareFetchAll:(GError**)err
{
	camel_folder_summary_prepare_fetch_all([self FOLDERSUMMARY], err);
}

- (bool)remove:(OGCamelMessageInfo*)info
{
	return camel_folder_summary_remove([self FOLDERSUMMARY], [info MESSAGEINFO]);
}

- (bool)removeUid:(OFString*)uid
{
	return camel_folder_summary_remove_uid([self FOLDERSUMMARY], [uid UTF8String]);
}

- (bool)removeUids:(GList*)uids
{
	return camel_folder_summary_remove_uids([self FOLDERSUMMARY], uids);
}

- (bool)replaceFlags:(OGCamelMessageInfo*)info
{
	return camel_folder_summary_replace_flags([self FOLDERSUMMARY], [info MESSAGEINFO]);
}

- (bool)save:(GError**)err
{
	return camel_folder_summary_save([self FOLDERSUMMARY], err);
}

- (void)setFlags:(guint32)flags
{
	camel_folder_summary_set_flags([self FOLDERSUMMARY], flags);
}

- (void)setIndex:(OGCamelIndex*)index
{
	camel_folder_summary_set_index([self FOLDERSUMMARY], [index INDEX]);
}

- (void)setNextUid:(guint32)uid
{
	camel_folder_summary_set_next_uid([self FOLDERSUMMARY], uid);
}

- (void)setTimestamp:(gint64)timestamp
{
	camel_folder_summary_set_timestamp([self FOLDERSUMMARY], timestamp);
}

- (void)setVersion:(guint32)version
{
	camel_folder_summary_set_version([self FOLDERSUMMARY], version);
}

- (void)touch
{
	camel_folder_summary_touch([self FOLDERSUMMARY]);
}

- (void)unlock
{
	camel_folder_summary_unlock([self FOLDERSUMMARY]);
}


@end