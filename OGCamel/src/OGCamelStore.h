/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelService.h"

@class OGCamelDB;
@class OGCamelFolder;
@class OGCancellable;

@interface OGCamelStore : OGCamelService
{

}


/**
 * Methods
 */

- (CamelStore*)castedGObject;

/**
 * Returns if this folder (param info) should be checked for new mail or not.
 * It should not look into sub infos (info->child) or next infos, it should
 * return value only for the actual folder info.
 * Default behavior is that all Inbox folders are intended to be refreshed.
 *
 * @param info a #CamelFolderInfo
 * @return whether folder should be checked for new mails
 */
- (bool)canRefreshFolderWithInfo:(CamelFolderInfo*)info;

/**
 * Asynchronously creates a new folder as a child of an existing folder.
 * @parent_name can be %NULL to create a new top-level folder.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_store_create_folder_finish() to get the result of the operation.
 *
 * @param parentName name of the new folder's parent, or %NULL
 * @param folderName name of the folder to create
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)createFolderWithParentName:(OFString*)parentName folderName:(OFString*)folderName ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_store_create_folder().
 * The returned #CamelFolderInfo struct should be freed with
 * camel_folder_info_free().
 *
 * @param result a #GAsyncResult
 * @return info about the created folder, or %NULL on error
 */
- (CamelFolderInfo*)createFolderFinishWithResult:(GAsyncResult*)result;

/**
 * Creates a new folder as a child of an existing folder.
 * @parent_name can be %NULL to create a new top-level folder.
 * The returned #CamelFolderInfo struct should be freed with
 * camel_folder_info_free().
 *
 * @param parentName name of the new folder's parent, or %NULL
 * @param folderName name of the folder to create
 * @param cancellable optional #GCancellable object, or %NULL
 * @return info about the created folder, or %NULL on error
 */
- (CamelFolderInfo*)createFolderSyncWithParentName:(OFString*)parentName folderName:(OFString*)folderName cancellable:(OGCancellable*)cancellable;

/**
 * Deletes local data for the given @folder_name. The folder should
 * be part of the opened folders.
 * 
 * It doesn't delete the folder in the store (server) as such.
 * Use camel_store_delete_folder(), or its synchronous variant,
 * if you want to do that instead.
 *
 * @param folderName a folder full name to delete from the cache
 */
- (void)deleteCachedFolderWithFolderName:(OFString*)folderName;

/**
 * Asynchronously deletes the folder described by @folder_name.  The
 * folder must be empty.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_store_delete_folder_finish() to get the result of the operation.
 *
 * @param folderName name of the folder to delete
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)deleteFolderWithFolderName:(OFString*)folderName ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_store_delete_folder().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)deleteFolderFinishWithResult:(GAsyncResult*)result;

/**
 * Deletes the folder described by @folder_name.  The folder must be empty.
 *
 * @param folderName name of the folder to delete
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)deleteFolderSyncWithFolderName:(OFString*)folderName cancellable:(OGCancellable*)cancellable;

/**
 * Returns a #GPtrArray of all the opened folders for the @store. The caller owns
 * both the array and the folder references, so to free the array use:
 * 
 * |[
 *     g_ptr_array_foreach (array, (GFunc) g_object_unref, NULL);
 *     g_ptr_array_free (array, TRUE);
 * ]|
 *
 * @return an array with all currently
 *   opened folders for the @store.
 */
- (GPtrArray*)dupOpenedFolders;

/**
 * Emits the #CamelStore::folder-created signal from an idle source on
 * the main loop.  The idle source's priority is #G_PRIORITY_HIGH_IDLE.
 * 
 * This function is only intended for Camel providers.
 *
 * @param folderInfo information about the created folder
 */
- (void)folderCreatedWithFolderInfo:(CamelFolderInfo*)folderInfo;

/**
 * Emits the #CamelStore::folder-deleted signal from an idle source on
 * the main loop.  The idle source's priority is #G_PRIORITY_HIGH_IDLE.
 * 
 * This function is only intended for Camel providers.
 *
 * @param folderInfo information about the deleted folder
 */
- (void)folderDeletedWithFolderInfo:(CamelFolderInfo*)folderInfo;

/**
 * Emits the #CamelStore::folder-info-stale signal from an idle source
 * on the main loop.  The idle source's priority is #G_PRIORITY_LOW.
 * 
 * See the #CamelStore::folder-info-stale documentation for details on
 * when to use this signal.
 * 
 * This function is only intended for Camel providers.
 *
 */
- (void)folderInfoStale;

/**
 * Emits the #CamelStore::folder-opened signal from an idle source on
 * the main loop.  The idle source's priority is #G_PRIORITY_HIGH_IDLE.
 * 
 * This function is only intended for Camel providers.
 *
 * @param folder the #CamelFolder that was opened
 */
- (void)folderOpenedWithFolder:(OGCamelFolder*)folder;

/**
 * Emits the #CamelStore::folder-renamed signal from an idle source on
 * the main loop.  The idle source's priority is #G_PRIORITY_HIGH_IDLE.
 * 
 * This function is only intended for Camel providers.
 *
 * @param oldName the old name of the folder
 * @param folderInfo information about the renamed folder
 */
