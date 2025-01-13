/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelService;
@class OGCancellable;

@interface OGCamelSasl : OGObject
{

}

/**
 * Functions
 */
+ (void)load;


/**
 *
 * @param mechanism the SASL mechanism to get an authtype for
 * @return a #CamelServiceAuthType for the given mechanism, if
 * it is supported.
 */
+ (CamelServiceAuthType*)authtypeWithMechanism:(OFString*)mechanism;

/**
 *
 * @param includePlain whether or not to include the PLAIN mechanism
 * @return a #GList of SASL-supported authtypes. The caller must
 * free the list, but not the contents.
 */
+ (GList*)authtypeListWithIncludePlain:(bool)includePlain;

/**
 * Checks whether exists a #CamelSasl method for the @mechanism and
 * whether it derives from #CamelSaslXOAuth2. Such mechanisms are
 * also treated as XOAUTH2, even their real name is different.
 *
 * @param mechanism an authentication mechanism
 * @return whether exists #CamelSasl for the given @mechanism,
 *    which also derives from #CamelSaslXOAuth2.
 */
+ (bool)isXoauth2AliasWithMechanism:(OFString*)mechanism;

/**
 * Constructors
 */
+ (instancetype)saslWithServiceName:(OFString*)serviceName mechanism:(OFString*)mechanism service:(OGCamelService*)service;

/**
 * Methods
 */

- (CamelSasl*)castedGObject;

/**
 * If @token is %NULL, asynchronously generate the initial SASL message
 * to send to the server.  (This will be %NULL if the client doesn't
 * initiate the exchange.)  Otherwise, @token is a challenge from the
 * server, and the asynchronous result is the response.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_sasl_challenge_finish() to get the result of the operation.
 *
 * @param token a token, or %NULL
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)challengeWithToken:(GByteArray*)token ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * As with camel_sasl_challenge(), but the challenge @token and the
 * response are both base64-encoded.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_sasl_challenge_base64_finish() to get the result of
 * the operation.
 *
 * @param token a base64-encoded token
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)challengeBase64WithToken:(OFString*)token ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_sasl_challenge_base64().
 *
 * @param result a #GAsyncResult
 * @return the base64-encoded response
 */
- (OFString*)challengeBase64FinishWithResult:(GAsyncResult*)result;

/**
 * As with camel_sasl_challenge_sync(), but the challenge @token and the
 * response are both base64-encoded.
 *
 * @param token a base64-encoded token
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the base64-encoded response
 */
- (OFString*)challengeBase64SyncWithToken:(OFString*)token cancellable:(OGCancellable*)cancellable;

/**
 * Finishes the operation started with camel_sasl_challenge().  Free the
 * returned #GByteArray with g_byte_array_free().
 *
 * @param result a #GAsyncResult
 * @return the SASL response or %NULL.  If an
 * error occurred, @error will also be set.
 */
- (GByteArray*)challengeFinishWithResult:(GAsyncResult*)result;

/**
 * If @token is %NULL, generate the initial SASL message to send to
 * the server.  (This will be %NULL if the client doesn't initiate the
 * exchange.)  Otherwise, @token is a challenge from the server, and
 * the return value is the response.
 * 
 * Free the returned #GByteArray with g_byte_array_free().
 *
 * @param token a token, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the SASL response or %NULL. If an error
 * occurred, @error will also be set.
 */
- (GByteArray*)challengeSyncWithToken:(GByteArray*)token cancellable:(OGCancellable*)cancellable;

/**
 *
 * @return whether or not @sasl has successfully authenticated the
 * user. This will be %TRUE after it returns the last needed response.
 * The caller must still pass that information on to the server and
 * verify that it has accepted it.
 */
- (bool)authenticated;

/**
 *
 * @return
 */
- (OFString*)mechanism;

/**
 *
 * @return
 */
- (OGCamelService*)service;

/**
 *
 * @return
 */
- (OFString*)serviceName;

/**
 *
 * @param authenticated whether we have successfully authenticated
 */
- (void)setAuthenticated:(bool)authenticated;

/**
 * Asynchronously determine whether @sasl can be used for password-less
 * authentication, for example single-sign-on using system credentials.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_sasl_try_empty_password_finish() to get the result of the
 * operation.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)tryEmptyPasswordWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_sasl_try_empty_password().
 *
 * @param result a #GAsyncResult
 * @return the SASL response.  If an error occurred, @error will also be set.
 */
- (bool)tryEmptyPasswordFinishWithResult:(GAsyncResult*)result;

/**
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether or not @sasl can attempt to authenticate without a
 * password being provided by the caller. This will be %TRUE for an
 * authentication method which can attempt to use single-sign-on
 * credentials, but which can fall back to using a provided password
 * so it still has the @need_password flag set in its description.
 */
- (bool)tryEmptyPasswordSyncWithCancellable:(OGCancellable*)cancellable;

@end