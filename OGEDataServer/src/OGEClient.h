/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

@class OGESource;
@class OGCancellable;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGEClient : OGObject
{

}

/**
 * Functions
 */
+ (void)load;


/**
 *
 * @param code an #EClientError code to create
 * @param customMsg custom message to use for the error; can be %NULL
 * @return a new #GError containing an #E_CLIENT_ERROR of the given
 *    @code. If the @custom_msg is NULL, then the error message is the one returned
 *    from e_client_error_to_string() for the @code, otherwise the given message is used.
 *    Returned pointer should be freed with g_error_free().
 */
+ (GError*)errorCreateWithCode:(EClientError)code customMsg:(OFString*)customMsg;

/**
 *
 * @return
 */
+ (GQuark)errorQuark;

/**
 * Get localized human readable description of the given error code.
 *
 * @param code an #EClientError error code
 * @return Localized human readable description of the given error code
 */
+ (OFString*)errorToStringWithCode:(EClientError)code;

/**
 * Use e_util_copy_object_slist() instead.
 *
 * @param copyTo Where to copy; may be %NULL
 * @param objects #GSList of #GObject<!-- -->s to be copied
 * @return New head of @copy_to.
 * The returned pointer can be freed with e_client_util_free_object_slist().
 */
+ (GSList*)utilCopyObjectSlistWithCopyTo:(GSList*)copyTo objects:(const GSList*)objects;

/**
 * Use e_util_copy_string_slist() instead.
 *
 * @param copyTo Where to copy; may be %NULL
 * @param strings #GSList of strings to be copied
 * @return New head of @copy_to.
 * The returned pointer can be freed with e_client_util_free_string_slist().
 */
+ (GSList*)utilCopyStringSlistWithCopyTo:(GSList*)copyTo strings:(const GSList*)strings;

/**
 * Calls g_object_unref() on each member of @objects and then frees @objects
 * itself.
 *
 * @param objects a #GSList of #GObject<!-- -->s
 */
+ (void)utilFreeObjectSlist:(GSList*)objects;

/**
 * Use g_slist_free_full() instead.
 *
 * @param strings a #GSList of strings (gchar *)
 */
+ (void)utilFreeStringSlist:(GSList*)strings;

/**
 * Parses comma-separated list of values into #GSList.
 *
 * @param strings string of comma-separated values
 * @return Newly allocated #GSList of
 * newly allocated strings corresponding to values parsed from @strings.
 * Free the returned pointer with e_client_util_free_string_slist().
 */
+ (GSList*)utilParseCommaStrings:(OFString*)strings;

/**
 * Convert a list of strings into a %NULL-terminated array of strings.
 *
 * @param strings a #GSList of strings (const gchar *)
 * @return Newly allocated %NULL-terminated array of strings.
 * The returned pointer should be freed with g_strfreev().
 * 
 * Note: Paired function for this is e_client_util_strv_to_slist().
 */
+ (gchar**)utilSlistToStrvWithStrings:(const GSList*)strings;

/**
 * Use e_util_strv_to_slist() instead.
 *
 * @param strv a %NULL-terminated array of strings (const gchar *)
 * @return Newly allocated #GSList of
 * newly allocated strings. The returned pointer should be freed with
 * e_client_util_free_string_slist().
 * 
 * Note: Paired function for this is e_client_util_slist_to_strv().
 */
+ (GSList*)utilStrvToSlist:(const gchar* const*)strv;

/**
 * The function takes a @dbus_error and tries to find a match in @known_errors
 * for it, if it is a G_IO_ERROR, G_IO_ERROR_DBUS_ERROR. If it is anything else
 * then the @dbus_error is moved to @client_error.
 * 
 * The @fail_when_none_matched influences behaviour. If it's %TRUE, and none of
 * @known_errors matches, or this is not a G_IO_ERROR_DBUS_ERROR, then %FALSE
 * is returned and the @client_error is left without change. Otherwise, the
 * @fail_when_none_matched is %FALSE, the error is always processed and will
 * result in E_CLIENT_ERROR, E_CLIENT_ERROR_OTHER_ERROR if none of @known_error
 * matches.
 *
 * @param dbusError DBus #GError to unwrap
 * @param clientError Resulting #GError; can be %NULL
 * @param knownErrors List of known errors against which try to match
 * @param knownErrorsCount How many items are stored in @known_errors
 * @param knownErrorsDomain Error domain for @known_errors
 * @param failWhenNoneMatched Whether to fail when none of @known_errors matches
 * @return Whether was @dbus_error processed into @client_error.
 * 
 * Note: The @dbus_error is automatically freed if returned %TRUE.
 */
