/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFolder.h"

#import "OGCamelMimeMessage.h"
#import "OGCamelMessageInfo.h"
#import "OGCamelStore.h"
#import "OGCamelFolderSummary.h"

@implementation OGCamelFolder

+ (GQuark)errorQuark
{
	return camel_folder_error_quark();
}

+ (gint)threadedMessagesDump:(CamelFolderThreadNode*)c
{
	return camel_folder_threaded_messages_dump(c);
}

- (CamelFolder*)FOLDER
{
	return CAMEL_FOLDER([self GOBJECT]);
}

- (void)appendMessageWithMessage:(OGCamelMimeMessage*)message info:(OGCamelMessageInfo*)info ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_append_message([self FOLDER], [message MIMEMESSAGE], [info MESSAGEINFO], ioPriority, cancellable, callback, userData);
}

- (bool)appendMessageFinishWithResult:(GAsyncResult*)result appendedUid:(gchar**)appendedUid err:(GError**)err
{
	return camel_folder_append_message_finish([self FOLDER], result, appendedUid, err);
}

- (bool)appendMessageSyncWithMessage:(OGCamelMimeMessage*)message info:(OGCamelMessageInfo*)info appendedUid:(gchar**)appendedUid cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_append_message_sync([self FOLDER], [message MIMEMESSAGE], [info MESSAGEINFO], appendedUid, cancellable, err);
}

- (void)changed:(CamelFolderChangeInfo*)changes
{
	camel_folder_changed([self FOLDER], changes);
}

- (gint)cmpUidsWithUid1:(OFString*)uid1 uid2:(OFString*)uid2
{
	return camel_folder_cmp_uids([self FOLDER], [uid1 UTF8String], [uid2 UTF8String]);
}

- (guint32)countByExpressionWithExpression:(OFString*)expression cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_count_by_expression([self FOLDER], [expression UTF8String], cancellable, err);
}

- (void)delete
{
	camel_folder_delete([self FOLDER]);
}

- (OFString*)dupDescription
{
	return [OFString stringWithUTF8String:camel_folder_dup_description([self FOLDER])];
}

- (OFString*)dupDisplayName
{
	return [OFString stringWithUTF8String:camel_folder_dup_display_name([self FOLDER])];
}

- (OFString*)dupFullName
{
	return [OFString stringWithUTF8String:camel_folder_dup_full_name([self FOLDER])];
}

- (void)expungeWithIoPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_expunge([self FOLDER], ioPriority, cancellable, callback, userData);
}

- (bool)expungeFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_folder_expunge_finish([self FOLDER], result, err);
}

- (bool)expungeSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_expunge_sync([self FOLDER], cancellable, err);
}

- (void)freeDeep:(GPtrArray*)array
{
	camel_folder_free_deep([self FOLDER], array);
}

- (void)freeShallow:(GPtrArray*)array
{
	camel_folder_free_shallow([self FOLDER], array);
}

- (void)freeSummary:(GPtrArray*)array
{
	camel_folder_free_summary([self FOLDER], array);
}

- (void)freeUids:(GPtrArray*)array
{
	camel_folder_free_uids([self FOLDER], array);
}

- (void)freeze
{
	camel_folder_freeze([self FOLDER]);
}

- (gint)deletedMessageCount
{
	return camel_folder_get_deleted_message_count([self FOLDER]);
}

- (OFString*)description
{
	return [OFString stringWithUTF8String:camel_folder_get_description([self FOLDER])];
}

- (OFString*)displayName
{
	return [OFString stringWithUTF8String:camel_folder_get_display_name([self FOLDER])];
}

- (OFString*)filenameWithUid:(OFString*)uid err:(GError**)err
{
	return [OFString stringWithUTF8String:camel_folder_get_filename([self FOLDER], [uid UTF8String], err)];
}

- (guint32)flags
{
	return camel_folder_get_flags([self FOLDER]);
}

- (OGCamelFolderSummary*)folderSummary
{
	return [[[OGCamelFolderSummary alloc] initWithGObject:(GObject*)camel_folder_get_folder_summary([self FOLDER])] autorelease];
}

- (gint)frozenCount
{
	return camel_folder_get_frozen_count([self FOLDER]);
}

- (OFString*)fullName
{
	return [OFString stringWithUTF8String:camel_folder_get_full_name([self FOLDER])];
}

- (CamelThreeState)markSeen
{
	return camel_folder_get_mark_seen([self FOLDER]);
}

- (gint)markSeenTimeout
{
	return camel_folder_get_mark_seen_timeout([self FOLDER]);
}

