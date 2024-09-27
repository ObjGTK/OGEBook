/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelService;
@class OGCamelFolder;
@class OGCancellable;
@class OGTlsCertificate;
@class OGCamelMimeMessage;
@class OGCamelFilterDriver;

@interface OGCamelSession : OGObject
{

}


/**
 * Methods
 */

- (CamelSession*)castedGObject;

/**
 * Instantiates a new #CamelService for @session.  The @uid identifies the
 * service for future lookup.  The @protocol indicates which #CamelProvider
 * holds the #GType of the #CamelService subclass to instantiate.  The @type
 * explicitly designates the service as a #CamelStore or #CamelTransport.
 * 
 * If the given @uid has already been added, the existing #CamelService
 * with that @uid is returned regardless of whether it agrees with the
 * given @protocol and @type.
 * 
 * If no #CamelProvider is available to handle the given @protocol, or
 * if the #CamelProvider does not specify a valid #GType for @type, the
 * function sets @error and returns %NULL.
 * 
 * The returned #CamelService is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @param uid a unique identifier string
 * @param protocol the service protocol
 * @param type the service type
 * @return a #CamelService instance, or %NULL on error
 */
- (OGCamelService*)addServiceWithUid:(OFString*)uid protocol:(OFString*)protocol type:(CamelProviderType)type;

/**
 * Look up in an address book @book_uid for an address @email_address
 * and returns whether any such contact exists.
 * 
 * The @book_uid can be either one of the special constants
 * %CAMEL_SESSION_BOOK_UID_ANY or %CAMEL_SESSION_BOOK_UID_COMPLETION,
 * or it can be a UID of a configured address book.
 * 
 * The @email_address can contain multiple addresses, then the function
 * checks whether any of the given addresses is in the address book.
 *
 * @param bookUid an address book UID
 * @param emailAddress an email address to check for
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE, when the @email_address could be found in the @book_uid
 */
- (bool)addressbookContainsSyncWithBookUid:(OFString*)bookUid emailAddress:(OFString*)emailAddress cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously authenticates @service, which may involve repeated calls
 * to camel_service_authenticate() or camel_service_authenticate_sync().
 * A #CamelSession subclass is largely responsible for implementing this,
 * and should handle things like user prompts and secure password storage.
 * These issues are out-of-scope for Camel.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_session_authenticate_finish() to get the result of
 * the operation.
 *
 * @param service a #CamelService
 * @param mechanism a SASL mechanism name, or %NULL
 * @param ioPriority the I/O priority for the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)authenticateWithService:(OGCamelService*)service mechanism:(OFString*)mechanism ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_session_authenticate().
 * 
 * If an error occurred, or if authentication was aborted, the function
 * sets @error and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)authenticateFinish:(GAsyncResult*)result;

/**
 * Authenticates @service, which may involve repeated calls to
 * camel_service_authenticate() or camel_service_authenticate_sync().
 * A #CamelSession subclass is largely responsible for implementing this,
 * and should handle things like user prompts and secure password storage.
 * These issues are out-of-scope for Camel.
 * 
 * If an error occurs, or if authentication is aborted, the function sets
 * @error and returns %FALSE.
 *
 * @param service a #CamelService
 * @param mechanism a SASL mechanism name, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)authenticateSyncWithService:(OGCamelService*)service mechanism:(OFString*)mechanism cancellable:(OGCancellable*)cancellable;

/**
 * This function is used by a #CamelService to tell the application
 * that the authentication information it provided via
 * camel_session_get_password() was rejected by the service. If the
 * application was caching this information, it should stop,
 * and if the service asks for it again, it should ask the user.
 * 
 * @service and @item identify the rejected authentication information,
 * as with camel_session_get_password().
 *
 * @param service the #CamelService rejecting the password
 * @param item an identifier, unique within this service, for the information
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)forgetPasswordWithService:(OGCamelService*)service item:(OFString*)item;

/**
 * Asynchronously forwards @message in @folder to the email address(s)
 * given by @address.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_session_forward_to_finish() to get the result of the
 * operation.
 *
 * @param folder the #CamelFolder where @message is located
 * @param message the #CamelMimeMessage to forward
 * @param address the recipient's email address
 * @param ioPriority the I/O priority for the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)forwardToWithFolder:(OGCamelFolder*)folder message:(OGCamelMimeMessage*)message address:(OFString*)address ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_session_forward_to().
 * 
 * If an error occurred, the function sets @error and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)forwardToFinish:(GAsyncResult*)result;

/**
 * Forwards @message in @folder to the email address(es) given by @address.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param folder the #CamelFolder where @message is located
 * @param message the #CamelMimeMessage to forward
 * @param address the recipient's email address
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)forwardToSyncWithFolder:(OGCamelFolder*)folder message:(OGCamelMimeMessage*)message address:(OFString*)address cancellable:(OGCancellable*)cancellable;

/**
 * The optional @for_folder can be used to determine which filters
 * to add and which not.
 *
 * @param type the type of filter (eg, "incoming")
 * @param forFolder an optional #CamelFolder, for which the filter driver will run, or %NULL
 * @return a filter driver, loaded with applicable rules
 */