+ (bool)utilUnwrapDbusError:(GError*)dbusError clientError:(GError**)clientError knownErrors:(const EClientErrorsList*)knownErrors knownErrorsCount:(guint)knownErrorsCount knownErrorsDomain:(GQuark)knownErrorsDomain failWhenNoneMatched:(bool)failWhenNoneMatched;

/**
 * Methods
 */

- (EClient*)castedGObject;

/**
 * Cancels all pending operations started on @client.
 *
 */
- (void)cancelAll;

/**
 * Check if backend supports particular capability.
 * To get all capabilities use e_client_get_capabilities().
 *
 * @param capability a capability
 * @return #GSList of const strings of capabilities
 */
- (bool)checkCapability:(OFString*)capability;

/**
 * Checks whether a client supports explicit refreshing
 * (see e_client_refresh()).
 *
 * @return TRUE if the client supports refreshing, FALSE otherwise.
 */
- (bool)checkRefreshSupported;

/**
 * Returns a D-Bus bus name that will be used to connect the
 * client to the backend subprocess.
 *
 * @return a newly-allocated string representing a D-Bus bus
 *          name that will be used to connect the client to
 *          the backend subprocess. The string should be
 *          freed by the caller using g_free().
 */
- (OFString*)dupBusName;

/**
 * Queries @client's backend for a property of name @prop_name.
 * The call is finished by e_client_get_backend_property_finish()
 * from the @callback.
 *
 * @param propName property name, whose value to retrieve; cannot be %NULL
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)backendPropertyWithPropName:(OFString*)propName cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_client_get_backend_property().
 *
 * @param result a #GAsyncResult
 * @param propValue Retrieved backend property value; cannot be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)backendPropertyFinishWithResult:(GAsyncResult*)result propValue:(gchar**)propValue;

/**
 * Queries @client's backend for a property of name @prop_name.
 *
 * @param propName property name, whose value to retrieve; cannot be %NULL
 * @param propValue Retrieved backend property value; cannot be %NULL
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)backendPropertySyncWithPropName:(OFString*)propName propValue:(gchar**)propValue cancellable:(OGCancellable*)cancellable;

/**
 * Get list of strings with capabilities advertised by a backend.
 * This list, together with inner strings, is owned by the @client.
 * To check for individual capabilities use e_client_check_capability().
 *
 * @return #GSList of const strings
 *          of capabilities
 */
- (const GSList*)capabilities;

/**
 * Get the #ESource that this client has assigned.
 *
 * @return The source.
 */
- (OGESource*)source;

/**
 * Check if this @client is connected.
 *
 * @return %TRUE if this @client is connected, otherwise %FALSE.
 */
- (bool)isOnline;

/**
 * Check if this @client is fully opened. This includes
 * everything from e_client_open() call up to the authentication,
 * if required by a backend. Client cannot do any other operation
 * during the opening phase except of authenticate or cancel it.
 * Every other operation results in an %E_CLIENT_ERROR_BUSY error.
 *
 * @return always %TRUE
 */
- (bool)isOpened;

/**
 * Check if this @client is read-only.
 *
 * @return %TRUE if this @client is read-only, otherwise %FALSE.
 */
- (bool)isReadonly;

/**
 * Opens the @client, making it ready for queries and other operations.
 * The call is finished by e_client_open_finish() from the @callback.
 *
 * @param onlyIfExists this parameter is not used anymore
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)openWithOnlyIfExists:(bool)onlyIfExists cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_client_open().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)openFinishWithResult:(GAsyncResult*)result;

/**
 * Opens the @client, making it ready for queries and other operations.
 *
 * @param onlyIfExists this parameter is not used anymore
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)openSyncWithOnlyIfExists:(bool)onlyIfExists cancellable:(OGCancellable*)cancellable;

/**
 * Returns the #GMainContext on which event sources for @client are to
 * be attached.
 * 
 * The returned #GMainContext is referenced for thread-safety and must be
 * unreferenced with g_main_context_unref() when finished with it.
 *
 * @return a #GMainContext
 */
- (GMainContext*)refMainContext;

