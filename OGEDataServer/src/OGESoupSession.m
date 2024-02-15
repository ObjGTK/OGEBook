/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESoupSession.h"

#import "OGESource.h"
#import <OGio/OGCancellable.h>
#import <OGio/OGInputStream.h>

@implementation OGESoupSession

+ (GQuark)errorQuark
{
	GQuark returnValue = e_soup_session_error_quark();

	return returnValue;
}

+ (bool)utilGetForceHttp1Supported
{
	bool returnValue = e_soup_session_util_get_force_http1_supported();

	return returnValue;
}

+ (GByteArray*)utilGetMessageBytes:(SoupMessage*)message
{
	GByteArray* returnValue = e_soup_session_util_get_message_bytes(message);

	return returnValue;
}

+ (GUri*)utilNormalizeUriPath:(GUri*)uri
{
	GUri* returnValue = e_soup_session_util_normalize_uri_path(uri);

	return returnValue;
}

+ (OGInputStream*)utilRefMessageRequestBodyWithMessage:(SoupMessage*)message outLength:(gssize*)outLength
{
	GInputStream* gobjectValue = G_INPUT_STREAM(e_soup_session_util_ref_message_request_body(message, outLength));

	OGInputStream* returnValue = [OGInputStream withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

+ (void)utilSetMessageRequestBodyWithMessage:(SoupMessage*)message contentType:(OFString*)contentType inputStream:(OGInputStream*)inputStream length:(gssize)length
{
	e_soup_session_util_set_message_request_body(message, [contentType UTF8String], [inputStream castedGObject], length);
}

+ (void)utilSetMessageRequestBodyFromDataWithMessage:(SoupMessage*)message createCopy:(bool)createCopy contentType:(OFString*)contentType data:(gconstpointer)data length:(gssize)length freeFunc:(GDestroyNotify)freeFunc
{
	e_soup_session_util_set_message_request_body_from_data(message, createCopy, [contentType UTF8String], data, length, freeFunc);
}

+ (OFString*)utilStatusToStringWithStatusCode:(guint)statusCode reasonPhrase:(OFString*)reasonPhrase
{
	const gchar* gobjectValue = e_soup_session_util_status_to_string(statusCode, [reasonPhrase UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (instancetype)init:(OGESource*)source
{
	ESoupSession* gobjectValue = E_SOUP_SESSION(e_soup_session_new([source castedGObject]));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (ESoupSession*)castedGObject
{
	return E_SOUP_SESSION([self gObject]);
}

- (bool)checkResultWithMessage:(SoupMessage*)message readBytes:(gconstpointer)readBytes bytesLength:(gsize)bytesLength
{
	GError* err = NULL;

	bool returnValue = e_soup_session_check_result([self castedGObject], message, readBytes, bytesLength, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (ENamedParameters*)dupCredentials
{
	ENamedParameters* returnValue = e_soup_session_dup_credentials([self castedGObject]);

	return returnValue;
}

- (bool)authenticationRequiresCredentials
{
	bool returnValue = e_soup_session_get_authentication_requires_credentials([self castedGObject]);

	return returnValue;
}

- (bool)forceHttp1
{
	bool returnValue = e_soup_session_get_force_http1([self castedGObject]);

	return returnValue;
}

- (SoupLoggerLogLevel)logLevel
{
	SoupLoggerLogLevel returnValue = e_soup_session_get_log_level([self castedGObject]);

	return returnValue;
}

- (OGESource*)source
{
	ESource* gobjectValue = E_SOURCE(e_soup_session_get_source([self castedGObject]));

	OGESource* returnValue = [OGESource withGObject:gobjectValue];
	return returnValue;
}

- (bool)sslErrorDetailsWithOutCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors
{
	bool returnValue = e_soup_session_get_ssl_error_details([self castedGObject], outCertificatePem, outCertificateErrors);

	return returnValue;
}

- (void)handleAuthenticationFailureWithCredentials:(const ENamedParameters*)credentials opError:(const GError*)opError outAuthResult:(ESourceAuthenticationResult*)outAuthResult outCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors
{
	GError* err = NULL;

	e_soup_session_handle_authentication_failure([self castedGObject], credentials, opError, outAuthResult, outCertificatePem, outCertificateErrors, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (SoupMessage*)newMessageWithMethod:(OFString*)method uriString:(OFString*)uriString
{
	GError* err = NULL;

	SoupMessage* returnValue = e_soup_session_new_message([self castedGObject], [method UTF8String], [uriString UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (SoupMessage*)newMessageFromUriWithMethod:(OFString*)method uri:(GUri*)uri
{
	GError* err = NULL;

	SoupMessage* returnValue = e_soup_session_new_message_from_uri([self castedGObject], [method UTF8String], uri, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gpointer)prepareMessageSendSyncWithMessage:(SoupMessage*)message cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gpointer returnValue = e_soup_session_prepare_message_send_sync([self castedGObject], message, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)sendMessageWithMessage:(SoupMessage*)message ioPriority:(gint)ioPriority prepareData:(gpointer)prepareData cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_soup_session_send_message([self castedGObject], message, ioPriority, prepareData, [cancellable castedGObject], callback, userData);
}

- (OGInputStream*)sendMessageFinishWithResult:(GAsyncResult*)result outCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors
{
	GError* err = NULL;

	GInputStream* gobjectValue = G_INPUT_STREAM(e_soup_session_send_message_finish([self castedGObject], result, outCertificatePem, outCertificateErrors, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGInputStream* returnValue = [OGInputStream withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GByteArray*)sendMessageSimpleSyncWithMessage:(SoupMessage*)message cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GByteArray* returnValue = e_soup_session_send_message_simple_sync([self castedGObject], message, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OGInputStream*)sendMessageSyncWithMessage:(SoupMessage*)message cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GInputStream* gobjectValue = G_INPUT_STREAM(e_soup_session_send_message_sync([self castedGObject], message, [cancellable castedGObject], &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGInputStream* returnValue = [OGInputStream withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setCredentials:(const ENamedParameters*)credentials
{
	e_soup_session_set_credentials([self castedGObject], credentials);
}

- (void)setForceHttp1:(bool)forceHttp1
{
	e_soup_session_set_force_http1([self castedGObject], forceHttp1);
}

- (void)setupLogging:(OFString*)loggingLevel
{
	e_soup_session_setup_logging([self castedGObject], [loggingLevel UTF8String]);
}


@end