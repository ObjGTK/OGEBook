/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

@class OGCamelService;
@class OGCancellable;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESource : OGObject
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * Converts a #GParamSpec name (e.g. "foo-bar" or "foo_bar")
 * to "CamelCase" for use as a #GKeyFile key (e.g. "FooBar").
 * 
 * This function is made public only to aid in account migration.
 * Applications should not need to use this.
 *
 * @param paramName a #GParamSpec name
 * @return
 */
+ (OFString*)parameterToKey:(OFString*)paramName;

/**
 * Constructors
 */
+ (instancetype)sourceWithDbusObject:(GDBusObject*)dbusObject mainContext:(GMainContext*)mainContext;
+ (instancetype)sourceWithUidWithUid:(OFString*)uid mainContext:(GMainContext*)mainContext;

/**
 * Methods
 */

- (ESource*)castedGObject;

/**
 * This function essentially glues together @source and @serivce so their
 * configuration settings stay synchronized.  The glue itself is a shared
 * #CamelSettings instance.
 * 
 * Call this function immediately after creating a new #CamelService with
 * camel_session_add_service().
 *
 * @param service a #CamelService
 */
- (void)camelConfigureService:(OGCamelService*)service;

/**
 * Emits the #ESource::changed signal from an idle callback in
 * @source's #ESource:main-context.
 * 
 * This function is primarily intended for use by #ESourceExtension
 * when emitting a #GObject::notify signal on one of its properties.
 *
 */
- (void)changed;

/**
 * Compares two #ESource instances by their display names.  Useful for
 * ordering sources in a user interface.
 *
 * @param source2 the second #ESource
 * @return a negative value if @source1 compares before @source2, zero if
 *          they compare equal, or a positive value if @source1 compares
 *          after @source2
 */
- (gint)compareByDisplayName:(OGESource*)source2;

/**
 * Asynchronously deletes the password for @source from either the default
 * keyring or session keyring.  This operation does not rely on the registry
 * service and therefore works for any #ESource -- registered or "scratch".
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_delete_password_finish() to get the result of the operation.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)deletePasswordWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_delete_password().
 * 
 * Note the boolean return value indicates whether the delete operation
 * itself completed successfully, not whether a password was found and
 * deleted.  If no password was found, the function will still return
 * %TRUE.  If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)deletePasswordFinish:(GAsyncResult*)result;

/**
 * Deletes the password for @source from either the default keyring or
 * session keyring.  This operation does not rely on the registry service
 * and therefore works for any #ESource -- registered or "scratch".
 * 
 * Note the boolean return value indicates whether the delete operation
 * itself completed successfully, not whether a password was found and
 * deleted.  If no password was found, the function will still return
 * %TRUE.  If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)deletePasswordSync:(OGCancellable*)cancellable;

/**
 * Thread-safe variation of e_source_get_display_name().
 * Use this function when accessing @source from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESource:display-name
 */
- (OFString*)dupDisplayName;

/**
 * Thread-safe variation of e_source_get_parent().
 * Use this function when accessing @source from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESource:parent
 */
- (OFString*)dupParent;

/**
 * Creates a label string based on @source's #ESource:display-name for use
 * with #SecretItem.
 *
 * @return a newly-allocated secret label
 */
- (OFString*)dupSecretLabel;

/**
 * Thread-safe variation of e_source_get_uid().
 * Use this function when accessing @source from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESource:uid
 */
- (OFString*)dupUid;

/**
 * Emits locally (in this process only) the ESource::credentials-required
 * signal with given parameters. That's the difference with e_source_invoke_credentials_required(),
 * which calls the signal globally, within each client.
 *
 * @param reason an #ESourceCredentialsReason, why the credentials are required
 * @param certificatePem PEM-encoded secure connection certificate, or an empty string
 * @param certificateErrors a bit-or of #GTlsCertificateFlags for secure connection certificate
 * @param opError a #GError with a description of the previous credentials error, or %NULL
 */
- (void)emitCredentialsRequiredWithReason:(ESourceCredentialsReason)reason certificatePem:(OFString*)certificatePem certificateErrors:(GTlsCertificateFlags)certificateErrors opError:(const GError*)opError;

/**
 * Checks two #ESource instances for equality.  #ESource instances are
 * equal if their unique identifier strings are equal.
 *
 * @param source2 the second #ESource
 * @return %TRUE if @source1 and @source2 are equal
 */