- (OGCamelFilterDriver*)filterDriverWithType:(OFString*)type forFolder:(OGCamelFolder*)forFolder;

/**
 * Returns the #CamelJunkFilter instance used to classify messages as
 * junk or not junk during filtering.
 * 
 * Note that #CamelJunkFilter itself is just an interface.  The application
 * must implement the interface and install a #CamelJunkFilter instance for
 * junk filtering to take place.
 *
 * @return a #CamelJunkFilter, or %NULL
 */
- (CamelJunkFilter*)junkFilter;

/**
 *
 * @return Currently used junk
 *    headers as a hash table, previously set by camel_session_set_junk_headers().
 */
- (const GHashTable*)junkHeaders;

/**
 * Obtains the OAuth 2.0 access token for @service along with its expiry
 * in seconds from the current time (or 0 if unknown).
 * 
 * Free the returned access token with g_free() when no longer needed.
 *
 * @param service a #CamelService
 * @param outAccessToken return location for the access token, or %NULL
 * @param outExpiresIn return location for the token expiry, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)oauth2AccessTokenSyncWithService:(OGCamelService*)service outAccessToken:(gchar**)outAccessToken outExpiresIn:(gint*)outExpiresIn cancellable:(OGCancellable*)cancellable;

/**
 *
 * @return whether or not @session is online
 */
- (bool)online;

/**
 * This function is used by a #CamelService to ask the application and
 * the user for a password or other authentication data.
 * 
 * @service and @item together uniquely identify the piece of data the
 * caller is concerned with.
 * 
 * @prompt is a question to ask the user (if the application doesn't
 * already have the answer cached). If %CAMEL_SESSION_PASSWORD_SECRET
 * is set, the user's input will not be echoed back.
 * 
 * If %CAMEL_SESSION_PASSWORD_STATIC is set, it means the password returned
 * will be stored statically by the caller automatically, for the current
 * session.
 * 
 * The authenticator should set @error to %G_IO_ERROR_CANCELLED if
 * the user did not provide the information. The caller must g_free()
 * the information returned when it is done with it.
 *
 * @param service the #CamelService this query is being made by
 * @param prompt prompt to provide to user
 * @param item an identifier, unique within this service, for the information
 * @param flags %CAMEL_SESSION_PASSWORD_REPROMPT, the prompt should force a reprompt
 * %CAMEL_SESSION_PASSWORD_SECRET, whether the password is secret
 * %CAMEL_SESSION_PASSWORD_STATIC, the password is remembered externally
 * @return the authentication information or %NULL on error
 */
- (OFString*)passwordWithService:(OGCamelService*)service prompt:(OFString*)prompt item:(OFString*)item flags:(guint32)flags;

