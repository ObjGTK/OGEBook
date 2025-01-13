/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelService.h"

#import "OGCamelSession.h"
#import "OGCamelSettings.h"
#import <OGio/OGCancellable.h>
#import <OGio/OGTask.h>

@implementation OGCamelService

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_SERVICE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelService*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelService, CamelService);
}

- (void)authenticateWithMechanism:(OFString*)mechanism ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_service_authenticate([self castedGObject], [mechanism UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (CamelAuthenticationResult)authenticateFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	CamelAuthenticationResult returnValue = (CamelAuthenticationResult)camel_service_authenticate_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (CamelAuthenticationResult)authenticateSyncWithMechanism:(OFString*)mechanism cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	CamelAuthenticationResult returnValue = (CamelAuthenticationResult)camel_service_authenticate_sync([self castedGObject], [mechanism UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)connectWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_service_connect([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)connectFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_service_connect_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)connectSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_service_connect_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)disconnectWithClean:(bool)clean ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_service_disconnect([self castedGObject], clean, ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)disconnectFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_service_disconnect_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)disconnectSyncWithClean:(bool)clean cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_service_disconnect_sync([self castedGObject], clean, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OFString*)dupDisplayName
{
	gchar* gobjectValue = camel_service_dup_display_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupPassword
{
	gchar* gobjectValue = camel_service_dup_password([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (CamelServiceConnectionStatus)connectionStatus
{
	CamelServiceConnectionStatus returnValue = (CamelServiceConnectionStatus)camel_service_get_connection_status([self castedGObject]);

	return returnValue;
}

- (OFString*)displayName
{
	const gchar* gobjectValue = camel_service_get_display_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)nameWithBrief:(bool)brief
{
	gchar* gobjectValue = camel_service_get_name([self castedGObject], brief);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)password
{
	const gchar* gobjectValue = camel_service_get_password([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (CamelProvider*)provider
{
	CamelProvider* returnValue = (CamelProvider*)camel_service_get_provider([self castedGObject]);

	return returnValue;
}

- (OFString*)uid
{
	const gchar* gobjectValue = camel_service_get_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)userCacheDir
{
	const gchar* gobjectValue = camel_service_get_user_cache_dir([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)userDataDir
{
	const gchar* gobjectValue = camel_service_get_user_data_dir([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)migrateFiles
{
	camel_service_migrate_files([self castedGObject]);
}

- (CamelURL*)newCamelUrl
{
	CamelURL* returnValue = (CamelURL*)camel_service_new_camel_url([self castedGObject]);

	return returnValue;
}

- (void)queryAuthTypesWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_service_query_auth_types([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (GList*)queryAuthTypesFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	GList* returnValue = (GList*)camel_service_query_auth_types_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GList*)queryAuthTypesSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GList* returnValue = (GList*)camel_service_query_auth_types_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)queueTask:(OGTask*)task taskFunc:(GTaskThreadFunc)taskFunc
{
	camel_service_queue_task([self castedGObject], [task castedGObject], taskFunc);
}

- (GProxyResolver*)refProxyResolver
{
	GProxyResolver* returnValue = (GProxyResolver*)camel_service_ref_proxy_resolver([self castedGObject]);

	return returnValue;
}

- (OGCamelSession*)refSession
{
	CamelSession* gobjectValue = camel_service_ref_session([self castedGObject]);

	OGCamelSession* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelSettings*)refSettings
{
	CamelSettings* gobjectValue = camel_service_ref_settings([self castedGObject]);

	OGCamelSettings* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setDisplayName:(OFString*)displayName
{
	camel_service_set_display_name([self castedGObject], [displayName UTF8String]);
}

- (void)setPassword:(OFString*)password
{
	camel_service_set_password([self castedGObject], [password UTF8String]);
}

- (void)setProxyResolver:(GProxyResolver*)proxyResolver
{
	camel_service_set_proxy_resolver([self castedGObject], proxyResolver);
}

- (void)setSettings:(OGCamelSettings*)settings
{
	camel_service_set_settings([self castedGObject], [settings castedGObject]);
}


@end