- (bool)equal:(OGESource*)source2;

/**
 * Obtain current connection status of the @source.
 *
 * @return Current connection status of the @source.
 */
- (ESourceConnectionStatus)connectionStatus;

/**
 * Returns the display name for @source.  Use the display name to
 * represent the #ESource in a user interface.
 *
 * @return the display name for @source
 */
- (OFString*)displayName;

/**
 * Returns %TRUE if @source is enabled.
 * 
 * An application should try to honor this setting if at all possible,
 * even if it does not provide a way to change the setting through its
 * user interface.  Disabled data sources should generally be hidden.
 * 
 * <note><para>
 *   This function does not take into account @source's ancestors in the
 *   #ESource hierarchy, each of which have their own enabled state.  If
 *   any of @source's ancestors are disabled, then @source itself should
 *   be treated as disabled.  Use e_source_registry_check_enabled() to
 *   easily check for this.
 * </para></note>
 *
 * @return whether @source is enabled
 */
- (bool)enabled;

/**
 * Returns an instance of some #ESourceExtension subclass which registered
 * itself under @extension_name.  If no such instance exists within @source,
 * one will be created.  It is the caller's responsibility to know which
 * subclass is being returned.
 * 
 * If you just want to test for the existence of an extension within @source
 * without creating it, use e_source_has_extension().
 * 
 * Extension instances are owned by their #ESource and should not be
 * referenced directly.  Instead, reference the #ESource instance and
 * use this function to fetch the extension instance as needed.
 *
 * @param extensionName an extension name
 * @return an instance of some
 * #ESourceExtension subclass
 */
- (gpointer)extension:(OFString*)extensionName;

/**
 * Asynchronously calls the GetLastCredentialsRequiredArguments method
 * on the server side, to get the last values used for the 'credentials-required'
 * signal. See e_source_get_last_credentials_required_arguments_sync() for
 * more information.
 * 
 * When the operation is finished, @callback will be called. You can then
 * call e_source_get_last_credentials_required_arguments_finish() to get
 * the result of the operation.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)lastCredentialsRequiredArgumentsWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_get_last_credentials_required_arguments().
 * See e_source_get_last_credentials_required_arguments_sync() for more information
 * about the output arguments.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @param outReason an #ESourceCredentialsReason, why the credentials are required
 * @param outCertificatePem PEM-encoded secure connection certificate, or an empty string
 * @param outCertificateErrors a bit-or of #GTlsCertificateFlags for secure connection certificate
 * @param outOpError a #GError with a description of the previous credentials error
 * @return %TRUE on success, %FALSE on error
 */
- (bool)lastCredentialsRequiredArgumentsFinishWithResult:(GAsyncResult*)result outReason:(ESourceCredentialsReason*)outReason outCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors outOpError:(GError**)outOpError;

/**
 * Retrieves the last used arguments of the 'credentials-required' signal emission.
 * If there was none emitted yet, or a corresponding 'authenitcate' had been emitted
 * already, then the @out_reason is set to #E_SOURCE_CREDENTIALS_REASON_UNKNOWN
 * and the value of other 'out' arguments is set to no values.
 * 
 * If an error occurs, the function sets @error and returns %FALSE. The result gchar
 * values should be freed with g_free() when no longer needed.
 *
 * @param outReason an #ESourceCredentialsReason, why the credentials are required
 * @param outCertificatePem PEM-encoded secure connection certificate, or an empty string
 * @param outCertificateErrors a bit-or of #GTlsCertificateFlags for secure connection certificate
 * @param outOpError a #GError with a description of the previous credentials error
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)lastCredentialsRequiredArgumentsSyncWithOutReason:(ESourceCredentialsReason*)outReason outCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors outOpError:(GError**)outOpError cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously obtains the OAuth 2.0 access token for @source along
 * with its expiry in seconds from the current time (or 0 if unknown).
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_get_oauth2_access_token_finish() to get the result of the
 * operation.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request
 *            is satisfied
 * @param userData data to pass to the callback function
 */
- (void)oauth2AccessTokenWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_get_oauth2_access_token().
 * 
 * Free the returned access token with g_free() when finished with it.
 * If an error occurred, the function will set @error and return %FALSE.
 *
 * @param result a #GAsyncResult
 * @param outAccessToken return location for the access token,
 *                    or %NULL
 * @param outExpiresIn return location for the token expiry,
 *                  or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)oauth2AccessTokenFinishWithResult:(GAsyncResult*)result outAccessToken:(gchar**)outAccessToken outExpiresIn:(gint*)outExpiresIn;

