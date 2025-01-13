/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSasl.h"

#import "OGCamelService.h"
#import <OGio/OGCancellable.h>

@implementation OGCamelSasl

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_SASL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (CamelServiceAuthType*)authtypeWithMechanism:(OFString*)mechanism
{
	CamelServiceAuthType* returnValue = (CamelServiceAuthType*)camel_sasl_authtype([mechanism UTF8String]);

	return returnValue;
}

+ (GList*)authtypeListWithIncludePlain:(bool)includePlain
{
	GList* returnValue = (GList*)camel_sasl_authtype_list(includePlain);

	return returnValue;
}

+ (bool)isXoauth2AliasWithMechanism:(OFString*)mechanism
{
	bool returnValue = (bool)camel_sasl_is_xoauth2_alias([mechanism UTF8String]);

	return returnValue;
}

+ (instancetype)saslWithServiceName:(OFString*)serviceName mechanism:(OFString*)mechanism service:(OGCamelService*)service
{
	CamelSasl* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_sasl_new([serviceName UTF8String], [mechanism UTF8String], [service castedGObject]), CamelSasl, CamelSasl);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelSasl* wrapperObject;
	@try {
		wrapperObject = [[OGCamelSasl alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelSasl*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelSasl, CamelSasl);
}

- (void)challengeWithToken:(GByteArray*)token ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_sasl_challenge([self castedGObject], token, ioPriority, [cancellable castedGObject], callback, userData);
}

- (void)challengeBase64WithToken:(OFString*)token ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_sasl_challenge_base64([self castedGObject], [token UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (OFString*)challengeBase64FinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	gchar* gobjectValue = camel_sasl_challenge_base64_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)challengeBase64SyncWithToken:(OFString*)token cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gchar* gobjectValue = camel_sasl_challenge_base64_sync([self castedGObject], [token UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (GByteArray*)challengeFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	GByteArray* returnValue = (GByteArray*)camel_sasl_challenge_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GByteArray*)challengeSyncWithToken:(GByteArray*)token cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GByteArray* returnValue = (GByteArray*)camel_sasl_challenge_sync([self castedGObject], token, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)authenticated
{
	bool returnValue = (bool)camel_sasl_get_authenticated([self castedGObject]);

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
	CamelService* gobjectValue = camel_sasl_get_service([self castedGObject]);

	OGCamelService* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
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

- (bool)tryEmptyPasswordFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_sasl_try_empty_password_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)tryEmptyPasswordSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_sasl_try_empty_password_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end