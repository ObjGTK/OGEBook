/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelObject.h"

@class OGCamelSession;
@class OGCamelSettings;
@class OGCancellable;
@class OGTask;

@interface OGCamelService : OGCamelObject
{

}


/**
 * Methods
 */

- (CamelService*)castedGObject;

/**
 * Asynchronously attempts to authenticate @service using @mechanism and,
 * if necessary, @service's #CamelService:password property.  The function
 * makes only ONE attempt at authentication and does not loop.
 * 
 * Generally this function should only be called from a #CamelSession
 * subclass in order to implement its own authentication loop.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_service_authenticate_finish() to get the result of
 * the operation.
 *
 * @param mechanism a SASL mechanism name, or %NULL
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)authenticateWithMechanism:(OFString*)mechanism ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_service_authenticate().
 * 
 * If the authentication attempt completed and the server accepted the
 * credentials, the function returns #CAMEL_AUTHENTICATION_ACCEPTED.
 * 
 * If the authentication attempt completed but the server rejected the
 * credentials, the function returns #CAMEL_AUTHENTICATION_REJECTED.
 * 
 * If the authentication attempt failed to complete due to a network
 * communication issue or some other mishap, the function sets @error
 * and returns #CAMEL_AUTHENTICATION_ERROR.
 *
 * @param result a #GAsyncResult
 * @return the authentication result
 */
- (CamelAuthenticationResult)authenticateFinish:(GAsyncResult*)result;

/**
 * Attempts to authenticate @service using @mechanism and, if necessary,
 * @service's #CamelService:password property.  The function makes only
 * ONE attempt at authentication and does not loop.
 * 
 * If the authentication attempt completed and the server accepted the
 * credentials, the function returns #CAMEL_AUTHENTICATION_ACCEPTED.
 * 
 * If the authentication attempt completed but the server rejected the
 * credentials, the function returns #CAMEL_AUTHENTICATION_REJECTED.
 * 
 * If the authentication attempt failed to complete due to a network
 * communication issue or some other mishap, the function sets @error
 * and returns #CAMEL_AUTHENTICATION_ERROR.
 * 
 * Generally this function should only be called from a #CamelSession
 * subclass in order to implement its own authentication loop.
 *
 * @param mechanism a SASL mechanism name, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the authentication result
 */
- (CamelAuthenticationResult)authenticateSyncWithMechanism:(OFString*)mechanism cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously connects @service to a remote server using the information
 * in its #CamelService:settings instance.
 * 
 * If a connect operation is already in progress when this function is
 * called, its results will be reflected in this connect operation.
 * 
 * If any disconnect operations are in progress when this function is
 * called, they will be cancelled.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_service_connect_finish() to get the result of the
 * operation.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)connectWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_service_connect().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if the connection was made or %FALSE otherwise
 */
- (bool)connectFinish:(GAsyncResult*)result;

/**
 * Connects @service to a remote server using the information in its
 * #CamelService:settings instance.
 * 
 * If a connect operation is already in progress when this function is
 * called, its results will be reflected in this connect operation.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE if the connection is made or %FALSE otherwise
 */
- (bool)connectSync:(OGCancellable*)cancellable;

/**
 * If a disconnect operation is already in progress when this function is
 * called, its results will be reflected in this disconnect operation.
 * 
 * If any connect operations are in progress when this function is called,
 * they will be cancelled.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_service_disconnect_finish() to get the result of the
 * operation.
 *
 * @param clean whether or not to try to disconnect cleanly
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)disconnectWithClean:(bool)clean ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_service_disconnect().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if the connection was severed or %FALSE otherwise
 */
- (bool)disconnectFinish:(GAsyncResult*)result;

/**
 * Disconnect from the service. If @clean is %FALSE, it should not
 * try to do any synchronizing or other cleanup of the connection.
 * 
 * If a disconnect operation is already in progress when this function is
 * called, its results will be reflected in this disconnect operation.
 * 
 * If any connect operations are in progress when this function is called,
 * they will be cancelled.
 *
 * @param clean whether or not to try to disconnect cleanly
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE if the connection was severed or %FALSE otherwise
 */
- (bool)disconnectSyncWithClean:(bool)clean cancellable:(OGCancellable*)cancellable;

/**
 * Thread-safe variation of camel_service_get_display_name().
 * Use this function when accessing @service from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #CamelService:display-name
 */
- (OFString*)dupDisplayName;

/**
 * Thread-safe variation of camel_service_get_password().
 * Use this function when accessing @service from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #CamelService:password
 */
- (OFString*)dupPassword;

/**
 * Returns the connection status for @service.
 *
 * @return the connection status
 */
- (CamelServiceConnectionStatus)connectionStatus;

/**
 * Returns the display name for @service, or %NULL if @service has not
 * been given a display name.  The display name is intended for use in
 * a user interface and should generally be given a user-defined name.
 * 
 * Compare this with camel_service_get_name(), which returns a built-in
 * description of the type of service (IMAP, SMTP, etc.).
 *
 * @return the display name for @service, or %NULL
 */
- (OFString*)displayName;

/**
 * This gets the name of the service in a "friendly" (suitable for
 * humans) form. If @brief is %TRUE, this should be a brief description
 * such as for use in the folder tree. If @brief is %FALSE, it should
 * be a more complete and mostly unambiguous description.
 *
 * @param brief whether or not to use a briefer form
 * @return a description of the service which the caller must free
 */