/**
 * Obtains the OAuth 2.0 access token for @source along with its expiry
 * in seconds from the current time (or 0 if unknown).
 * 
 * Free the returned access token with g_free() when finished with it.
 * If an error occurs, the function will set @error and return %FALSE.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param outAccessToken return location for the access token,
 *                    or %NULL
 * @param outExpiresIn return location for the token expiry,
 *                  or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)oauth2AccessTokenSyncWithCancellable:(OGCancellable*)cancellable outAccessToken:(gchar**)outAccessToken outExpiresIn:(gint*)outExpiresIn;

/**
 * Returns the unique identifier string of the parent #ESource.
 *
 * @return the UID of the parent #ESource
 */
- (OFString*)parent;

/**
 * Returns whether new resources can be created on a remote server by
 * calling e_source_remote_create() on @source.
 * 
 * Generally this is only %TRUE if @source has an #ESourceCollection
 * extension, which means there is an #ECollectionBackend in the D-Bus
 * service that can handle create requests.  If @source does not have
 * this capability, calls to e_source_remote_create() will fail.
 *
 * @return whether @source can create remote resources
 */
- (bool)remoteCreatable;

/**
 * Returns whether the resource represented by @source can be deleted
 * from a remote server by calling e_source_remote_delete().
 * 
 * Generally this is only %TRUE if @source is a child of an #ESource
 * which has an #ESourceCollection extension, which means there is an
 * #ECollectionBackend in the D-Bus service that can handle delete
 * requests.  If @source does not have this capability, calls to
 * e_source_remote_delete() will fail.
 *
 * @return whether @source can delete remote resources
 */
- (bool)remoteDeletable;

/**
 * Returns whether the D-Bus service will allow @source to be removed.
 * If @source is not writable, calls to e_source_remove() will fail.
 *
 * @return whether @source is removable
 */
- (bool)removable;

/**
 * Returns the unique identifier string for @source.
 *
 * @return the UID for @source
 */
- (OFString*)uid;

/**
 * Returns whether the D-Bus service will accept changes to @source.
 * If @source is not writable, calls to e_source_write() will fail.
 *
 * @return whether @source is writable
 */
- (bool)writable;

/**
 * Checks whether @source has an #ESourceExtension with the given name.
 *
 * @param extensionName an extension name
 * @return %TRUE if @source has such an extension, %FALSE if not
 */
- (bool)hasExtension:(OFString*)extensionName;

/**
 * Generates a hash value for @source.  This function is intended for
 * easily hashing an #ESource to add to a #GHashTable or similar data
 * structure.
 *
 * @return a hash value for @source.
 */
- (guint)hash;

