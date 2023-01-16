/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

@class OGESource;

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
 * Normalizes the path of the @suri, aka encodes characters, which should
 * be encoded, if needed. Returns, whether any change had been made to the path.
 * It doesn't touch other parts of the @suri.
 *
 * @param suri a #SoupURI to normalize the path for
 * @return whether made any changes
 */
+ (bool)utilNormalizeUriPath:(SoupURI*)suri;

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

- (ESoupSession*)SOUPSESSION;

/**
 * Checks result of the @request and sets the @error if it failed.
 * When it failed and the @read_bytes is provided, then these are
 * set to @request's message response_body, thus it can be used
 * later.
 *
 * @param request a #SoupRequestHTTP
 * @param readBytes optional bytes which had been read from the stream, or %NULL
 * @param bytesLength how many bytes had been read; ignored when @read_bytes is %NULL
 * @param err
 * @return Whether succeeded, aka %TRUE, when no error recognized
 *    and %FALSE otherwise.
 */
- (bool)checkResultWithRequest:(SoupRequestHTTP*)request readBytes:(gconstpointer)readBytes bytesLength:(gsize)bytesLength err:(GError**)err;

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
 *
 * @return Current log level, as #SoupLoggerLogLevel
 */
- (SoupLoggerLogLevel)logLevel;

/**
 *
 * @return Associated #ESource with the @session.
 */
- (OGESource*)source;

/**
 * Populates @out_certificate_pem and @out_certificate_errors with the last values
 * returned on #SOUP_STATUS_SSL_FAILED error.
 *
 * @param outCertificatePem return location for a server TLS/SSL certificate
 *   in PEM format, when the last operation failed with a TLS/SSL error
 * @param outCertificateErrors return location for a #GTlsCertificateFlags,
 *   with certificate error flags when the the operation failed with a TLS/SSL error
 * @return Whether the information was available and set to the out parameters.
 */
- (bool)sslErrorDetailsWithOutCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors;

/**
 * Creates a new #SoupRequestHTTP, similar to soup_session_request_http(),
 * but also presets request headers with "User-Agent" to be "Evolution/version"
 * and with "Connection" to be "close".
 * 
 * See also e_soup_session_new_request_uri().
 *
 * @param method an HTTP method
 * @param uriString a URI string to use for the request
 * @param err
 * @return a new #SoupRequestHTTP, or %NULL on error
 */
- (SoupRequestHTTP*)newRequestWithMethod:(OFString*)method uriString:(OFString*)uriString err:(GError**)err;

/**
 * Creates a new #SoupRequestHTTP, similar to soup_session_request_http_uri(),
 * but also presets request headers with "User-Agent" to be "Evolution/version"
 * and with "Connection" to be "close".
 * 
 * See also e_soup_session_new_request().
 *
 * @param method an HTTP method
 * @param uri a #SoupURI to use for the request
 * @param err
 * @return a new #SoupRequestHTTP, or %NULL on error
 */
- (SoupRequestHTTP*)newRequestUriWithMethod:(OFString*)method uri:(SoupURI*)uri err:(GError**)err;

/**
 * Similar to e_soup_session_send_request_sync(), except it reads
 * whole response content into memory and returns it as a #GByteArray.
 * Use e_soup_session_send_request_sync() when you want to have
 * more control on the content read.
 * 
 * The function prints read content to stdout when
 * e_soup_session_get_log_level() returns #SOUP_LOGGER_LOG_BODY.
 *
 * @param request a #SoupRequestHTTP to send
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return A newly allocated #GByteArray,
 *    which contains whole content from the URI pointed to by @request.
 */
- (GByteArray*)sendRequestSimpleSyncWithRequest:(SoupRequestHTTP*)request cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Synchronously sends prepared request and returns #GInputStream
 * that can be used to read its contents.
 * 
 * This calls soup_request_send() internally, but it also setups
 * the request according to #ESoupSession:source authentication
 * settings. It also extracts information about used certificate,
 * in case of SOUP_STATUS_SSL_FAILED error and keeps it for later use
 * by e_soup_session_get_ssl_error_details().
 * 
 * Use e_soup_session_send_request_simple_sync() to read whole
 * content into a #GByteArray.
 * 
 * Note that SoupSession doesn't log content read from GInputStream,
 * thus the caller may print the read content on its own when needed.
 * 
 * Note the @request is fully filled only after there is anything
 * read from the resulting #GInputStream, thus use
 * e_soup_session_check_result() to verify that the receive had
 * been finished properly.
 *
 * @param request a #SoupRequestHTTP to send
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return A newly allocated #GInputStream,
 *    that can be used to read from the URI pointed to by @request.
 *    Free it with g_object_unref(), when no longer needed.
 */
- (GInputStream*)sendRequestSyncWithRequest:(SoupRequestHTTP*)request cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Sets credentials to use for connection. Using %NULL for @credentials
 * unsets previous value.
 *
 * @param credentials an #ENamedParameters with credentials to use, or %NULL
 */
- (void)setCredentials:(const ENamedParameters*)credentials;

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