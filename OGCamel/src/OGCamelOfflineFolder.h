/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFolder.h"

@interface OGCamelOfflineFolder : OGCamelFolder
{

}


/**
 * Methods
 */

- (CamelOfflineFolder*)OFFLINEFOLDER;

/**
 * Checks whether the @folder can run downsync according to its
 * settings (camel_offline_folder_get_offline_sync()) and to
 * the parent's #CamelOfflineStore settings (camel_offline_settings_get_stay_synchronized()).
 *
 * @return %TRUE, when the @folder can be synchronized for offline; %FALSE otherwise.
 */
- (bool)canDownsync;

/**
 * Synchronizes messages in @folder described by the search @expression to
 * the local machine asynchronously for offline availability.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_offline_folder_downsync_finish() to get the result of the
 * operation.
 *
 * @param expression search expression describing which set of messages
 *              to downsync (%NULL for all)
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)downsyncWithExpression:(OFString*)expression ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_offline_folder_downsync().
 *
 * @param result a #GAsyncResult
 * @param err
 * @return %TRUE on success, %FALSE on error
 */
- (bool)downsyncFinishWithResult:(GAsyncResult*)result err:(GError**)err;

/**
 * Synchronizes messages in @folder described by the search @expression to
 * the local machine for offline availability.
 *
 * @param expression search expression describing which set of messages
 *              to downsync (%NULL for all)
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return %TRUE on success, %FALSE on error
 */
- (bool)downsyncSyncWithExpression:(OFString*)expression cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 *
 * @return
 */
- (CamelThreeState)offlineSync;

/**
 * The %CAMEL_THREE_STATE_INCONSISTENT means what the parent store has set.
 *
 * @param offlineSync whether to synchronize for offline use, as a #CamelThreeState enum
 */
- (void)setOfflineSync:(CamelThreeState)offlineSync;

@end