/**
 * Asynchronously calls the InvokeAuthenticate method on the server side,
 * thus the backend knows what credentials to use to connect to its (possibly
 * remote) data store.
 * 
 * When the operation is finished, @callback will be called. You can then
 * call e_source_invoke_authenticate_finish() to get the result of the operation.
 *
 * @param credentials an #ENamedParameters structure with credentials to use; can be %NULL
 *    to use those from the last call
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)invokeAuthenticateWithCredentials:(const ENamedParameters*)credentials cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_invoke_authenticate().
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)invokeAuthenticateFinish:(GAsyncResult*)result;

/**
 * Calls the InvokeAuthenticate method on the server side, thus the backend
 * knows what credentials to use to connect to its (possibly remote) data store.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param credentials an #ENamedParameters structure with credentials to use; can be %NULL
 *    to use those from the last call
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)invokeAuthenticateSyncWithCredentials:(const ENamedParameters*)credentials cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously calls the InvokeCredentialsRequired method on the server side,
 * to inform clients that credentials are required.
 * 
 * When the operation is finished, @callback will be called. You can then
 * call e_source_invoke_credentials_required_finish() to get the result of the operation.
 *
 * @param reason an #ESourceCredentialsReason, why the credentials are required
 * @param certificatePem PEM-encoded secure connection certificate, or an empty string
 * @param certificateErrors a bit-or of #GTlsCertificateFlags for secure connection certificate
 * @param opError a #GError with a description of the previous credentials error, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)invokeCredentialsRequiredWithReason:(ESourceCredentialsReason)reason certificatePem:(OFString*)certificatePem certificateErrors:(GTlsCertificateFlags)certificateErrors opError:(const GError*)opError cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_invoke_credentials_required().
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)invokeCredentialsRequiredFinish:(GAsyncResult*)result;

/**
 * Let's the client-side know that credentials are required. The @reason defines which
 * parameters are used. The client passed the credentials with an e_source_invoke_authenticate()
 * call.
 * 
 * The %E_SOURCE_CREDENTIALS_REASON_REQUIRED is used for the first credentials prompt,
 * when the client can return credentials as stored from the previous success login.
 * 
 * The %E_SOURCE_CREDENTIALS_REASON_REJECTED is used when the previously used credentials
 * had been rejected by the server. That usually means that the user should be asked
 * to provide/correct the credentials.
 * 
 * The %E_SOURCE_CREDENTIALS_REASON_SSL_FAILED is used when a secured connection failed
 * due to some server-side certificate issues.
 * 
 * The %E_SOURCE_CREDENTIALS_REASON_ERROR is used when the server returned an error.
 * It is not possible to connect to it at the moment usually.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param reason an #ESourceCredentialsReason, why the credentials are required
 * @param certificatePem PEM-encoded secure connection certificate, or an empty string
 * @param certificateErrors a bit-or of #GTlsCertificateFlags for secure connection certificate
 * @param opError a #GError with a description of the previous credentials error, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)invokeCredentialsRequiredSyncWithReason:(ESourceCredentialsReason)reason certificatePem:(OFString*)certificatePem certificateErrors:(GTlsCertificateFlags)certificateErrors opError:(const GError*)opError cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously looks up a password for @source.  Both the default and
 * session keyrings are queried.  This operation does not rely on the
 * registry service and therefore works for any #ESource -- registered
 * or "scratch".
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_lookup_password_finish() to get the result of the operation.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)lookupPasswordWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_lookup_password().
 * 
 * Note the boolean return value indicates whether the lookup operation
 * itself completed successfully, not whether a password was found.  If
 * no password was found, the function will set @out_password to %NULL
 * but still return %TRUE.  If an error occurs, the function sets @error
 * and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @param outPassword return location for the password, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)lookupPasswordFinishWithResult:(GAsyncResult*)result outPassword:(gchar**)outPassword;

/**
 * Looks up a password for @source.  Both the default and session keyrings
 * are queried.  This operation does not rely on the registry service and
 * therefore works for any #ESource -- registered or "scratch".
 * 
 * Note the boolean return value indicates whether the lookup operation
 * itself completed successfully, not whether a password was found.  If
 * no password was found, the function will set @out_password to %NULL
 * but still return %TRUE.  If an error occurs, the function sets @error
 * and returns %FALSE.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param outPassword return location for the password, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)lookupPasswordSyncWithCancellable:(OGCancellable*)cancellable outPassword:(gchar**)outPassword;

/**
 * Asynchronously loads a signature from the signature file for @source,
 * which is given by e_source_mail_signature_get_file().
 * 
 * If the signature file is executable, it will be executed and its output
 * captured as the email signature content.  If the signature file is not
 * executable, the email signature content is read directly from the file.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call e_source_mail_signature_load_finish() to get the result of
 * the operation.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)mailSignatureLoadWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an operation started with e_source_mail_signature_load().  The
 * signature file contents are placed in @contents, and @length is set to
 * the size of the @contents string.  The @contents string should be freed
 * with g_free() when no longer needed.
 *
 * @param result a #GAsyncResult
 * @param contents return location for the signature content
 * @param length return location for the length of the signature
 *          content, or %NULL if the length is not needed
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)mailSignatureLoadFinishWithResult:(GAsyncResult*)result contents:(gchar**)contents length:(gsize*)length;

/**
 * Loads a signature from the signature file for @source, which is
 * given by e_source_mail_signature_get_file().  The signature contents
 * are placed in @contents, and @length is set to the size of the @contents
 * string.  The @contents string should be freed with g_free() when no
 * longer needed.
 * 
 * If the signature file is executable, it will be executed and its output
 * captured as the email signature content.  If the signature file is not
 * executable, the email signature content is read directly from the file.
 *
 * @param contents return location for the signature content
 * @param length return location for the length of the signature
 *          content, or %NULL if the length is not needed
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)mailSignatureLoadSyncWithContents:(gchar**)contents length:(gsize*)length cancellable:(OGCancellable*)cancellable;

/**
 * Asynchrously replaces the signature file for @source with the given
 * @contents of @length bytes.  The signature file for @source is given
 * by e_source_mail_signature_get_file().
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call e_source_mail_signature_replace_finish() to get the result
 * of the operation.
 *
 * @param contents the signature contents
 * @param length the length of @contents in bytes
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)mailSignatureReplaceWithContents:(OFString*)contents length:(gsize)length ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an operation started with e_source_mail_signature_replace().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)mailSignatureReplaceFinish:(GAsyncResult*)result;

/**
 * Replaces the signature file for @source with the given @contents
 * of @length bytes.  The signature file for @source is given by
 * e_source_mail_signature_get_file().
 *
 * @param contents the signature contents
 * @param length the length of @contents in bytes
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)mailSignatureReplaceSyncWithContents:(OFString*)contents length:(gsize)length cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously replaces the signature file for @source with a symbolic
 * link to @symlink_target, which should be an executable file that prints
 * a mail signature to standard output.  The signature file for @source
 * is given by e_source_mail_signature_get_file().
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call e_source_mail_signature_symlink_finish() to get the result
 * of the operation.
 *
 * @param symlinkTarget executable filename to link to
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)mailSignatureSymlinkWithSymlinkTarget:(OFString*)symlinkTarget ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an operation started with e_source_mail_signature_symlink().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)mailSignatureSymlinkFinish:(GAsyncResult*)result;

/**
 * Replaces the signature file for @source with a symbolic link to
 * @symlink_target, which should be an executable file that prints
 * a mail signature to standard output.  The signature file for
 * @source is given by e_source_mail_signature_get_file().
 *
 * @param symlinkTarget executable filename to link to
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)mailSignatureSymlinkSyncWithSymlinkTarget:(OFString*)symlinkTarget cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously determines what proxy, if any, to use to connect to @uri.
 * See e_source_proxy_lookup_sync() for more details.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_proxy_lookup_finish() to get the result of the operation.
 *
 * @param uri a URI representing the destination to connect to
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)proxyLookupWithUri:(OFString*)uri cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_proxy_lookup().
 * 
 * Free the returned proxy URIs with g_strfreev() when finished with them.
 *
 * @param result a #GAsyncResult
 * @return a %NULL-terminated array of proxy
 *    URIs, or %NULL
 */
