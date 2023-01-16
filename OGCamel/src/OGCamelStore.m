/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStore.h"

#import "OGCamelDB.h"
#import "OGCamelFolder.h"

@implementation OGCamelStore

+ (GQuark)errorQuark
{
	return camel_store_error_quark();
}

- (CamelStore*)STORE
{
	return CAMEL_STORE([self GOBJECT]);
}

- (bool)canRefreshFolderWithInfo:(CamelFolderInfo*)info err:(GError**)err
{
	return camel_store_can_refresh_folder([self STORE], info, err);
}

- (void)createFolderWithParentName:(OFString*)parentName folderName:(OFString*)folderName ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_create_folder([self STORE], [parentName UTF8String], [folderName UTF8String], ioPriority, cancellable, callback, userData);
}

- (CamelFolderInfo*)createFolderFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_store_create_folder_finish([self STORE], result, err);
}

- (CamelFolderInfo*)createFolderSyncWithParentName:(OFString*)parentName folderName:(OFString*)folderName cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_store_create_folder_sync([self STORE], [parentName UTF8String], [folderName UTF8String], cancellable, err);
}

- (void)deleteCachedFolder:(OFString*)folderName
{
	camel_store_delete_cached_folder([self STORE], [folderName UTF8String]);
}

- (void)deleteFolderWithFolderName:(OFString*)folderName ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_delete_folder([self STORE], [folderName UTF8String], ioPriority, cancellable, callback, userData);
}

- (bool)deleteFolderFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_store_delete_folder_finish([self STORE], result, err);
}

- (bool)deleteFolderSyncWithFolderName:(OFString*)folderName cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_store_delete_folder_sync([self STORE], [folderName UTF8String], cancellable, err);
}

- (GPtrArray*)dupOpenedFolders
{
	return camel_store_dup_opened_folders([self STORE]);
}

- (void)folderCreated:(CamelFolderInfo*)folderInfo
{
	camel_store_folder_created([self STORE], folderInfo);
}

- (void)folderDeleted:(CamelFolderInfo*)folderInfo
{
	camel_store_folder_deleted([self STORE], folderInfo);
}

- (void)folderInfoStale
{
	camel_store_folder_info_stale([self STORE]);
}

- (void)folderOpened:(OGCamelFolder*)folder
{
	camel_store_folder_opened([self STORE], [folder FOLDER]);
}

- (void)folderRenamedWithOldName:(OFString*)oldName folderInfo:(CamelFolderInfo*)folderInfo
{
	camel_store_folder_renamed([self STORE], [oldName UTF8String], folderInfo);
}

- (bool)canAutoSaveChanges
{
	return camel_store_get_can_auto_save_changes([self STORE]);
}

- (OGCamelDB*)db
{
	return [[[OGCamelDB alloc] initWithGObject:(GObject*)camel_store_get_db([self STORE])] autorelease];
}

- (guint32)flags
{
	return camel_store_get_flags([self STORE]);
}

- (void)folderWithFolderName:(OFString*)folderName flags:(CamelStoreGetFolderFlags)flags ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_get_folder([self STORE], [folderName UTF8String], flags, ioPriority, cancellable, callback, userData);
}

- (OGCamelFolder*)folderFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_store_get_folder_finish([self STORE], result, err)] autorelease];
}

- (void)folderInfoWithTop:(OFString*)top flags:(CamelStoreGetFolderInfoFlags)flags ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_get_folder_info([self STORE], [top UTF8String], flags, ioPriority, cancellable, callback, userData);
}

- (CamelFolderInfo*)folderInfoFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_store_get_folder_info_finish([self STORE], result, err);
}

- (CamelFolderInfo*)folderInfoSyncWithTop:(OFString*)top flags:(CamelStoreGetFolderInfoFlags)flags cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_store_get_folder_info_sync([self STORE], [top UTF8String], flags, cancellable, err);
}

- (OGCamelFolder*)folderSyncWithFolderName:(OFString*)folderName flags:(CamelStoreGetFolderFlags)flags cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_store_get_folder_sync([self STORE], [folderName UTF8String], flags, cancellable, err)] autorelease];
}

- (CamelObjectBag*)foldersBag
{
	return camel_store_get_folders_bag([self STORE]);
}

- (void)inboxFolderWithIoPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_get_inbox_folder([self STORE], ioPriority, cancellable, callback, userData);
}

- (OGCamelFolder*)inboxFolderFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_store_get_inbox_folder_finish([self STORE], result, err)] autorelease];
}

- (OGCamelFolder*)inboxFolderSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_store_get_inbox_folder_sync([self STORE], cancellable, err)] autorelease];
}

- (void)junkFolderWithIoPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_get_junk_folder([self STORE], ioPriority, cancellable, callback, userData);
}

- (OGCamelFolder*)junkFolderFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_store_get_junk_folder_finish([self STORE], result, err)] autorelease];
}

- (OGCamelFolder*)junkFolderSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_store_get_junk_folder_sync([self STORE], cancellable, err)] autorelease];
}

- (guint32)permissions
{
	return camel_store_get_permissions([self STORE]);
}

- (void)trashFolderWithIoPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_get_trash_folder([self STORE], ioPriority, cancellable, callback, userData);
}

- (OGCamelFolder*)trashFolderFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_store_get_trash_folder_finish([self STORE], result, err)] autorelease];
}

- (OGCamelFolder*)trashFolderSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_store_get_trash_folder_sync([self STORE], cancellable, err)] autorelease];
}

- (void)initialSetupWithIoPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_initial_setup([self STORE], ioPriority, cancellable, callback, userData);
}

- (bool)initialSetupFinishWithResult:(GAsyncResult*)result outSaveSetup:(GHashTable**)outSaveSetup err:(GError**)err
{
	return camel_store_initial_setup_finish([self STORE], result, outSaveSetup, err);
}

- (bool)initialSetupSyncWithOutSaveSetup:(GHashTable**)outSaveSetup cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_store_initial_setup_sync([self STORE], outSaveSetup, cancellable, err);
}

- (bool)maybeRunDbMaintenance:(GError**)err
{
	return camel_store_maybe_run_db_maintenance([self STORE], err);
}

- (void)renameFolderWithOldName:(OFString*)oldName newName:(OFString*)newName ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_rename_folder([self STORE], [oldName UTF8String], [newName UTF8String], ioPriority, cancellable, callback, userData);
}

- (bool)renameFolderFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_store_rename_folder_finish([self STORE], result, err);
}

- (bool)renameFolderSyncWithOldName:(OFString*)oldName newName:(OFString*)newName cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_store_rename_folder_sync([self STORE], [oldName UTF8String], [newName UTF8String], cancellable, err);
}

- (void)setFlags:(guint32)flags
{
	camel_store_set_flags([self STORE], flags);
}

- (void)setPermissions:(guint32)permissions
{
	camel_store_set_permissions([self STORE], permissions);
}

- (void)synchronizeWithExpunge:(bool)expunge ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_synchronize([self STORE], expunge, ioPriority, cancellable, callback, userData);
}

- (bool)synchronizeFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_store_synchronize_finish([self STORE], result, err);
}

- (bool)synchronizeSyncWithExpunge:(bool)expunge cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_store_synchronize_sync([self STORE], expunge, cancellable, err);
}


@end