/**
 * Initiates refresh on the @client. Finishing the method doesn't mean
 * that the refresh is done, backend only notifies whether it started
 * refreshing or not. Use e_client_check_refresh_supported() to check
 * whether the backend supports this method.
 * The call is finished by e_client_refresh_finish() from the @callback.
 *
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)refreshWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_client_refresh().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)refreshFinishWithResult:(GAsyncResult*)result;

/**
 * Initiates refresh on the @client. Finishing the method doesn't mean
 * that the refresh is done, backend only notifies whether it started
 * refreshing or not. Use e_client_check_refresh_supported() to check
 * whether the backend supports this method.
 *
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)refreshSyncWithCancellable:(OGCancellable*)cancellable;

/**
 * Removes the backing data for this #EClient. For example, with the file
 * backend this deletes the database file. You cannot get it back!
 * The call is finished by e_client_remove_finish() from the @callback.
 *
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)removeWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_client_remove().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)removeFinishWithResult:(GAsyncResult*)result;

/**
 * Removes the backing data for this #EClient. For example, with the file
 * backend this deletes the database file. You cannot get it back!
 *
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)removeSyncWithCancellable:(OGCancellable*)cancellable;

/**
 * Initiates retrieval of capabilities on the @client. This is usually
 * required only once, after the @client is opened. The returned value
 * is cached and any subsequent call of e_client_get_capabilities() and
 * e_client_check_capability() is using the cached value.
 * The call is finished by e_client_retrieve_capabilities_finish()
 * from the @callback.
 *
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)retrieveCapabilitiesWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_client_retrieve_capabilities().
 * Returned value of @capabilities should be freed with g_free(),
 * when no longer needed.
 *
 * @param result a #GAsyncResult
 * @param capabilities Comma-separated list of capabilities of the @client
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)retrieveCapabilitiesFinishWithResult:(GAsyncResult*)result capabilities:(gchar**)capabilities;

/**
 * Initiates retrieval of capabilities on the @client. This is usually
 * required only once, after the @client is opened. The returned value
 * is cached and any subsequent call of e_client_get_capabilities() and
 * e_client_check_capability() is using the cached value. Returned value
 * of @capabilities should be freed with g_free(), when no longer needed.
 *
 * @param capabilities Comma-separated list of capabilities of the @client
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)retrieveCapabilitiesSync:(gchar**)capabilities cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously retrieves @client properties to match server-side values,
 * without waiting for the D-Bus property change notifications delivery.
 * 
 * When the operation is finished, @callback will be called. You can then
 * call e_client_retrieve_properties_finish() to get the result of the operation.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)retrievePropertiesWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_client_retrieve_properties().
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)retrievePropertiesFinishWithResult:(GAsyncResult*)result;

/**
 * Retrieves @client properties to match server-side values, without waiting
 * for the D-Bus property change notifications delivery.
 * 
 * If an error occurs, the function sets @error and returns %FALSE.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)retrievePropertiesSyncWithCancellable:(OGCancellable*)cancellable;

/**
 * Sets @client's backend property of name @prop_name
 * to value @prop_value. The call is finished
 * by e_client_set_backend_property_finish() from the @callback.
 *
 * @param propName property name, whose value to change; cannot be %NULL
 * @param propValue property value, to set; cannot be %NULL
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)setBackendPropertyWithPropName:(OFString*)propName propValue:(OFString*)propValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_client_set_backend_property().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)setBackendPropertyFinishWithResult:(GAsyncResult*)result;

/**
 * Sets @client's backend property of name @prop_name
 * to value @prop_value.
 *
 * @param propName property name, whose value to change; cannot be %NULL
 * @param propValue property value, to set; cannot be %NULL
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)setBackendPropertySyncWithPropName:(OFString*)propName propValue:(OFString*)propValue cancellable:(OGCancellable*)cancellable;

/**
 * Sets a D-Bus bus name that will be used to connect the client
 * to the backend subprocess.
 *
 * @param busName a string representing a D-Bus bus name
 */
- (void)setBusName:(OFString*)busName;

/**
 * Unwraps D-Bus error to local error. @dbus_error is automatically freed.
 * @dbus_erorr and @out_error can point to the same variable.
 *
 * @param dbusError a #GError returned bu D-Bus
 */
- (void)unwrapDbusError:(GError*)dbusError;

/**
 * Asynchronously waits until the @client is connected (according
 * to @ESource::connection-status property), but not longer than @timeout_seconds.
 * 
 * The call is finished by e_client_wait_for_connected_finish() from
 * the @callback.
 *
 * @param timeoutSeconds a timeout for the wait, in seconds
 * @param cancellable a #GCancellable; or %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)waitForConnectedWithTimeoutSeconds:(guint32)timeoutSeconds cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_client_wait_for_connected().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)waitForConnectedFinishWithResult:(GAsyncResult*)result;

/**
 * Synchronously waits until the @client is connected (according
 * to @ESource::connection-status property), but not longer than @timeout_seconds.
 * 
 * Note: This also calls e_client_retrieve_properties_sync() on success, to have
 *   up-to-date property values on the client side, without a delay due
 *   to property change notifcations delivery through D-Bus.
 *
 * @param timeoutSeconds a timeout for the wait, in seconds
 * @param cancellable a #GCancellable; or %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)waitForConnectedSyncWithTimeoutSeconds:(guint32)timeoutSeconds cancellable:(OGCancellable*)cancellable;

@end