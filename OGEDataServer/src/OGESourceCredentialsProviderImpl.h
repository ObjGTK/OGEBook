/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEExtension.h"

@class OGESource;
@class OGESourceCredentialsProvider;
@class OGCancellable;

/**
 * Credentials provider implementation base structure. The descendants
 * implement the virtual methods. The descendants are automatically
 * registered into an #ESourceCredentialsProvider.
 *
 */
@interface OGESourceCredentialsProviderImpl : OGEExtension
{

}


/**
 * Methods
 */

- (ESourceCredentialsProviderImpl*)castedGObject;

/**
 * Returns whether the @provider_impl can process credentials for the @source.
 *
 * @param source an #ESource
 * @return Whether the @provider_impl can process credentials for the @source.
 */
- (bool)canProcess:(OGESource*)source;

/**
 * Returns whether credential prompt can be done for the @provider_impl.
 *
 * @return Whether credential prompt can be done for the @provider_impl.
 */
- (bool)canPrompt;

/**
 * Returns whether the @provider_impl can store credentials.
 *
 * @return Whether the @provider_impl can store credentials.
 */
- (bool)canStore;

/**
 * Asks @provider_impl to delete any stored credentials for @source.
 * 
 * Default implementation returns %FALSE and sets #G_IO_ERROR_NOT_SUPPORTED error.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param source an #ESource
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)deleteSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable;

/**
 * Returns an #ESourceCredentialsProvider with which the @provider_impl is associated.
 *
 * @return an #ESourceCredentialsProvider
 */
- (OGESourceCredentialsProvider*)provider;

/**
 * Asks @provider_impl to lookup for stored credentials for @source.
 * The @out_credentials is populated with them. If the result is not
 * %NULL, then it should be freed with e_named_parameters_free() when
 * no longer needed.
 * 
 * Default implementation returns %FALSE and sets #G_IO_ERROR_NOT_SUPPORTED error.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param source an #ESource
 * @param cancellable optional #GCancellable object, or %NULL
 * @param outCredentials an #ENamedParameters to be set with stored credentials
 * @return %TRUE on success, %FALSE on error
 */
- (bool)lookupSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable outCredentials:(ENamedParameters**)outCredentials;

/**
 * Asks @provider_impl to store @credentials for @source.
 * 
 * Default implementation returns %FALSE and sets #G_IO_ERROR_NOT_SUPPORTED error.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param source an #ESource
 * @param credentials an #ENamedParameters containing credentials to store
 * @param permanently whether to store credentials permanently, or for the current session only
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)storeSyncWithSource:(OGESource*)source credentials:(const ENamedParameters*)credentials permanently:(bool)permanently cancellable:(OGCancellable*)cancellable;

@end