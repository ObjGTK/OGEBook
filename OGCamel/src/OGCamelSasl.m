/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSasl.h"

#import <OGio/OGCancellable.h>
#import "OGCamelService.h"

@implementation OGCamelSasl

+ (CamelServiceAuthType*)authtype:(OFString*)mechanism
{
	CamelServiceAuthType* returnValue = camel_sasl_authtype([mechanism UTF8String]);

	return returnValue;
}

+ (GList*)authtypeList:(bool)includePlain
{
	GList* returnValue = camel_sasl_authtype_list(includePlain);

	return returnValue;
}

+ (bool)isXoauth2Alias:(OFString*)mechanism
{
	bool returnValue = camel_sasl_is_xoauth2_alias([mechanism UTF8String]);

	return returnValue;
}

- (instancetype)initWithServiceName:(OFString*)serviceName mechanism:(OFString*)mechanism service:(OGCamelService*)service
{
	CamelSasl* gobjectValue = CAMEL_SASL(camel_sasl_new([serviceName UTF8String], [mechanism UTF8String], [service castedGObject]));

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

- (CamelSasl*)castedGObject
{
	return CAMEL_SASL([self gObject]);
}

- (void)challengeWithToken:(GByteArray*)token ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_sasl_challenge([self castedGObject], token, ioPriority, [cancellable castedGObject], callback, userData);
}

- (void)challengeBase64WithToken:(OFString*)token ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_sasl_challenge_base64([self castedGObject], [token UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (OFString*)challengeBase64Finish:(GAsyncResult*)result
{
	GError* err = NULL;

	gchar* gobjectValue = camel_sasl_challenge_base64_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)challengeBase64SyncWithToken:(OFString*)token cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gchar* gobjectValue = camel_sasl_challenge_base64_sync([self castedGObject], [token UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (GByteArray*)challengeFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	GByteArray* returnValue = camel_sasl_challenge_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (GByteArray*)challengeSyncWithToken:(GByteArray*)token cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GByteArray* returnValue = camel_sasl_challenge_sync([self castedGObject], token, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)authenticated
{
	bool returnValue = camel_sasl_get_authenticated([self castedGObject]);

	return returnValue;
}

- (OFString*)mechanism
{
	const gchar* gobjectValue = camel_sasl_get_mechanism([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGCamelService*)service
{
	CamelService* gobjectValue = CAMEL_SERVICE(camel_sasl_get_service([self castedGObject]));

	OGCamelService* returnValue = [OGCamelService withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)serviceName
{
	const gchar* gobjectValue = camel_sasl_get_service_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setAuthenticated:(bool)authenticated
{
	camel_sasl_set_authenticated([self castedGObject], authenticated);
}

- (void)tryEmptyPasswordWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_sasl_try_empty_password([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)tryEmptyPasswordFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = camel_sasl_try_empty_password_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tryEmptyPasswordSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_sasl_try_empty_password_sync([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end