/**
 * Searches for S/MIME certificates or PGP keys for the given @recipients,
 * which are returned as base64 encoded strings in @out_certificates.
 * This is used when encrypting messages. The @flags influence what
 * the @out_certificates will contain. The order of items in @out_certificates
 * should match the order of items in @recipients, with %NULL data for those
 * which could not be found.
 * 
 * The function should return failure only if some fatal error happened.
 * It's not an error when certificates for some, or all, recipients
 * could not be found.
 * 
 * This method is optional and the default implementation returns %TRUE
 * and sets the @out_certificates to %NULL. It's the only exception
 * when the length of @recipients and @out_certificates can differ.
 * In all other cases the length of the two should match.
 * 
 * The @out_certificates will be freed with g_slist_free_full (certificates, g_free);
 * when done with it.
 *
 * @param flags bit-or of #CamelRecipientCertificateFlags
 * @param recipients a #GPtrArray of recipients
 * @param outCertificates a #GSList of gathered certificates
 * @param cancellable optional #GCancellable object, or %NULL
 * @return Whether succeeded, or better whether no fatal error happened.
 */
- (bool)recipientCertificatesSyncWithFlags:(guint32)flags recipients:(const GPtrArray*)recipients outCertificates:(GSList**)outCertificates cancellable:(OGCancellable*)cancellable;

/**
 * Returns the base directory under which to store user-specific mail cache.
 *
 * @return the base directory for mail cache
 */
- (OFString*)userCacheDir;

/**
 * Returns the base directory under which to store user-specific mail data.
 *
 * @return the base directory for mail data
 */
- (OFString*)userDataDir;

/**
 * Adds a function to be called whenever there are no higher priority events
 * pending.  If @function returns %FALSE it is automatically removed from the
 * list of event sources and will not be called again.
 * 
 * This internally creates a main loop source using g_idle_source_new()
 * and attaches it to @session's own #CamelSession:main-context using
 * g_source_attach().
 * 
 * The @priority is typically in the range between %G_PRIORITY_DEFAULT_IDLE
 * and %G_PRIORITY_HIGH_IDLE.
 *
 * @param priority the priority of the idle source
 * @param function a function to call
 * @param data data to pass to @function
 * @param notify function to call when the idle is removed, or %NULL
 * @return the ID (greater than 0) of the event source
 */
- (guint)idleAddWithPriority:(gint)priority function:(GSourceFunc)function data:(gpointer)data notify:(GDestroyNotify)notify;

/**
 * Returns a list of all #CamelService objects previously added using
 * camel_session_add_service().
 * 
 * The services returned in the list are referenced for thread-safety.
 * They must each be unreferenced with g_object_unref() when finished
 * with them.  Free the returned list itself with g_list_free().
 * 
 * An easy way to free the list property in one step is as follows:
 * 
 * |[
 *   g_list_free_full (list, g_object_unref);
 * ]|
 *
 * @return an unsorted list of #CamelService objects
 */
- (GList*)listServices;

/**
 * Looks up for the @name in address books.
 *
 * @param name a name/address to lookup for
 * @return whether found the @name in any address book.
 */
- (bool)lookupAddressbook:(OFString*)name;

/**
 * Returns the #GMainContext on which event sources for @session are to
 * be attached.
 *
 * @return a #GMainContext
 */
- (GMainContext*)refMainContext;

/**
 * References a #GNetworkMonitor instance, which had been previously set
 * by camel_session_set_network_monitor(). If none is set, then the default
 * #GNetworkMonitor is returned, as provided by g_network_monitor_get_default().
 * The returned pointer is referenced for thread safety, unref it with
 * g_object_unref() when no longer needed.
 *
 * @return A referenced #GNetworkMonitor instance to use
 *   for network availability tests.
 */
- (GNetworkMonitor*)refNetworkMonitor;

/**
 * Looks up a #CamelService by its unique identifier string.  The service
 * must have been previously added using camel_session_add_service().
 * 
 * The returned #CamelService is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @param uid a unique identifier string
 * @return a #CamelService instance, or %NULL
 */
- (OGCamelService*)refService:(OFString*)uid;

/**
 * Looks up a #CamelService by trying to match its #CamelURL against the
 * given @url and then checking that the object is of the desired @type.
 * The service must have been previously added using
 * camel_session_add_service().
 * 
 * The returned #CamelService is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 * 
 * Note this function is significantly slower than camel_session_ref_service().
 *
 * @param url a #CamelURL
 * @param type a #CamelProviderType
 * @return a #CamelService instance, or %NULL
 */