- (void)messageWithMessageUid:(OFString*)messageUid ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_get_message([self FOLDER], [messageUid UTF8String], ioPriority, cancellable, callback, userData);
}

- (OGCamelMimeMessage*)messageCachedWithMessageUid:(OFString*)messageUid cancellable:(GCancellable*)cancellable
{
	return [[[OGCamelMimeMessage alloc] initWithGObject:(GObject*)camel_folder_get_message_cached([self FOLDER], [messageUid UTF8String], cancellable)] autorelease];
}

- (gint)messageCount
{
	return camel_folder_get_message_count([self FOLDER]);
}

- (OGCamelMimeMessage*)messageFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return [[[OGCamelMimeMessage alloc] initWithGObject:(GObject*)camel_folder_get_message_finish([self FOLDER], result, err)] autorelease];
}

- (guint32)messageFlags:(OFString*)uid
{
	return camel_folder_get_message_flags([self FOLDER], [uid UTF8String]);
}

- (OGCamelMessageInfo*)messageInfo:(OFString*)uid
{
	return [[[OGCamelMessageInfo alloc] initWithGObject:(GObject*)camel_folder_get_message_info([self FOLDER], [uid UTF8String])] autorelease];
}

- (OGCamelMimeMessage*)messageSyncWithMessageUid:(OFString*)messageUid cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return [[[OGCamelMimeMessage alloc] initWithGObject:(GObject*)camel_folder_get_message_sync([self FOLDER], [messageUid UTF8String], cancellable, err)] autorelease];
}

- (bool)messageUserFlagWithUid:(OFString*)uid name:(OFString*)name
{
	return camel_folder_get_message_user_flag([self FOLDER], [uid UTF8String], [name UTF8String]);
}

- (OFString*)messageUserTagWithUid:(OFString*)uid name:(OFString*)name
{
	return [OFString stringWithUTF8String:camel_folder_get_message_user_tag([self FOLDER], [uid UTF8String], [name UTF8String])];
}

- (OGCamelStore*)parentStore
{
	return [[[OGCamelStore alloc] initWithGObject:(GObject*)camel_folder_get_parent_store([self FOLDER])] autorelease];
}

- (guint32)permanentFlags
{
	return camel_folder_get_permanent_flags([self FOLDER]);
}

- (void)quotaInfoWithIoPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_get_quota_info([self FOLDER], ioPriority, cancellable, callback, userData);
}

- (CamelFolderQuotaInfo*)quotaInfoFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_folder_get_quota_info_finish([self FOLDER], result, err);
}

- (CamelFolderQuotaInfo*)quotaInfoSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_get_quota_info_sync([self FOLDER], cancellable, err);
}

- (GPtrArray*)summary
{
	return camel_folder_get_summary([self FOLDER]);
}

- (GPtrArray*)uids
{
	return camel_folder_get_uids([self FOLDER]);
}

- (GPtrArray*)uncachedUidsWithUids:(GPtrArray*)uids err:(GError**)err
{
	return camel_folder_get_uncached_uids([self FOLDER], uids, err);
}

- (gint)unreadMessageCount
{
	return camel_folder_get_unread_message_count([self FOLDER]);
}

- (bool)hasSummaryCapability
{
	return camel_folder_has_summary_capability([self FOLDER]);
}

- (bool)isFrozen
{
	return camel_folder_is_frozen([self FOLDER]);
}

- (void)lock
{
	camel_folder_lock([self FOLDER]);
}

- (void)prepareContentRefresh
{
	camel_folder_prepare_content_refresh([self FOLDER]);
}

- (void)purgeMessageCacheWithStartUid:(OFString*)startUid endUid:(OFString*)endUid ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_purge_message_cache([self FOLDER], (gchar*) [startUid UTF8String], (gchar*) [endUid UTF8String], ioPriority, cancellable, callback, userData);
}

- (bool)purgeMessageCacheFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_folder_purge_message_cache_finish([self FOLDER], result, err);
}

- (bool)purgeMessageCacheSyncWithStartUid:(OFString*)startUid endUid:(OFString*)endUid cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_purge_message_cache_sync([self FOLDER], (gchar*) [startUid UTF8String], (gchar*) [endUid UTF8String], cancellable, err);
}

- (void)refreshInfoWithIoPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_refresh_info([self FOLDER], ioPriority, cancellable, callback, userData);
}

- (bool)refreshInfoFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_folder_refresh_info_finish([self FOLDER], result, err);
}

- (bool)refreshInfoSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_refresh_info_sync([self FOLDER], cancellable, err);
}

