/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

@class OGESource;
@class OGCancellable;
@class OGInputStream;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESoupSession : OGObject
{

}

/**
 * Functions
 */

/**
 *
 * @return
 */
+ (GQuark)errorQuark;

/**
 * Checks whether e_soup_session_set_force_http1() can be used
 * to force HTTP/1 usage. This depends on the libsoup version
 * the data server had been compiled with.
 *
 * @return %TRUE, when the force of HTTP/1 is supported, %FALSE otherwise
 */
+ (bool)utilGetForceHttp1Supported;

/**
 * Returns bytes read from the message response, when the message send failed.
 * This can be used to examine detailed error returned by the server in
 * the response body.
 *
 * @param message a #SoupMessage
 * @return read message data on failed request, or %NULL, when none had been read
 */
+ (GByteArray*)utilGetMessageBytes:(SoupMessage*)message;

/**
 * Normalizes the path of the @uri, aka encodes characters, which should
 * be encoded, if needed. Returns, modified URI when any change had been made to the path.
 * It doesn't touch other parts of the @uri.
 *
 * @param uri a #GUri to normalize the path for
 * @return a new #GUri with modified path, or %NULL, when
 *    no change was required.
 */
+ (GUri*)utilNormalizeUriPath:(GUri*)uri;

/**
 * Returns referenced request data for the @message, as being previously
 * set by the e_soup_session_util_set_message_request_body() or
 * e_soup_session_util_set_message_request_body_from_data().
 * 
 * Do not call this function while the @message is queued in
 * a #SoupSession, nor modify the input stream position until
 * the @message lefts the #SoupSession.
 *
 * @param message a #SoupMessage
 * @param outLength length of the input stream
 * @return a new #GInputStream with the request
 *    body being previously set, or %NULL. The @out_length is set to the length
 *    of the returned input stream.
 */
+ (OGInputStream*)utilRefMessageRequestBodyWithMessage:(SoupMessage*)message outLength:(gssize*)outLength;

/**
 * Sets the request body of the @message from the @input_stream of the @length, with optional
 * @content_type. The function makes sure the @message request body is set again
 * when the message is restarted.
 * 
 * The @input_stream should implement the #GSeekable interface.
 *
 * @param message a #SoupMessage
 * @param contentType optional Content-Type of the @data, or %NULL
 * @input_stream (transfer none): the request body data as a #GInputStream
 * @param inputStream
 * @param length length of the @data
 */
+ (void)utilSetMessageRequestBodyWithMessage:(SoupMessage*)message contentType:(OFString*)contentType inputStream:(OGInputStream*)inputStream length:(gssize)length;

/**
 * Sets the request body of the @message from the @data of the @length, with optional
 * @content_type. The function makes sure the @message request body is set again
 * when the message is restarted.
 * 
 * When the @create_copy is %TRUE, the @free_func should be %NULL.
 *
 * @param message a #SoupMessage
 * @param createCopy whether to create copy of the @data
 * @param contentType optional Content-Type of the @data, or %NULL
 * @param data the request body data
 * @param length length of the @data
 * @param freeFunc a free function for the @data, or %NULL
 */
+ (void)utilSetMessageRequestBodyFromDataWithMessage:(SoupMessage*)message createCopy:(bool)createCopy contentType:(OFString*)contentType data:(gconstpointer)data length:(gssize)length freeFunc:(GDestroyNotify)freeFunc;

/**
 * Returns the @reason_phrase, if it's non-%NULL and non-empty, a static string
 * corresponding to @status_code. In case neither that can be found a localized
 * "Unknown error" message is returned.
 *
 * @param statusCode an HTTP status code
 * @param reasonPhrase preferred string to use for the message, or %NULL
 * @return Error text based on given arguments. The returned
 *    value is valid as long as @reason_phrase is not freed.
 */
+ (OFString*)utilStatusToStringWithStatusCode:(guint)statusCode reasonPhrase:(OFString*)reasonPhrase;

/**
 * Constructors
 */
- (instancetype)init:(OGESource*)source;

/**
 * Methods
 */

- (ESoupSession*)castedGObject;

/**
 * Checks result of the @message and sets the @error if it failed.
 * When it failed and the @read_bytes is provided, then these are
 * set to @message's response body, thus it can be used later.
 *
 * @param message a #SoupMessage
 * @param readBytes optional bytes which had been read from the stream, or %NULL
 * @param bytesLength how many bytes had been read; ignored when @read_bytes is %NULL
 * @return Whether succeeded, aka %TRUE, when no error recognized
 *    and %FALSE otherwise.
 */
