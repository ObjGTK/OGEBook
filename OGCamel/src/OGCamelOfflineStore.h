/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStore.h"

@class OGCancellable;

@interface OGCamelOfflineStore : OGCamelStore
{

}


/**
 * Methods
 */

- (CamelOfflineStore*)castedGObject;

/**
 * Returns a #GPtrArray of #CamelFolder objects which should be checked
 * for offline synchronization. Free the returned pointer with the below
 * calls, when no longer needed:
 * 
 * |[
 *     g_ptr_array_foreach (array, (GFunc) g_object_unref, NULL);
 *     g_ptr_array_free (array, TRUE);
 * ]|
 *
 * @return an array with folders
 *   to be checked for offline synchronization.
 */
- (GPtrArray*)dupDownsyncFolders;

/**
 * Returns %TRUE if @store is online.
 *
 * @return
 */
- (bool)online;

/**
 * Downloads messages for offline, when setup to do so and when
 * the host is reachable.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)prepareForOfflineSync:(OGCancellable*)cancellable;

/**
 * Check whether the @store requires synchronization for offline usage.
 * This is not blocking, it only checks settings on the store and its
 * currently opened folders.
 * 
 * Returns %TRUE if the @store requires synchronization for offline usage
 *
 * @return
 */
- (bool)requiresDownsync;

/**
 * An asynchronous variant of camel_offline_store_set_online_sync().
 * Call camel_offline_store_set_online_finish() from within the @callback.
 *
 * @param online %TRUE for online, %FALSE for offline
 * @param ioPriority the I/O priority for the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)setOnlineWithOnline:(bool)online ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_offline_store_set_online().
 *
 * @param result a #GAsyncResult
 * @return Whether succeeded.
 */
- (bool)setOnlineFinish:(GAsyncResult*)result;

/**
 * Sets the online/offline state of @store according to @online.
 *
 * @param online %TRUE for online, %FALSE for offline
 * @param cancellable optional #GCancellable object, or %NULL
 * @return Whether succeeded.
 * 
 * See: camel_offline_store_set_online
 */
- (bool)setOnlineSyncWithOnline:(bool)online cancellable:(OGCancellable*)cancellable;

@end