- (void)folderRenamedWithOldName:(OFString*)oldName folderInfo:(CamelFolderInfo*)folderInfo;

/**
 * Returns whether there can be done automatic save of folder changes.
 * Default is TRUE. The descendants can overwrite it with CamelStoreClass::get_can_auto_save_changes().
 *
 * @return Whether there can be done automatic save of folder changes.
 */
- (bool)canAutoSaveChanges;

/**
 *
 * @return A #CamelDB instance associated with this @store.
 */
- (OGCamelDB*)db;

/**
 *
 * @return bit-or of #CamelStoreFlags set for the @store
 */
- (guint32)flags;

/**
 * Asynchronously gets a specific folder object from @store by name.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_store_get_folder_finish() to get the result of the operation.
 *
 * @param folderName name of the folder to get
 * @param flags folder flags (create, save body index, etc)
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)folderWithFolderName:(OFString*)folderName flags:(CamelStoreGetFolderFlags)flags ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_store_get_folder().
 *
 * @param result a #GAsyncResult
 * @return the requested #CamelFolder object, or
 * %NULL on error
 */
- (OGCamelFolder*)folderFinishWithResult:(GAsyncResult*)result;

/**
 * Asynchronously fetches information about the folder structure of @store,
 * starting with @top.  For details of the behavior, see
 * camel_store_get_folder_info_sync().
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_store_get_folder_info_finish() to get the result of
 * the operation.
 *
 * @param top the name of the folder to start from
 * @param flags various CAMEL_STORE_FOLDER_INFO_* flags to control behavior
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)folderInfoWithTop:(OFString*)top flags:(CamelStoreGetFolderInfoFlags)flags ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_store_get_folder_info().
 * The returned #CamelFolderInfo tree should be freed with
 * camel_folder_info_free().
 *
 * @param result a #GAsyncResult
 * @return a #CamelFolderInfo tree, or %NULL on error
 */
- (CamelFolderInfo*)folderInfoFinishWithResult:(GAsyncResult*)result;

/**
 * This fetches information about the folder structure of @store,
 * starting with @top, and returns a tree of #CamelFolderInfo
 * structures. If @flags includes %CAMEL_STORE_FOLDER_INFO_SUBSCRIBED,
 * only subscribed folders will be listed.   If the store doesn't support
 * subscriptions, then it will list all folders.  If @flags includes
 * %CAMEL_STORE_FOLDER_INFO_RECURSIVE, the returned tree will include
 * all levels of hierarchy below @top. If not, it will only include
 * the immediate subfolders of @top. If @flags includes
 * %CAMEL_STORE_FOLDER_INFO_FAST, the unread_message_count fields of
 * some or all of the structures may be set to -1, if the store cannot
 * determine that information quickly.  If @flags includes
 * %CAMEL_STORE_FOLDER_INFO_NO_VIRTUAL, don't include special virtual
 * folders (such as vTrash or vJunk).
 * 
 * The returned #CamelFolderInfo tree should be freed with
 * camel_folder_info_free().
 * 
 * The CAMEL_STORE_FOLDER_INFO_FAST flag should be considered
 * deprecated; most backends will behave the same whether it is
 * supplied or not.  The only guaranteed way to get updated folder
 * counts is to both open the folder and invoke camel_folder_refresh_info() it.
 *
 * @param top the name of the folder to start from
 * @param flags various CAMEL_STORE_FOLDER_INFO_* flags to control behavior
 * @param cancellable optional #GCancellable object, or %NULL
 * @return a #CamelFolderInfo tree, or %NULL on error
 */
- (CamelFolderInfo*)folderInfoSyncWithTop:(OFString*)top flags:(CamelStoreGetFolderInfoFlags)flags cancellable:(OGCancellable*)cancellable;

/**
 * Gets a specific folder object from @store by name.
 *
 * @param folderName name of the folder to get
 * @param flags folder flags (create, save body index, etc)
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the requested #CamelFolder object, or
 * %NULL on error
 */
- (OGCamelFolder*)folderSyncWithFolderName:(OFString*)folderName flags:(CamelStoreGetFolderFlags)flags cancellable:(OGCancellable*)cancellable;

/**
 *
 * @return a #CamelObjectBag of opened #CamelFolder<!-- -->s
 */
- (CamelObjectBag*)foldersBag;

/**
 * Asynchronously gets the folder in @store into which new mail is delivered.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_store_get_inbox_folder_finish() to get the result of
 * the operation.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)inboxFolderWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_store_get_inbox_folder().
 *
 * @param result a #GAsyncResult
 * @return the inbox folder for @store, or %NULL on
 * error or if no such folder exists
 */
- (OGCamelFolder*)inboxFolderFinishWithResult:(GAsyncResult*)result;

/**
 * Gets the folder in @store into which new mail is delivered.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the inbox folder for @store, or %NULL on
 * error or if no such folder exists
 */