- (bool)checkResultWithMessage:(SoupMessage*)message readBytes:(gconstpointer)readBytes bytesLength:(gsize)bytesLength;

/**
 *
 * @return A copy of the credentials being
 *    previously set with e_soup_session_set_credentials(), or %NULL when
 *    none are set. Free the returned pointer with e_named_parameters_free(),
 *    when no longer needed.
 */
- (ENamedParameters*)dupCredentials;

/**
 *
 * @return Whether the last connection attempt required any credentials.
 *    Authentications like OAuth2 do not want extra credentials to work.
 */
- (bool)authenticationRequiresCredentials;

/**
 * Returns whether it's forced to use HTTP/1 for the messages
 * created by the @session. See e_soup_session_set_force_http1()
 * for more information about the limitations.
 *
 * @return whether it's forced to use HTTP/1
 */
- (bool)forceHttp1;

/**
 *
 * @return Current log level, as #SoupLoggerLogLevel
 */
- (SoupLoggerLogLevel)logLevel;

/**
 * Returns an #ESource associated with the @session, if such was set in the creation time.
 *
 * @return Associated #ESource with the @session, or %NULL.
 */
- (OGESource*)source;

/**
 * Populates @out_certificate_pem and @out_certificate_errors with the last values
 * returned on #G_TLS_ERROR_BAD_CERTIFICATE error.
 *
 * @param outCertificatePem return location for a server TLS/SSL certificate
 *   in PEM format, when the last operation failed with a TLS/SSL error, or %NULL
 * @param outCertificateErrors return location for a #GTlsCertificateFlags,
 *   with certificate error flags when the operation failed with a TLS/SSL error, or %NULL
 * @return Whether the information was available and set to the out parameters.
 */
- (bool)sslErrorDetailsWithOutCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors;

/**
 * Handles authentication failure and sets appropriate value to the @out_auth_result
 * for the provided @op_error and used @credentials. Converts the @op_error
 * into an appropriate error returned in the @error.
 * 
 * Also updates connection status on the associated #ESource with the @session.
 *
 * @param credentials credentials used for the authentication
 * @param opError a #GError of the authentication operation
 * @param outAuthResult an #ESourceAuthenticationResult with an authentication result
 * @param outCertificatePem return location for a server TLS/SSL certificate
 *   in PEM format, when the last operation failed with a TLS/SSL error, or %NULL
 * @param outCertificateErrors return location for a #GTlsCertificateFlags,
 *   with certificate error flags when the operation failed with a TLS/SSL error, or %NULL
 */
- (void)handleAuthenticationFailureWithCredentials:(const ENamedParameters*)credentials opError:(const GError*)opError outAuthResult:(ESourceAuthenticationResult*)outAuthResult outCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors;

/**
 * Creates a new #SoupMessage, similar to soup_message_new(),
 * but also presets request headers with "User-Agent" to be "Evolution/version"
 * and with "Connection" to be "close".
 * 
 * See also e_soup_session_new_message_from_uri().
 *
 * @param method an HTTP method
 * @param uriString a URI string to use for the request
 * @return a new #SoupMessage, or %NULL on error
 */
- (SoupMessage*)newMessageWithMethod:(OFString*)method uriString:(OFString*)uriString;

/**
 * Creates a new #SoupMessage, similar to soup_message_new_from_uri(),
 * but also presets request headers with "User-Agent" to be "Evolution/version"
 * and with "Connection" to be "close".
 * 
 * See also e_soup_session_new_message().
 *
 * @param method an HTTP method
 * @param uri a #GUri to use for the request
 * @return a new #SoupMessage, or %NULL on error
 */
- (SoupMessage*)newMessageFromUriWithMethod:(OFString*)method uri:(GUri*)uri;

/**
 * Prepares the @message to be a sent asynchronously with
 * e_soup_session_send_message(). The returned pointer is passed
 * to the e_soup_session_send_message() as the prepare_data
 * parameter.
 *
 * @param message a #SoupMessage to prepare for asynchronous send
 * @param cancellable optional #GCancellable object, or %NULL
 * @return prepare data for e_soup_session_send_message(),
 *   or %NULL on error.
 */
- (gpointer)prepareMessageSendSyncWithMessage:(SoupMessage*)message cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously sends the @message. Finish the call with
 * e_soup_session_send_message_finish().
 * 
 * The @prepare_data is a result of the e_soup_session_prepare_message_send_sync()
 * and this function assumes ownership of it. The @prepare_data cannot be used
 * again after this call.
 *
 * @param message a #SoupMessage to send
 * @param ioPriority the I/O priority of the request, like %G_PRIORITY_DEFAULT
 * @param prepareData data returned from e_soup_session_prepare_message_send_sync()
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback the callback to invoke once the request is finished
 * @param userData user data for @callback
 */