- (gchar**)proxyLookupFinish:(GAsyncResult*)result;

/**
 * Looks into @source's #ESourceProxy extension to determine what proxy,
 * if any, to use to connect to @uri.  The returned proxy URIs are of the
 * same form described by g_proxy_resolver_lookup().
 * 
 * The proxy extension's #ESourceProxy:method controls how proxy URIs are
 * determined:
 * 
 * When using @E_PROXY_METHOD_DEFAULT, the function will defer to the
 * #GProxyResolver returned by g_proxy_resolver_get_default().
 * 
 * When using @E_PROXY_METHOD_MANUAL, the function will configure a
 * #GSimpleProxyResolver from the HTTP, HTTPS, FTP and SOCKS properties,
 * as well as #ESourceProxy:ignore-hosts.
 * 
 * When using @E_PROXY_METHOD_AUTO, the function will execute a proxy
 * auto-config (PAC) file at #ESourceProxy:autoconfig-url.
 * 
 * When using @E_PROXY_METHOD_NONE, the function will only return
 * <literal>direct://</literal>.
 * 
 * If @source does not have an #ESourceProxy extension, the function sets
 * @error to @G_IO_ERROR_NOT_SUPPORTED and returns %NULL.
 * 
 * Free the returned proxy URIs with g_strfreev() when finished with them.
 *
 * @param uri a URI representing the destination to connect to
 * @param cancellable optional #GCancellable object, or %NULL
 * @return a %NULL-terminated array of proxy URIs,
 *    or %NULL
 */
- (gchar**)proxyLookupSyncWithUri:(OFString*)uri cancellable:(OGCancellable*)cancellable;

/**
 * Returns the #GDBusObject that was passed to e_source_new().
 * 
 * The returned #GDBusObject is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the #GDBusObject for @source, or %NULL
 */
- (GDBusObject*)refDbusObject;

/**
 * Returns the #GMainContext on which event sources for @source are to
 * be attached.
 * 
 * The returned #GMainContext is referenced for thread-safety and must be
 * unreferenced with g_main_context_unref() when finished with it.
 *
 * @return a #GMainContext
 */
- (GMainContext*)refMainContext;

