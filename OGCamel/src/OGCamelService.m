/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelService.h"

#import "OGCamelSettings.h"
#import "OGCamelSession.h"

@implementation OGCamelService

+ (GQuark)errorQuark
{
	return camel_service_error_quark();
}

- (CamelService*)SERVICE
{
	return CAMEL_SERVICE([self GOBJECT]);
}

- (void)authenticateWithMechanism:(OFString*)mechanism ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_service_authenticate([self SERVICE], [mechanism UTF8String], ioPriority, cancellable, callback, userData);
}

- (CamelAuthenticationResult)authenticateFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_service_authenticate_finish([self SERVICE], result, err);
}

- (CamelAuthenticationResult)authenticateSyncWithMechanism:(OFString*)mechanism cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_service_authenticate_sync([self SERVICE], [mechanism UTF8String], cancellable, err);
}

- (void)connectWithIoPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_service_connect([self SERVICE], ioPriority, cancellable, callback, userData);
}

- (bool)connectFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_service_connect_finish([self SERVICE], result, err);
}

- (bool)connectSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_service_connect_sync([self SERVICE], cancellable, err);
}

- (void)disconnectWithClean:(bool)clean ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_service_disconnect([self SERVICE], clean, ioPriority, cancellable, callback, userData);
}

- (bool)disconnectFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_service_disconnect_finish([self SERVICE], result, err);
}

- (bool)disconnectSyncWithClean:(bool)clean cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_service_disconnect_sync([self SERVICE], clean, cancellable, err);
}

- (OFString*)dupDisplayName
{
	return [OFString stringWithUTF8String:camel_service_dup_display_name([self SERVICE])];
}

- (OFString*)dupPassword
{
	return [OFString stringWithUTF8String:camel_service_dup_password([self SERVICE])];
}

- (CamelServiceConnectionStatus)connectionStatus
{
	return camel_service_get_connection_status([self SERVICE]);
}

- (OFString*)displayName
{
	return [OFString stringWithUTF8String:camel_service_get_display_name([self SERVICE])];
}

- (OFString*)name:(bool)brief
{
	return [OFString stringWithUTF8String:camel_service_get_name([self SERVICE], brief)];
}

- (OFString*)password
{
	return [OFString stringWithUTF8String:camel_service_get_password([self SERVICE])];
}

- (CamelProvider*)provider
{
	return camel_service_get_provider([self SERVICE]);
}

- (OFString*)uid
{
	return [OFString stringWithUTF8String:camel_service_get_uid([self SERVICE])];
}

- (OFString*)userCacheDir
{
	return [OFString stringWithUTF8String:camel_service_get_user_cache_dir([self SERVICE])];
}

- (OFString*)userDataDir
{
	return [OFString stringWithUTF8String:camel_service_get_user_data_dir([self SERVICE])];
}

- (void)migrateFiles
{
	camel_service_migrate_files([self SERVICE]);
}

- (CamelURL*)newCamelUrl
{
	return camel_service_new_camel_url([self SERVICE]);
}

- (void)queryAuthTypesWithIoPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_service_query_auth_types([self SERVICE], ioPriority, cancellable, callback, userData);
}

- (GList*)queryAuthTypesFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_service_query_auth_types_finish([self SERVICE], result, err);
}

- (GList*)queryAuthTypesSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_service_query_auth_types_sync([self SERVICE], cancellable, err);
}

- (void)queueTaskWithTask:(GTask*)task taskFunc:(GTaskThreadFunc)taskFunc
{
	camel_service_queue_task([self SERVICE], task, taskFunc);
}

- (GProxyResolver*)refProxyResolver
{
	return camel_service_ref_proxy_resolver([self SERVICE]);
}

- (OGCamelSession*)refSession
{
	return [[[OGCamelSession alloc] initWithGObject:(GObject*)camel_service_ref_session([self SERVICE])] autorelease];
}

- (OGCamelSettings*)refSettings
{
	return [[[OGCamelSettings alloc] initWithGObject:(GObject*)camel_service_ref_settings([self SERVICE])] autorelease];
}

- (void)setDisplayName:(OFString*)displayName
{
	camel_service_set_display_name([self SERVICE], [displayName UTF8String]);
}

- (void)setPassword:(OFString*)password
{
	camel_service_set_password([self SERVICE], [password UTF8String]);
}

- (void)setProxyResolver:(GProxyResolver*)proxyResolver
{
	camel_service_set_proxy_resolver([self SERVICE], proxyResolver);
}

- (void)setSettings:(OGCamelSettings*)settings
{
	camel_service_set_settings([self SERVICE], [settings SETTINGS]);
}


@end