- (void)sendMessageWithMessage:(SoupMessage*)message ioPriority:(gint)ioPriority prepareData:(gpointer)prepareData cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the call of e_soup_session_send_message(). This is supposed to
 * be called from the callback passed to the e_soup_session_send_message().
 * 
 * The optional @out_certificate_pem and @out_certificate_errors are set,
 * when provided, only if the operation failed with a TLS/SSL error.
 * 
 * Make sure the #GInputStream is read and freed from the same thread,
 * and with the same thread default main context, which this function
 * was called from, otherwise it can break libsoup3.
 *
 * @param result a #GAsyncResult object
 * @param outCertificatePem return location for a server TLS/SSL certificate
 *   in PEM format, when the last operation failed with a TLS/SSL error
 * @param outCertificateErrors return location for a #GTlsCertificateFlags,
 *   with certificate error flags when the operation failed with a TLS/SSL error
 * @return a #GInputStream for reading the response body, or %NULL on error
 */
- (OGInputStream*)sendMessageFinishWithResult:(GAsyncResult*)result outCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors;

/**
 * Similar to e_soup_session_send_message_sync(), except it reads
 * whole response content into memory and returns it as a #GByteArray.
 * Use e_soup_session_send_message_sync() when you want to have
 * more control on the content read.
 *
 * @param message a #SoupMessage to send
 * @param cancellable optional #GCancellable object, or %NULL
 * @return A newly allocated #GByteArray,
 *    which contains whole content from the URI pointed to by @message.
 */
- (GByteArray*)sendMessageSimpleSyncWithMessage:(SoupMessage*)message cancellable:(OGCancellable*)cancellable;

/**
 * Synchronously sends prepared message and returns #GInputStream
 * that can be used to read its contents.
 * 
 * This calls soup_session_send() internally, but it also setups
 * the @message according to #ESoupSession:source authentication
 * settings. It also extracts information about used certificate,
 * in case of G_TLS_ERROR_BAD_CERTIFICATE error and keeps it
 * for later use by e_soup_session_get_ssl_error_details().
 * 
 * Use e_soup_session_send_message_simple_sync() to read whole
 * content into a #GByteArray.
 * 
 * Note that SoupSession doesn't log content read from GInputStream,
 * thus the caller may print the read content on its own when needed.
 * 
 * Note the @message is fully filled only after there is anything
 * read from the resulting #GInputStream, thus use
 * e_soup_session_check_result() to verify that the receive had
 * been finished properly.
 * 
 * Make sure the #GInputStream is read and freed from the same thread,
 * and with the same thread default main context, which this function
 * was called from, otherwise it can break libsoup3.
 *
 * @param message a #SoupMessage to send
 * @param cancellable optional #GCancellable object, or %NULL
 * @return A newly allocated #GInputStream,
 *    that can be used to read from the URI pointed to by @message.
 *    Free it with g_object_unref(), when no longer needed.
 */
- (OGInputStream*)sendMessageSyncWithMessage:(SoupMessage*)message cancellable:(OGCancellable*)cancellable;

/**
 * Sets credentials to use for connection. Using %NULL for @credentials
 * unsets previous value.
 *
 * @param credentials an #ENamedParameters with credentials to use, or %NULL
 */
- (void)setCredentials:(const ENamedParameters*)credentials;

/**
 * Sets whether the messages created through the @session using
 * e_soup_session_new_message() or e_soup_session_new_message_from_uri()
 * should force use of the HTTP/1, instead of trying HTTP/2 and fallback to HTTP/1,
 * when the newer version cannot be used.
 * 
 * The property has no effect when e_soup_session_util_get_force_http1_supported()
 * returns %FALSE.
 *
 * @param forceHttp1 the value to set
 */
- (void)setForceHttp1:(bool)forceHttp1;

/**
 * Setups logging for the @session. The @logging_level can be one of:
 * "all" - log whole raw communication;
 * "body" - the same as "all";
 * "headers" - log the headers only;
 * "min" - minimal logging;
 * "1" - the same as "all".
 * Any other value, including %NULL, disables logging.
 * 
 * Use e_soup_session_get_log_level() to get current log level.
 *
 * @param loggingLevel logging level to setup, or %NULL
 */
- (void)setupLogging:(OFString*)loggingLevel;

@end