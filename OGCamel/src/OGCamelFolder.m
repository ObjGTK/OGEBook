/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFolder.h"

#import "OGCamelFolderSummary.h"
#import "OGCamelMessageInfo.h"
#import "OGCamelMimeMessage.h"
#import "OGCamelStore.h"
#import <OGio/OGCancellable.h>

@implementation OGCamelFolder

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_FOLDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (gint)threadedMessagesDumpWithC:(CamelFolderThreadNode*)c
{
	gint returnValue = (gint)camel_folder_threaded_messages_dump(c);

	return returnValue;
}

- (CamelFolder*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelFolder, CamelFolder);
}

- (void)appendMessage:(OGCamelMimeMessage*)message info:(OGCamelMessageInfo*)info ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_append_message([self castedGObject], [message castedGObject], [info castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)appendMessageFinishWithResult:(GAsyncResult*)result appendedUid:(gchar**)appendedUid
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_append_message_finish([self castedGObject], result, appendedUid, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)appendMessageSync:(OGCamelMimeMessage*)message info:(OGCamelMessageInfo*)info appendedUid:(gchar**)appendedUid cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_append_message_sync([self castedGObject], [message castedGObject], [info castedGObject], appendedUid, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)changedWithChanges:(CamelFolderChangeInfo*)changes
{
	camel_folder_changed([self castedGObject], changes);
}

- (gint)cmpUidsWithUid1:(OFString*)uid1 uid2:(OFString*)uid2
{
	gint returnValue = (gint)camel_folder_cmp_uids([self castedGObject], [uid1 UTF8String], [uid2 UTF8String]);

	return returnValue;
}

- (guint32)countByExpression:(OFString*)expression cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	guint32 returnValue = (guint32)camel_folder_count_by_expression([self castedGObject], [expression UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)delete
{
	camel_folder_delete([self castedGObject]);
}

- (OFString*)dupDescription
{
	gchar* gobjectValue = camel_folder_dup_description([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupDisplayName
{
	gchar* gobjectValue = camel_folder_dup_display_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupFullName
{
	gchar* gobjectValue = camel_folder_dup_full_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)expungeWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_expunge([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)expungeFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_expunge_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)expungeSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_expunge_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)freeDeepWithArray:(GPtrArray*)array
{
	camel_folder_free_deep([self castedGObject], array);
}

- (void)freeShallowWithArray:(GPtrArray*)array
{
	camel_folder_free_shallow([self castedGObject], array);
}

- (void)freeSummaryWithArray:(GPtrArray*)array
{
	camel_folder_free_summary([self castedGObject], array);
}

- (void)freeUidsWithArray:(GPtrArray*)array
{
	camel_folder_free_uids([self castedGObject], array);
}

- (void)freeze
{
	camel_folder_freeze([self castedGObject]);
}

- (gint)deletedMessageCount
{
	gint returnValue = (gint)camel_folder_get_deleted_message_count([self castedGObject]);

	return returnValue;
}

- (OFString*)description
{
	const gchar* gobjectValue = camel_folder_get_description([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)displayName
{
	const gchar* gobjectValue = camel_folder_get_display_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)filenameWithUid:(OFString*)uid
{
	GError* err = NULL;

	gchar* gobjectValue = camel_folder_get_filename([self castedGObject], [uid UTF8String], &err);

	[OGErrorException throwForError:err];

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (guint32)flags
{
	guint32 returnValue = (guint32)camel_folder_get_flags([self castedGObject]);

	return returnValue;
}

- (OGCamelFolderSummary*)folderSummary
{
	CamelFolderSummary* gobjectValue = camel_folder_get_folder_summary([self castedGObject]);

	OGCamelFolderSummary* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (gint)frozenCount
{
	gint returnValue = (gint)camel_folder_get_frozen_count([self castedGObject]);

	return returnValue;
}

- (OFString*)fullDisplayName
{
	const gchar* gobjectValue = camel_folder_get_full_display_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)fullName
{
	const gchar* gobjectValue = camel_folder_get_full_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (CamelThreeState)markSeen
{
	CamelThreeState returnValue = (CamelThreeState)camel_folder_get_mark_seen([self castedGObject]);

	return returnValue;
}

- (gint)markSeenTimeout
{
	gint returnValue = (gint)camel_folder_get_mark_seen_timeout([self castedGObject]);

	return returnValue;
}

- (void)messageWithMessageUid:(OFString*)messageUid ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_get_message([self castedGObject], [messageUid UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (OGCamelMimeMessage*)messageCachedWithMessageUid:(OFString*)messageUid cancellable:(OGCancellable*)cancellable
{
	CamelMimeMessage* gobjectValue = camel_folder_get_message_cached([self castedGObject], [messageUid UTF8String], [cancellable castedGObject]);

	OGCamelMimeMessage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (gint)messageCount
{
	gint returnValue = (gint)camel_folder_get_message_count([self castedGObject]);

	return returnValue;
}

- (OGCamelMimeMessage*)messageFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	CamelMimeMessage* gobjectValue = camel_folder_get_message_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	OGCamelMimeMessage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint32)messageFlagsWithUid:(OFString*)uid
{
	guint32 returnValue = (guint32)camel_folder_get_message_flags([self castedGObject], [uid UTF8String]);

	return returnValue;
}

- (OGCamelMessageInfo*)messageInfoWithUid:(OFString*)uid
{
	CamelMessageInfo* gobjectValue = camel_folder_get_message_info([self castedGObject], [uid UTF8String]);

	OGCamelMessageInfo* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelMimeMessage*)messageSyncWithMessageUid:(OFString*)messageUid cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	CamelMimeMessage* gobjectValue = camel_folder_get_message_sync([self castedGObject], [messageUid UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	OGCamelMimeMessage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)messageUserFlagWithUid:(OFString*)uid name:(OFString*)name
{
	bool returnValue = (bool)camel_folder_get_message_user_flag([self castedGObject], [uid UTF8String], [name UTF8String]);

	return returnValue;
}

- (OFString*)messageUserTagWithUid:(OFString*)uid name:(OFString*)name
{
	const gchar* gobjectValue = camel_folder_get_message_user_tag([self castedGObject], [uid UTF8String], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGCamelStore*)parentStore
{
	CamelStore* gobjectValue = camel_folder_get_parent_store([self castedGObject]);

	OGCamelStore* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint32)permanentFlags
{
	guint32 returnValue = (guint32)camel_folder_get_permanent_flags([self castedGObject]);

	return returnValue;
}

- (void)quotaInfoWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_get_quota_info([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (CamelFolderQuotaInfo*)quotaInfoFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	CamelFolderQuotaInfo* returnValue = (CamelFolderQuotaInfo*)camel_folder_get_quota_info_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (CamelFolderQuotaInfo*)quotaInfoSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	CamelFolderQuotaInfo* returnValue = (CamelFolderQuotaInfo*)camel_folder_get_quota_info_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GPtrArray*)summary
{
	GPtrArray* returnValue = (GPtrArray*)camel_folder_get_summary([self castedGObject]);

	return returnValue;
}

- (GPtrArray*)uids
{
	GPtrArray* returnValue = (GPtrArray*)camel_folder_get_uids([self castedGObject]);

	return returnValue;
}

- (GPtrArray*)uncachedUids:(GPtrArray*)uids
{
	GError* err = NULL;

	GPtrArray* returnValue = (GPtrArray*)camel_folder_get_uncached_uids([self castedGObject], uids, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gint)unreadMessageCount
{
	gint returnValue = (gint)camel_folder_get_unread_message_count([self castedGObject]);

	return returnValue;
}

- (bool)hasSummaryCapability
{
	bool returnValue = (bool)camel_folder_has_summary_capability([self castedGObject]);

	return returnValue;
}

- (bool)isFrozen
{
	bool returnValue = (bool)camel_folder_is_frozen([self castedGObject]);

	return returnValue;
}

- (void)lock
{
	camel_folder_lock([self castedGObject]);
}

- (void)prepareContentRefresh
{
	camel_folder_prepare_content_refresh([self castedGObject]);
}

- (void)purgeMessageCacheWithStartUid:(OFString*)startUid endUid:(OFString*)endUid ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_purge_message_cache([self castedGObject], g_strdup([startUid UTF8String]), g_strdup([endUid UTF8String]), ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)purgeMessageCacheFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_purge_message_cache_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)purgeMessageCacheSyncWithStartUid:(OFString*)startUid endUid:(OFString*)endUid cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_purge_message_cache_sync([self castedGObject], g_strdup([startUid UTF8String]), g_strdup([endUid UTF8String]), [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)refreshInfoWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_refresh_info([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)refreshInfoFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_refresh_info_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)refreshInfoSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_refresh_info_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)renameWithNewName:(OFString*)newName
{
	camel_folder_rename([self castedGObject], [newName UTF8String]);
}

- (GPtrArray*)searchByExpression:(OFString*)expression cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GPtrArray* returnValue = (GPtrArray*)camel_folder_search_by_expression([self castedGObject], [expression UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GPtrArray*)searchByUidsWithExpression:(OFString*)expression uids:(GPtrArray*)uids cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GPtrArray* returnValue = (GPtrArray*)camel_folder_search_by_uids([self castedGObject], [expression UTF8String], uids, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)searchFreeWithResult:(GPtrArray*)result
{
	camel_folder_search_free([self castedGObject], result);
}

- (void)setDescription:(OFString*)description
{
	camel_folder_set_description([self castedGObject], [description UTF8String]);
}

- (void)setDisplayName:(OFString*)displayName
{
	camel_folder_set_display_name([self castedGObject], [displayName UTF8String]);
}

- (void)setFlagsWithFolderFlags:(guint32)folderFlags
{
	camel_folder_set_flags([self castedGObject], folderFlags);
}

- (void)setFullName:(OFString*)fullName
{
	camel_folder_set_full_name([self castedGObject], [fullName UTF8String]);
}

- (void)setLockAsyncWithSkipFolderLock:(bool)skipFolderLock
{
	camel_folder_set_lock_async([self castedGObject], skipFolderLock);
}

- (void)setMarkSeen:(CamelThreeState)markSeen
{
	camel_folder_set_mark_seen([self castedGObject], markSeen);
}

- (void)setMarkSeenTimeout:(gint)timeout
{
	camel_folder_set_mark_seen_timeout([self castedGObject], timeout);
}

- (bool)setMessageFlagsWithUid:(OFString*)uid mask:(guint32)mask set:(guint32)set
{
	bool returnValue = (bool)camel_folder_set_message_flags([self castedGObject], [uid UTF8String], mask, set);

	return returnValue;
}

- (void)setMessageUserFlagWithUid:(OFString*)uid name:(OFString*)name value:(bool)value
{
	camel_folder_set_message_user_flag([self castedGObject], [uid UTF8String], [name UTF8String], value);
}

- (void)setMessageUserTagWithUid:(OFString*)uid name:(OFString*)name value:(OFString*)value
{
	camel_folder_set_message_user_tag([self castedGObject], [uid UTF8String], [name UTF8String], [value UTF8String]);
}

- (void)sortUids:(GPtrArray*)uids
{
	camel_folder_sort_uids([self castedGObject], uids);
}

- (void)synchronizeWithExpunge:(bool)expunge ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_synchronize([self castedGObject], expunge, ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)synchronizeFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_synchronize_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)synchronizeMessageWithMessageUid:(OFString*)messageUid ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_synchronize_message([self castedGObject], [messageUid UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)synchronizeMessageFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_synchronize_message_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)synchronizeMessageSyncWithMessageUid:(OFString*)messageUid cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_synchronize_message_sync([self castedGObject], [messageUid UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)synchronizeSyncWithExpunge:(bool)expunge cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_synchronize_sync([self castedGObject], expunge, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)takeFolderSummary:(OGCamelFolderSummary*)summary
{
	camel_folder_take_folder_summary([self castedGObject], [summary castedGObject]);
}

- (void)thaw
{
	camel_folder_thaw([self castedGObject]);
}

- (void)transferMessagesToWithMessageUids:(GPtrArray*)messageUids destination:(OGCamelFolder*)destination deleteOriginals:(bool)deleteOriginals ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_folder_transfer_messages_to([self castedGObject], messageUids, [destination castedGObject], deleteOriginals, ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)transferMessagesToFinishWithResult:(GAsyncResult*)result transferredUids:(GPtrArray**)transferredUids
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_transfer_messages_to_finish([self castedGObject], result, transferredUids, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)transferMessagesToSyncWithMessageUids:(GPtrArray*)messageUids destination:(OGCamelFolder*)destination deleteOriginals:(bool)deleteOriginals transferredUids:(GPtrArray**)transferredUids cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_folder_transfer_messages_to_sync([self castedGObject], messageUids, [destination castedGObject], deleteOriginals, transferredUids, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)unlock
{
	camel_folder_unlock([self castedGObject]);
}


@end