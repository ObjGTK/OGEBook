/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSasl.h"

#import "OGCamelService.h"

@implementation OGCamelSasl

+ (CamelServiceAuthType*)authtype:(OFString*)mechanism
{
	return camel_sasl_authtype([mechanism UTF8String]);
}

+ (GList*)authtypeList:(bool)includePlain
{
	return camel_sasl_authtype_list(includePlain);
}

+ (bool)isXoauth2Alias:(OFString*)mechanism
{
	return camel_sasl_is_xoauth2_alias([mechanism UTF8String]);
}

- (instancetype)initWithServiceName:(OFString*)serviceName mechanism:(OFString*)mechanism service:(OGCamelService*)service
{
	self = [super initWithGObject:(GObject*)camel_sasl_new([serviceName UTF8String], [mechanism UTF8String], [service SERVICE])];

	return self;
}

- (CamelSasl*)SASL
{
	return CAMEL_SASL([self GOBJECT]);
}

- (void)challengeWithToken:(GByteArray*)token ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_sasl_challenge([self SASL], token, ioPriority, cancellable, callback, userData);
}

- (void)challengeBase64WithToken:(OFString*)token ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_sasl_challenge_base64([self SASL], [token UTF8String], ioPriority, cancellable, callback, userData);
}

- (OFString*)challengeBase64FinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return [OFString stringWithUTF8String:camel_sasl_challenge_base64_finish([self SASL], result, err)];
}

- (OFString*)challengeBase64SyncWithToken:(OFString*)token cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return [OFString stringWithUTF8String:camel_sasl_challenge_base64_sync([self SASL], [token UTF8String], cancellable, err)];
}

- (GByteArray*)challengeFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_sasl_challenge_finish([self SASL], result, err);
}

- (GByteArray*)challengeSyncWithToken:(GByteArray*)token cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_sasl_challenge_sync([self SASL], token, cancellable, err);
}

- (bool)authenticated
{
	return camel_sasl_get_authenticated([self SASL]);
}

- (OFString*)mechanism
{
	return [OFString stringWithUTF8String:camel_sasl_get_mechanism([self SASL])];
}

- (OGCamelService*)service
{
	return [[[OGCamelService alloc] initWithGObject:(GObject*)camel_sasl_get_service([self SASL])] autorelease];
}

- (OFString*)serviceName
{
	return [OFString stringWithUTF8String:camel_sasl_get_service_name([self SASL])];
}

- (void)setAuthenticated:(bool)authenticated
{
	camel_sasl_set_authenticated([self SASL], authenticated);
}

- (void)tryEmptyPasswordWithIoPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_sasl_try_empty_password([self SASL], ioPriority, cancellable, callback, userData);
}

- (bool)tryEmptyPasswordFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_sasl_try_empty_password_finish([self SASL], result, err);
}

- (bool)tryEmptyPasswordSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_sasl_try_empty_password_sync([self SASL], cancellable, err);
}


@end