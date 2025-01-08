/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStore.h"

#import "OGCamelDB.h"
#import "OGCamelFolder.h"
#import <OGio/OGCancellable.h>

@implementation OGCamelStore

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_STORE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelStore*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStore, CamelStore);
}

- (bool)canRefreshFolder:(CamelFolderInfo*)info
{
	GError* err = NULL;

	bool returnValue = (bool)camel_store_can_refresh_folder([self castedGObject], info, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)createFolderWithParentName:(OFString*)parentName folderName:(OFString*)folderName ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_create_folder([self castedGObject], [parentName UTF8String], [folderName UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (CamelFolderInfo*)createFolderFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	CamelFolderInfo* returnValue = (CamelFolderInfo*)camel_store_create_folder_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (CamelFolderInfo*)createFolderSyncWithParentName:(OFString*)parentName folderName:(OFString*)folderName cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	CamelFolderInfo* returnValue = (CamelFolderInfo*)camel_store_create_folder_sync([self castedGObject], [parentName UTF8String], [folderName UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)deleteCachedFolder:(OFString*)folderName
{
	camel_store_delete_cached_folder([self castedGObject], [folderName UTF8String]);
}

- (void)deleteFolderWithFolderName:(OFString*)folderName ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_delete_folder([self castedGObject], [folderName UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)deleteFolderFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_store_delete_folder_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)deleteFolderSyncWithFolderName:(OFString*)folderName cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_store_delete_folder_sync([self castedGObject], [folderName UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GPtrArray*)dupOpenedFolders
{
	GPtrArray* returnValue = (GPtrArray*)camel_store_dup_opened_folders([self castedGObject]);

	return returnValue;
}

- (void)folderCreated:(CamelFolderInfo*)folderInfo
{
	camel_store_folder_created([self castedGObject], folderInfo);
}

- (void)folderDeleted:(CamelFolderInfo*)folderInfo
{
	camel_store_folder_deleted([self castedGObject], folderInfo);
}

- (void)folderInfoStale
{
	camel_store_folder_info_stale([self castedGObject]);
}

- (void)folderOpened:(OGCamelFolder*)folder
{
	camel_store_folder_opened([self castedGObject], [folder castedGObject]);
}

- (void)folderRenamedWithOldName:(OFString*)oldName folderInfo:(CamelFolderInfo*)folderInfo
{
	camel_store_folder_renamed([self castedGObject], [oldName UTF8String], folderInfo);
}

- (bool)canAutoSaveChanges
{
	bool returnValue = (bool)camel_store_get_can_auto_save_changes([self castedGObject]);

	return returnValue;
}

- (OGCamelDB*)db
{
	CamelDB* gobjectValue = camel_store_get_db([self castedGObject]);

	OGCamelDB* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint32)flags
{
	guint32 returnValue = (guint32)camel_store_get_flags([self castedGObject]);

	return returnValue;
}

- (void)folderWithFolderName:(OFString*)folderName flags:(CamelStoreGetFolderFlags)flags ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_get_folder([self castedGObject], [folderName UTF8String], flags, ioPriority, [cancellable castedGObject], callback, userData);
}

- (OGCamelFolder*)folderFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	CamelFolder* gobjectValue = camel_store_get_folder_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)folderInfoWithTop:(OFString*)top flags:(CamelStoreGetFolderInfoFlags)flags ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_get_folder_info([self castedGObject], [top UTF8String], flags, ioPriority, [cancellable castedGObject], callback, userData);
}

- (CamelFolderInfo*)folderInfoFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	CamelFolderInfo* returnValue = (CamelFolderInfo*)camel_store_get_folder_info_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (CamelFolderInfo*)folderInfoSyncWithTop:(OFString*)top flags:(CamelStoreGetFolderInfoFlags)flags cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	CamelFolderInfo* returnValue = (CamelFolderInfo*)camel_store_get_folder_info_sync([self castedGObject], [top UTF8String], flags, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OGCamelFolder*)folderSyncWithFolderName:(OFString*)folderName flags:(CamelStoreGetFolderFlags)flags cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	CamelFolder* gobjectValue = camel_store_get_folder_sync([self castedGObject], [folderName UTF8String], flags, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (CamelObjectBag*)foldersBag
{
	CamelObjectBag* returnValue = (CamelObjectBag*)camel_store_get_folders_bag([self castedGObject]);

	return returnValue;
}

- (void)inboxFolderWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_get_inbox_folder([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (OGCamelFolder*)inboxFolderFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	CamelFolder* gobjectValue = camel_store_get_inbox_folder_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelFolder*)inboxFolderSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	CamelFolder* gobjectValue = camel_store_get_inbox_folder_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)junkFolderWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_get_junk_folder([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (OGCamelFolder*)junkFolderFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	CamelFolder* gobjectValue = camel_store_get_junk_folder_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelFolder*)junkFolderSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	CamelFolder* gobjectValue = camel_store_get_junk_folder_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (guint32)permissions
{
	guint32 returnValue = (guint32)camel_store_get_permissions([self castedGObject]);

	return returnValue;
}

- (void)trashFolderWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_get_trash_folder([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (OGCamelFolder*)trashFolderFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	CamelFolder* gobjectValue = camel_store_get_trash_folder_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelFolder*)trashFolderSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	CamelFolder* gobjectValue = camel_store_get_trash_folder_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)initialSetupWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_initial_setup([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)initialSetupFinishWithResult:(GAsyncResult*)result outSaveSetup:(GHashTable**)outSaveSetup
{
	GError* err = NULL;

	bool returnValue = (bool)camel_store_initial_setup_finish([self castedGObject], result, outSaveSetup, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)initialSetupSyncWithOutSaveSetup:(GHashTable**)outSaveSetup cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_store_initial_setup_sync([self castedGObject], outSaveSetup, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)maybeRunDbMaintenance
{
	GError* err = NULL;

	bool returnValue = (bool)camel_store_maybe_run_db_maintenance([self castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)renameFolderWithOldName:(OFString*)oldName newName:(OFString*)newName ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_rename_folder([self castedGObject], [oldName UTF8String], [newName UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)renameFolderFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_store_rename_folder_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)renameFolderSyncWithOldName:(OFString*)oldName newName:(OFString*)newName cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_store_rename_folder_sync([self castedGObject], [oldName UTF8String], [newName UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setFlags:(guint32)flags
{
	camel_store_set_flags([self castedGObject], flags);
}

- (void)setPermissions:(guint32)permissions
{
	camel_store_set_permissions([self castedGObject], permissions);
}

- (void)synchronizeWithExpunge:(bool)expunge ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_store_synchronize([self castedGObject], expunge, ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)synchronizeFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_store_synchronize_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)synchronizeSyncWithExpunge:(bool)expunge cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_store_synchronize_sync([self castedGObject], expunge, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end