/**
 * This is a simple way to schedule a periodic data source refresh.
 * 
 * Adds a timeout #GSource to @context and handles all the bookkeeping
 * if @source's refresh #ESourceRefresh:enabled state or its refresh
 * #ESourceRefresh:interval-minutes value changes.  The @callback is
 * expected to dispatch an asynchronous job to connect to and fetch
 * updates from a remote server.
 * 
 * The returned ID can be passed to e_source_refresh_remove_timeout() to
 * remove the timeout from @context.  Note the ID is a private handle and
 * cannot be passed to g_source_remove().
 *
 * @param context a #GMainContext, or %NULL (if %NULL, the default
 *           context will be used)
 * @param callback function to call on each timeout
 * @param userData data to pass to @callback
 * @param notify function to call when the timeout is removed,
 *          or %NULL
 * @return a refresh timeout ID
 */
- (guint)refreshAddTimeoutWithContext:(GMainContext*)context callback:(ESourceRefreshFunc)callback userData:(gpointer)userData notify:(GDestroyNotify)notify;

/**
 * For all timeouts added with e_source_refresh_add_timeout(), invokes
 * the #ESourceRefreshFunc callback immediately and then, if the refresh
 * #ESourceRefresh:enabled state is TRUE, reschedules the timeout.
 * 
 * This function is called automatically when the #ESource switches from
 * disabled to enabled, but can also be useful when a network connection
 * becomes available or when waking up from hibernation or suspend.
 *
 */
- (void)refreshForceTimeout;

/**
 * Removes a timeout #GSource added by e_source_refresh_add_timeout().
 *
 * @param refreshTimeoutId a refresh timeout ID
 * @return %TRUE if the timeout was found and removed
 */
- (bool)refreshRemoveTimeout:(guint)refreshTimeoutId;

/**
 * Removes all timeout #GSource's added by e_source_refresh_add_timeout()
 * whose callback data pointer matches @user_data.
 *
 * @param userData user data to match against timeout callbacks
 * @return the number of timeouts found and removed
 */
- (guint)refreshRemoveTimeoutsByData:(gpointer)userData;

/**
 * Asynchronously creates a new remote resource by picking out relevant
 * details from @scratch_source.  The @scratch_source must be an #ESource
 * with no #GDBusObject.  The @source must be #ESource:remote-creatable.
 * 
 * The details required to create the resource vary by #ECollectionBackend,
 * but in most cases the @scratch_source need only define the resource type
 * (address book, calendar, etc.), a display name for the resource, and
 * possibly a server-side path or ID for the resource.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_remote_create_finish() to get the result of the operation.
 *
 * @param scratchSource an #ESource describing the resource to create
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)remoteCreateWithScratchSource:(OGESource*)scratchSource cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_remote_create().  If
 * an error occurred, the function will set @error and return %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)remoteCreateFinish:(GAsyncResult*)result;

/**
 * Creates a new remote resource by picking out relevant details from
 * @scratch_source.  The @scratch_source must be an #ESource with no
 * #GDBusObject.  The @source must be #ESource:remote-creatable.
 * 
 * The details required to create the resource vary by #ECollectionBackend,
 * but in most cases the @scratch_source need only define the resource type
 * (address book, calendar, etc.), a display name for the resource, and
 * possibly a server-side path or ID for the resource.
 * 
 * If an error occurs, the function will set @error and return %FALSE.
 *
 * @param scratchSource an #ESource describing the resource to create
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)remoteCreateSyncWithScratchSource:(OGESource*)scratchSource cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously deletes the resource represented by @source from a remote
 * server.  The @source must be #ESource:remote-deletable.  This will also
 * delete the key file for @source and broadcast its removal to all clients,
 * similar to e_source_remove().
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_remote_delete_finish() to get the result of the operation.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)remoteDeleteWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_remote_delete().  If
 * an error occurred, the function will set @error and return %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)remoteDeleteFinish:(GAsyncResult*)result;

/**
 * Deletes the resource represented by @source from a remote server.
 * The @source must be #ESource:remote-deletable.  This will also delete
 * the key file for @source and broadcast its removal to all clients,
 * similar to e_source_remove_sync().
 * 
 * If an error occurs, the function will set @error and return %FALSE.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)remoteDeleteSync:(OGCancellable*)cancellable;

/**
 * Asynchronously requests the D-Bus service to delete the key files for
 * @source and all of its descendants and broadcast their removal to all
 * clients.  The @source must be #ESource:removable.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_remove_finish() to get the result of the operation.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)removeWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_remove().  If an
 * error occurred, the function will set @error and return %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE of failure
 */