- (OGCamelService*)refServiceByUrlWithUrl:(CamelURL*)url type:(CamelProviderType)type;

/**
 * Removes a #CamelService previously added by camel_session_add_service().
 *
 * @param service the #CamelService to remove
 */
- (void)removeService:(OGCamelService*)service;

/**
 * Removes all #CamelService instances added by camel_session_add_service().
 * 
 * This can be useful during application shutdown to ensure all #CamelService
 * instances are freed properly, especially since #CamelSession instances are
 * prone to reference cycles.
 *
 */
- (void)removeServices;

/**
 * Installs the #CamelJunkFilter instance used to classify messages as
 * junk or not junk during filtering.
 * 
 * Note that #CamelJunkFilter itself is just an interface.  The application
 * must implement the interface and install a #CamelJunkFilter instance for
 * junk filtering to take place.
 *
 * @param junkFilter a #CamelJunkFilter, or %NULL
 */
- (void)setJunkFilter:(CamelJunkFilter*)junkFilter;

/**
 *
 * @param headers
 * @param values
 * @param len the length of the headers and values arrays
 */
- (void)setJunkHeadersWithHeaders:(const gchar**)headers values:(const gchar**)values len:(gint)len;

/**
 * Sets a network monitor instance for the @session. This can be used
 * to override which #GNetworkMonitor should be used to check network
 * availability and whether a server is reachable.
 *
 * @param networkMonitor a #GNetworkMonitor or %NULL
 */
- (void)setNetworkMonitor:(GNetworkMonitor*)networkMonitor;

/**
 * Sets the online status of @session to @online.
 *
 * @param online whether or not the session should be online
 */
- (void)setOnline:(bool)online;

/**
 * This function provides a simple mechanism for providers to initiate
 * low-priority background jobs.  Jobs can be submitted from any thread,
 * but execution of the jobs is always as follows:
 * 
 * 1) The #CamelSession:job-started signal is emitted from the thread
 *    in which @session was created.  This is typically the same thread
 *    that hosts the global default #GMainContext, or "main" thread.
 * 
 * 2) The @callback function is invoked from a different thread where
 *    it's safe to call synchronous functions.
 * 
 * 3) Once @callback has returned, the #CamelSesson:job-finished signal
 *    is emitted from the same thread as #CamelSession:job-started was
 *    emitted.
 * 
 * 4) Finally if a @notify function was provided, it is invoked and
 *    passed @user_data so that @user_data can be freed.
 *
 * @param description human readable description of the job, shown to a user
 * @param callback a #CamelSessionCallback
 * @param userData user data passed to the callback
 * @param notify a #GDestroyNotify function
 */
- (void)submitJobWithDescription:(OFString*)description callback:(CamelSessionCallback)callback userData:(gpointer)userData notify:(GDestroyNotify)notify;

/**
 * Prompts the user whether to accept @certificate for @service.  The
 * set of flags given in @errors indicate why the @certificate failed
 * validation.
 * 
 * If an error occurs during prompting or if the user declines to respond,
 * the function returns #CAMEL_CERT_TRUST_UNKNOWN and the certificate will
 * be rejected.
 *
 * @param service a #CamelService
 * @param certificate the peer's #GTlsCertificate
 * @param errors the problems with @certificate
 * @return the user's trust level for @certificate
 */
- (CamelCertTrust)trustPromptWithService:(OGCamelService*)service certificate:(OGTlsCertificate*)certificate errors:(GTlsCertificateFlags)errors;

/**
 * Emits a #CamelSession:user_alert signal from an idle source on the main
 * loop.  The idle source's priority is #G_PRIORITY_LOW.
 * 
 * The purpose of the signal is to propagate a server-issued alert message
 * from @service to a user interface.  The @type hints at the nature of the
 * alert message.
 *
 * @param service a #CamelService
 * @param type a #CamelSessionAlertType
 * @param message the message for the user
 */
- (void)userAlertWithService:(OGCamelService*)service type:(CamelSessionAlertType)type message:(OFString*)message;

@end