- (OFString*)name:(bool)brief;

/**
 * Returns the password for @service.  Some SASL mechanisms use this
 * when attempting to authenticate.
 *
 * @return the password for @service
 */
- (OFString*)password;

/**
 * Gets the #CamelProvider associated with the service.
 *
 * @return the #CamelProvider
 */
- (CamelProvider*)provider;

/**
 * Gets the unique identifier string associated with the service.
 *
 * @return the UID string
 */
- (OFString*)uid;

/**
 * Returns the base directory under which to store cache data
 * for @service.  The directory is formed by appending the directory
 * returned by camel_session_get_user_cache_dir() with the service's
 * #CamelService:uid value.
 *
 * @return the base cache directory for @service
 */
- (OFString*)userCacheDir;

/**
 * Returns the base directory under which to store user-specific data
 * for @service.  The directory is formed by appending the directory
 * returned by camel_session_get_user_data_dir() with the service's
 * #CamelService:uid value.
 *
 * @return the base directory for @service
 */
- (OFString*)userDataDir;

/**
 * Performs any necessary file migrations for @service.  This should be
 * called after installing or configuring the @service's #CamelSettings,
 * since it requires building a URL string for @service.
 *
 */
- (void)migrateFiles;

/**
 * Returns a new #CamelURL representing @service.
 * Free the returned #CamelURL with camel_url_free().
 *
 * @return a new #CamelURL
 */
- (CamelURL*)newCamelUrl;

/**
 * Asynchronously obtains a list of authentication types supported by
 * @service.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_service_query_auth_types_finish() to get the result
 * of the operation.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)queryAuthTypesWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_service_query_auth_types().
 * Free the returned list with g_list_free().
 *
 * @param result a #GAsyncResult
 * @return a list of #CamelServiceAuthType structs
 */
- (GList*)queryAuthTypesFinish:(GAsyncResult*)result;

/**
 * Obtains a list of authentication types supported by @service.
 * Free the returned list with g_list_free().
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return a list of #CamelServiceAuthType structs
 */
- (GList*)queryAuthTypesSync:(OGCancellable*)cancellable;

/**
 * Adds @task to a queue of waiting tasks with the same source object.
 * Queued tasks execute one at a time in the order they were added.  When
 * @task reaches the front of the queue, it will be dispatched by invoking
 * @task_func in a separate thread.  If @task is cancelled while queued,
 * it will complete immediately with an appropriate error.
 * 
 * This is primarily intended for use by #CamelStore, #CamelTransport and
 * #CamelFolder to achieve ordered invocation of synchronous class methods.
 *
 * @param task a #GTask
 * @param taskFunc function to call when @task is dispatched
 */
- (void)queueTaskWithTask:(OGTask*)task taskFunc:(GTaskThreadFunc)taskFunc;

/**
 * Returns the #GProxyResolver for @service.  If an application needs to
 * override this, it should do so prior to calling functions on @service
 * that may require a network connection.
 * 
 * The returned #GProxyResolver is referenced for thread-safety and must
 * be unreferenced with g_object_unref() when finished with it.
 *
 * @return a #GProxyResolver, or %NULL
 */
- (GProxyResolver*)refProxyResolver;

/**
 * Returns the #CamelSession associated with the service.
 * 
 * The returned #CamelSession is referenced for thread-safety.  Unreference
 * the #CamelSession with g_object_unref() when finished with it.
 *
 * @return the #CamelSession
 */
- (OGCamelSession*)refSession;

/**
 * Returns the #CamelSettings instance associated with the service.
 * 
 * The returned #CamelSettings is referenced for thread-safety and must
 * be unreferenced with g_object_unref() when finished with it.
 *
 * @return the #CamelSettings
 */
- (OGCamelSettings*)refSettings;

/**
 * Assigns a UTF-8 display name to @service.  The display name is intended
 * for use in a user interface and should generally be given a user-defined
 * name.
 * 
 * Compare this with camel_service_get_name(), which returns a built-in
 * description of the type of service (IMAP, SMTP, etc.).
 *
 * @param displayName a valid UTF-8 string, or %NULL
 */
- (void)setDisplayName:(OFString*)displayName;

/**
 * Sets the password for @service.  Use this function to cache the password
 * in memory after obtaining it through camel_session_get_password().  Some
 * SASL mechanisms use this when attempting to authenticate.
 *
 * @param password the password for @service
 */
- (void)setPassword:(OFString*)password;

/**
 * Sets the #GProxyResolver for @service.  If an application needs to
 * override this, it should do so prior to calling functions on @service
 * that may require a network connection.
 *
 * @param proxyResolver a #GProxyResolver, or %NULL for the default
 */
- (void)setProxyResolver:(GProxyResolver*)proxyResolver;

/**
 * Associates a new #CamelSettings instance with the service.
 * The @settings instance must match the settings type defined in
 * #CamelServiceClass.  If @settings is %NULL, a new #CamelSettings
 * instance of the appropriate type is created with all properties
 * set to defaults.
 *
 * @param settings an instance derviced from #CamelSettings, or %NULL
 */
- (void)setSettings:(OGCamelSettings*)settings;

@end