- (OGCamelFolder*)inboxFolderSyncWithCancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously gets the folder in @store into which junk is delivered.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_store_get_junk_folder_finish() to get the result of
 * the operation.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)junkFolderWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_store_get_junk_folder().
 *
 * @param result a #GAsyncResult
 * @return the junk folder for @store, or %NULL on
 * error or if no such folder exists
 */
- (OGCamelFolder*)junkFolderFinishWithResult:(GAsyncResult*)result;

/**
 * Gets the folder in @store into which junk is delivered.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the junk folder for @store, or %NULL on
 * error or if no such folder exists
 */
- (OGCamelFolder*)junkFolderSyncWithCancellable:(OGCancellable*)cancellable;

/**
 *
 * @return Permissions of the @store, a bit-or of #CamelStorePermissionFlags
 */
- (guint32)permissions;

/**
 * Asynchronously gets the folder in @store into which trash is delivered.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_store_get_trash_folder_finish() to get the result of
 * the operation.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)trashFolderWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_store_get_trash_folder().
 *
 * @param result a #GAsyncResult
 * @return the trash folder for @store, or %NULL on
 * error or if no such folder exists
 */
- (OGCamelFolder*)trashFolderFinishWithResult:(GAsyncResult*)result;

/**
 * Gets the folder in @store into which trash is delivered.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the trash folder for @store, or %NULL on
 * error or if no such folder exists
 */
- (OGCamelFolder*)trashFolderSyncWithCancellable:(OGCancellable*)cancellable;

/**
 * Runs initial setup for the @store asynchronously.
 * 
 * When the operation is finished, @callback will be called. You can then
 * call camel_store_initial_setup_finish() to get the result of the operation.
 * 
 * The @store advertises support of this function by including
 * CAMEL_STORE_SUPPORTS_INITIAL_SETUP in CamelStore::flags.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)initialSetupWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_store_initial_setup().
 * 
 * The save_setup result, if not %NULL, should be freed using
 * g_hash_table_destroy(). It's not an error to have it %NULL,
 * it only means the @store doesn't have anything to save.
 *
 * @param result a #GAsyncResult
 * @param outSaveSetup setup values to save
 * @return %TRUE on success, %FALSE on error
 */
- (bool)initialSetupFinishWithResult:(GAsyncResult*)result outSaveSetup:(GHashTable**)outSaveSetup;

/**
 * Runs initial setup for the @store. It's meant to preset some
 * values the first time the account connects to the server after
 * it had been created. The function should return %TRUE even if
 * it didn't populate anything. The default implementation does
 * just that.
 * 
 * The save_setup result, if not %NULL, should be freed using
 * g_hash_table_destroy(). It's not an error to have it %NULL,
 * it only means the @store doesn't have anything to save.
 * Both the key and the value in the hash are newly allocated
 * UTF-8 strings, owned by the hash table.
 * 
 * The @store advertises support of this function by including
 * CAMEL_STORE_SUPPORTS_INITIAL_SETUP in CamelStore::flags.
 *
 * @param outSaveSetup setup values to save
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)initialSetupSyncWithOutSaveSetup:(GHashTable**)outSaveSetup cancellable:(OGCancellable*)cancellable;

/**
 * Checks the state of the current CamelDB used for the @store and eventually
 * runs maintenance routines on it.
 *
 * @return Whether succeeded.
 */
- (bool)maybeRunDbMaintenance;

/**
 * Asynchronously renames the folder described by @old_name to @new_name.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_store_rename_folder_finish() to get the result of the operation.
 *
 * @param oldName the current name of the folder
 * @param newName the new name of the folder
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)renameFolderWithOldName:(OFString*)oldName newName:(OFString*)newName ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_store_rename_folder().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)renameFolderFinishWithResult:(GAsyncResult*)result;

/**
 * Renames the folder described by @old_name to @new_name.
 *
 * @param oldName the current name of the folder
 * @param newName the new name of the folder
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)renameFolderSyncWithOldName:(OFString*)oldName newName:(OFString*)newName cancellable:(OGCancellable*)cancellable;

/**
 * Sets flags for the @store, a bit-or of #CamelStoreFlags.
 *
 * @param flags bit-or of #CamelStoreFlags
 */
- (void)setFlags:(guint32)flags;

/**
 * Sets permissions for the @store, a bit-or of #CamelStorePermissionFlags
 *
 * @param permissions permissions of the @store, a bit-or of #CamelStorePermissionFlags
 */
- (void)setPermissions:(guint32)permissions;

/**
 * Synchronizes any changes that have been made to @store and its folders
 * with the real store asynchronously.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_store_synchronize_finish() to get the result of the operation.
 *
 * @param expunge whether to expunge after synchronizing
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)synchronizeWithExpunge:(bool)expunge ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_store_synchronize().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)synchronizeFinishWithResult:(GAsyncResult*)result;

/**
 * Synchronizes any changes that have been made to @store and its folders
 * with the real store.
 *
 * @param expunge whether to expunge after synchronizing
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)synchronizeSyncWithExpunge:(bool)expunge cancellable:(OGCancellable*)cancellable;

@end