- (bool)removeFinish:(GAsyncResult*)result;

/**
 * Requests the D-Bus service to delete the key files for @source and all of
 * its descendants and broadcast their removal to all clients.  The @source
 * must be #ESource:removable.
 * 
 * If an error occurs, the functon will set @error and return %FALSE.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)removeSync:(OGCancellable*)cancellable;

/**
 * Set's current connection status of the @source.
 *
 * @param connectionStatus one of the #ESourceConnectionStatus
 */
- (void)setConnectionStatus:(ESourceConnectionStatus)connectionStatus;

/**
 * Sets the display name for @source.  The @display_name argument must be a
 * valid UTF-8 string.  Use the display name to represent the #ESource in a
 * user interface.
 * 
 * The internal copy of @display_name is automatically stripped of leading
 * and trailing whitespace.
 *
 * @param displayName a display name
 */
- (void)setDisplayName:(OFString*)displayName;

/**
 * Enables or disables @source.
 * 
 * An application should try to honor this setting if at all possible,
 * even if it does not provide a way to change the setting through its
 * user interface.  Disabled data sources should generally be hidden.
 *
 * @param enabled whether to enable @source
 */
- (void)setEnabled:(bool)enabled;

/**
 * Identifies the parent of @source by its unique identifier string.
 * This can only be set prior to adding @source to an #ESourceRegistry.
 * 
 * The internal copy of #ESource:parent is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param parent the UID of the parent #ESource, or %NULL
 */
- (void)setParent:(OFString*)parent;

/**
 * Asynchronously stores a password for @source.  This operation does
 * not rely on the registry service and therefore works for any #ESource
 * -- registered or "scratch".
 * 
 * If @permanently is %TRUE, the password is stored in the default keyring.
 * Otherwise the password is stored in the memory-only session keyring.  If
 * an error occurs, the function sets @error and returns %FALSE.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_store_password_finish() to get the result of the operation.
 *
 * @param password the password to store
 * @param permanently store permanently or just for the session
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)storePasswordWithPassword:(OFString*)password permanently:(bool)permanently cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_store_password().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)storePasswordFinish:(GAsyncResult*)result;

/**
 * Stores a password for @source.  This operation does not rely on the
 * registry service and therefore works for any #ESource -- registered
 * or "scratch".
 * 
 * If @permanently is %TRUE, the password is stored in the default keyring.
 * Otherwise the password is stored in the memory-only session keyring.  If
 * an error occurs, the function sets @error and returns %FALSE.
 *
 * @param password the password to store
 * @param permanently store permanently or just for the session
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)storePasswordSyncWithPassword:(OFString*)password permanently:(bool)permanently cancellable:(OGCancellable*)cancellable;

/**
 * Outputs the current contents of @source as a key file string.
 * Free the returned string with g_free().
 *
 * @param length return location for the length of the returned
 *          string, or %NULL
 * @return a newly-allocated string
 */
- (OFString*)toString:(gsize*)length;

/**
 * Asynchronously calls the UnsetLastCredentialsRequiredArguments method
 * on the server side, to unset the last values used for the 'credentials-required'
 * signal.
 * 
 * When the operation is finished, @callback will be called. You can then
 * call e_source_unset_last_credentials_required_arguments_finish() to get
 * the result of the operation.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)unsetLastCredentialsRequiredArgumentsWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_unset_last_credentials_required_arguments().
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)unsetLastCredentialsRequiredArgumentsFinish:(GAsyncResult*)result;

/**
 * Unsets the last used arguments of the 'credentials-required' signal emission.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)unsetLastCredentialsRequiredArgumentsSync:(OGCancellable*)cancellable;

/**
 * Asynchronously submits the current contents of @source to the D-Bus
 * service to be written to disk and broadcast to other clients.  The
 * @source must be #ESource:writable.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_write_finish() to get the result of the operation.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)writeWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_write().  If an
 * error occurred, the function will set @error and return %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)writeFinish:(GAsyncResult*)result;

/**
 * Submits the current contents of @source to the D-Bus service to be
 * written to disk and broadcast to other clients.  The @source must
 * be #ESource:writable.
 * 
 * If an error occurs, the functon will set @error and return %FALSE.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)writeSync:(OGCancellable*)cancellable;

@end