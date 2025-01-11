/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

@class OGESource;
@class OGESourceCredentialsProviderImpl;
@class OGESourceRegistry;
@class OGCancellable;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceCredentialsProvider : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)sourceCredentialsProvider:(OGESourceRegistry*)registry;

/**
 * Methods
 */

- (ESourceCredentialsProvider*)castedGObject;

/**
 * Returns whether a credentials prompt can be shown for the @source.
 *
 * @param source an #ESource
 * @return %TRUE, when a credentials prompt can be shown for @source, %FALSE otherwise.
 */
- (bool)canPrompt:(OGESource*)source;

/**
 * Returns whether the @source can store its credentials. When %FALSE is returned,
 * an attempt to call e_source_credentials_provider_store() or
 * e_source_credentials_provider_store_sync() will fail for this @source.
 *
 * @param source an #ESource
 * @return %TRUE, when the credentials storing for @source is possible, %FALSE otherwise.
 */
- (bool)canStore:(OGESource*)source;

/**
 * Asynchronously deletes any previously stored credentials for @source.
 * 
 * When the operation is finished, @callback will be called. You can then
 * call e_source_credentials_provider_delete_finish() to get the result
 * of the operation.
 *
 * @param source an #ESource, to lookup credentials for
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)deleteWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_credentials_provider_delete().
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)deleteFinish:(GAsyncResult*)result;

/**
 * Deletes any previously stored credentials for @source.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param source an #ESource, to store credentials for
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)deleteSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously looks up for credentials for @source.
 * 
 * When the operation is finished, @callback will be called. You can then
 * call e_source_credentials_provider_lookup_finish() to get the result
 * of the operation.
 *
 * @param source an #ESource, to lookup credentials for
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)lookupWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_credentials_provider_lookup().
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @param outCredentials return location for the credentials
 * @return %TRUE on success, %FALSE on error
 */
- (bool)lookupFinishWithResult:(GAsyncResult*)result outCredentials:(ENamedParameters**)outCredentials;

/**
 * Looks up the credentials for @source.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param source an #ESource, to lookup credentials for
 * @param cancellable optional #GCancellable object, or %NULL
 * @param outCredentials return location for the credentials
 * @return %TRUE on success, %FALSE on error
 */
- (bool)lookupSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable outCredentials:(ENamedParameters**)outCredentials;

/**
 * Returns a referenced parent #ESource, which holds the credentials for
 * the given @source. This is useful for collections, where the credentials
 * are usually stored on the collection source, thus shared between child
 * sources. When ther eis no such parent source, a %NULL is returned, which
 * means the @source holds credentials for itself.
 *
 * @param source an #ESource
 * @return referenced parent #ESource, which holds
 *    credentials, or %NULL. Unref the returned non-NULL #ESource with
 *    g_object_unref(), when no longer needed.
 */
- (OGESource*)refCredentialsSource:(OGESource*)source;

/**
 * Returns refenrenced registry associated with this @provider.
 *
 * @return Reference registry associated with this @provider. Unref it
 *    with g_object_unref() when no longer needed.
 */
- (GObject*)refRegistry;

/**
 * Returns referenced #ESource with the given @uid, or %NULL, when it could not be found.
 *
 * @param uid an #ESource UID
 * @return Referenced #ESource with the given @uid, or %NULL, when it
 *    could not be found. Unref the returned #ESource with g_object_unref(), when no longer needed.
 */
- (OGESource*)refSource:(OFString*)uid;

/**
 * Registers a credentials provider implementation and adds its own reference on
 * the @provider_impl.
 *
 * @param providerImpl an #ESourceCredentialsProviderImpl
 * @return %TRUE on success, %FALSE on failure, like when there is
 *    the @provider_impl already registered.
 */
- (bool)registerImpl:(OGESourceCredentialsProviderImpl*)providerImpl;

/**
 * Asynchronously stores the @credentials for @source. Note the actual stored
 * values can differ for each storage. In other words, not all named parameters
 * are stored for each @source.
 * 
 * When the operation is finished, @callback will be called. You can then
 * call e_source_credentials_provider_store_finish() to get the result
 * of the operation.
 *
 * @param source an #ESource, to lookup credentials for
 * @param credentials an #ENamedParameters with credentials to store
 * @param permanently store permanently or just for the session
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)storeWithSource:(OGESource*)source credentials:(const ENamedParameters*)credentials permanently:(bool)permanently cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_credentials_provider_store().
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)storeFinish:(GAsyncResult*)result;

/**
 * Stores the @credentials for @source. Note the actual stored values
 * can differ for each storage. In other words, not all named parameters
 * are stored for each @source.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param source an #ESource, to store credentials for
 * @param credentials an #ENamedParameters with credentials to store
 * @param permanently store permanently or just for the session
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)storeSyncWithSource:(OGESource*)source credentials:(const ENamedParameters*)credentials permanently:(bool)permanently cancellable:(OGCancellable*)cancellable;

/**
 * Unregisters previously registered @provider_impl with
 * e_source_credentials_provider_register_impl(). Function does nothing,
 * when the @provider_impl is not registered.
 *
 * @param providerImpl an #ESourceCredentialsProviderImpl
 */
- (void)unregisterImpl:(OGESourceCredentialsProviderImpl*)providerImpl;

@end