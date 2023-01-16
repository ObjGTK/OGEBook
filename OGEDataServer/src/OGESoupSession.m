/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESoupSession.h"

#import "OGESource.h"

@implementation OGESoupSession

+ (bool)utilNormalizeUriPath:(SoupURI*)suri
{
	return e_soup_session_util_normalize_uri_path(suri);
}

+ (OFString*)utilStatusToStringWithStatusCode:(guint)statusCode reasonPhrase:(OFString*)reasonPhrase
{
	return [OFString stringWithUTF8String:e_soup_session_util_status_to_string(statusCode, [reasonPhrase UTF8String])];
}

- (instancetype)init:(OGESource*)source
{
	self = [super initWithGObject:(GObject*)e_soup_session_new([source SOURCE])];

	return self;
}

- (ESoupSession*)SOUPSESSION
{
	return E_SOUP_SESSION([self GOBJECT]);
}

- (bool)checkResultWithRequest:(SoupRequestHTTP*)request readBytes:(gconstpointer)readBytes bytesLength:(gsize)bytesLength err:(GError**)err
{
	return e_soup_session_check_result([self SOUPSESSION], request, readBytes, bytesLength, err);
}

- (ENamedParameters*)dupCredentials
{
	return e_soup_session_dup_credentials([self SOUPSESSION]);
}

- (bool)authenticationRequiresCredentials
{
	return e_soup_session_get_authentication_requires_credentials([self SOUPSESSION]);
}

- (SoupLoggerLogLevel)logLevel
{
	return e_soup_session_get_log_level([self SOUPSESSION]);
}

- (OGESource*)source
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_soup_session_get_source([self SOUPSESSION])] autorelease];
}

- (bool)sslErrorDetailsWithOutCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors
{
	return e_soup_session_get_ssl_error_details([self SOUPSESSION], outCertificatePem, outCertificateErrors);
}

- (SoupRequestHTTP*)newRequestWithMethod:(OFString*)method uriString:(OFString*)uriString err:(GError**)err
{
	return e_soup_session_new_request([self SOUPSESSION], [method UTF8String], [uriString UTF8String], err);
}

- (SoupRequestHTTP*)newRequestUriWithMethod:(OFString*)method uri:(SoupURI*)uri err:(GError**)err
{
	return e_soup_session_new_request_uri([self SOUPSESSION], [method UTF8String], uri, err);
}

- (GByteArray*)sendRequestSimpleSyncWithRequest:(SoupRequestHTTP*)request cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_soup_session_send_request_simple_sync([self SOUPSESSION], request, cancellable, err);
}

- (GInputStream*)sendRequestSyncWithRequest:(SoupRequestHTTP*)request cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_soup_session_send_request_sync([self SOUPSESSION], request, cancellable, err);
}

- (void)setCredentials:(const ENamedParameters*)credentials
{
	e_soup_session_set_credentials([self SOUPSESSION], credentials);
}

- (void)setupLogging:(OFString*)loggingLevel
{
	e_soup_session_setup_logging([self SOUPSESSION], [loggingLevel UTF8String]);
}


@end