- (void)rename:(OFString*)newName
{
	camel_folder_rename([self FOLDER], [newName UTF8String]);
}

- (GPtrArray*)searchByExpressionWithExpression:(OFString*)expression cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_search_by_expression([self FOLDER], [expression UTF8String], cancellable, err);
}

- (GPtrArray*)searchByUidsWithExpression:(OFString*)expression uids:(GPtrArray*)uids cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_search_by_uids([self FOLDER], [expression UTF8String], uids, cancellable, err);
}

- (void)searchFree:(GPtrArray*)result
{
	camel_folder_search_free([self FOLDER], result);
}

- (void)setDescription:(OFString*)description
{
	camel_folder_set_description([self FOLDER], [description UTF8String]);
}

- (void)setDisplayName:(OFString*)displayName
{
	camel_folder_set_display_name([self FOLDER], [displayName UTF8String]);
}

- (void)setFlags:(guint32)folderFlags
{
	camel_folder_set_flags([self FOLDER], folderFlags);
}

- (void)setFullName:(OFString*)fullName
{
	camel_folder_set_full_name([self FOLDER], [fullName UTF8String]);
}

- (void)setLockAsync:(bool)skipFolderLock
{
	camel_folder_set_lock_async([self FOLDER], skipFolderLock);
}

- (void)setMarkSeen:(CamelThreeState)markSeen
{
	camel_folder_set_mark_seen([self FOLDER], markSeen);
}

- (void)setMarkSeenTimeout:(gint)timeout
{
	camel_folder_set_mark_seen_timeout([self FOLDER], timeout);
}

- (bool)setMessageFlagsWithUid:(OFString*)uid mask:(guint32)mask set:(guint32)set
{
	return camel_folder_set_message_flags([self FOLDER], [uid UTF8String], mask, set);
}

- (void)setMessageUserFlagWithUid:(OFString*)uid name:(OFString*)name value:(bool)value
{
	camel_folder_set_message_user_flag([self FOLDER], [uid UTF8String], [name UTF8String], value);
}

- (void)setMessageUserTagWithUid:(OFString*)uid name:(OFString*)name value:(OFString*)value
{
	camel_folder_set_message_user_tag([self FOLDER], [uid UTF8String], [name UTF8String], [value UTF8String]);
}

- (void)sortUids:(GPtrArray*)uids
{
	camel_folder_sort_uids([self FOLDER], uids);
}

- (void)synchronizeWithExpunge:(bool)expunge ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_synchronize([self FOLDER], expunge, ioPriority, cancellable, callback, userData);
}

- (bool)synchronizeFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_folder_synchronize_finish([self FOLDER], result, err);
}

- (void)synchronizeMessageWithMessageUid:(OFString*)messageUid ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_synchronize_message([self FOLDER], [messageUid UTF8String], ioPriority, cancellable, callback, userData);
}

- (bool)synchronizeMessageFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_folder_synchronize_message_finish([self FOLDER], result, err);
}

- (bool)synchronizeMessageSyncWithMessageUid:(OFString*)messageUid cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_synchronize_message_sync([self FOLDER], [messageUid UTF8String], cancellable, err);
}

- (bool)synchronizeSyncWithExpunge:(bool)expunge cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_synchronize_sync([self FOLDER], expunge, cancellable, err);
}

- (void)takeFolderSummary:(OGCamelFolderSummary*)summary
{
	camel_folder_take_folder_summary([self FOLDER], [summary FOLDERSUMMARY]);
}

- (void)thaw
{
	camel_folder_thaw([self FOLDER]);
}

- (void)transferMessagesToWithMessageUids:(GPtrArray*)messageUids destination:(OGCamelFolder*)destination deleteOriginals:(bool)deleteOriginals ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_transfer_messages_to([self FOLDER], messageUids, [destination FOLDER], deleteOriginals, ioPriority, cancellable, callback, userData);
}

- (bool)transferMessagesToFinishWithResult:(GAsyncResult*)result transferredUids:(GPtrArray**)transferredUids err:(GError**)err
{
	return camel_folder_transfer_messages_to_finish([self FOLDER], result, transferredUids, err);
}

- (bool)transferMessagesToSyncWithMessageUids:(GPtrArray*)messageUids destination:(OGCamelFolder*)destination deleteOriginals:(bool)deleteOriginals transferredUids:(GPtrArray**)transferredUids cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_transfer_messages_to_sync([self FOLDER], messageUids, [destination FOLDER], deleteOriginals, transferredUids, cancellable, err);
}

- (void)unlock
{
	camel_folder_unlock([self FOLDER]);
}


@end