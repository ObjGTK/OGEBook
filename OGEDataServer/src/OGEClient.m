/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEClient.h"

#import "OGESource.h"

@implementation OGEClient

+ (GError*)errorCreateWithCode:(EClientError)code customMsg:(OFString*)customMsg
{
	return e_client_error_create(code, [customMsg UTF8String]);
}

+ (GQuark)errorQuark
{
	return e_client_error_quark();
}

+ (OFString*)errorToString:(EClientError)code
{
	return [OFString stringWithUTF8String:e_client_error_to_string(code)];
}

+ (GSList*)utilCopyObjectSlistWithCopyTo:(GSList*)copyTo objects:(const GSList*)objects
{
	return e_client_util_copy_object_slist(copyTo, objects);
}

+ (GSList*)utilCopyStringSlistWithCopyTo:(GSList*)copyTo strings:(const GSList*)strings
{
	return e_client_util_copy_string_slist(copyTo, strings);
}

+ (void)utilFreeObjectSlist:(GSList*)objects
{
	e_client_util_free_object_slist(objects);
}

+ (void)utilFreeStringSlist:(GSList*)strings
{
	e_client_util_free_string_slist(strings);
}

+ (GSList*)utilParseCommaStrings:(OFString*)strings
{
	return e_client_util_parse_comma_strings([strings UTF8String]);
}

+ (gchar**)utilSlistToStrv:(const GSList*)strings
{
	return e_client_util_slist_to_strv(strings);
}

+ (GSList*)utilStrvToSlist:(const gchar* const*)strv
{
	return e_client_util_strv_to_slist(strv);
}

+ (bool)utilUnwrapDbusErrorWithDbusError:(GError*)dbusError clientError:(GError**)clientError knownErrors:(const EClientErrorsList*)knownErrors knownErrorsCount:(guint)knownErrorsCount knownErrorsDomain:(GQuark)knownErrorsDomain failWhenNoneMatched:(bool)failWhenNoneMatched
{
	return e_client_util_unwrap_dbus_error(dbusError, clientError, knownErrors, knownErrorsCount, knownErrorsDomain, failWhenNoneMatched);
}

- (EClient*)CLIENT
{
	return E_CLIENT([self GOBJECT]);
}

- (void)cancelAll
{
	e_client_cancel_all([self CLIENT]);
}

- (bool)checkCapability:(OFString*)capability
{
	return e_client_check_capability([self CLIENT], [capability UTF8String]);
}

- (bool)checkRefreshSupported
{
	return e_client_check_refresh_supported([self CLIENT]);
}

- (OFString*)dupBusName
{
	return [OFString stringWithUTF8String:e_client_dup_bus_name([self CLIENT])];
}

- (void)backendPropertyWithPropName:(OFString*)propName cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_get_backend_property([self CLIENT], [propName UTF8String], cancellable, callback, userData);
}

- (bool)backendPropertyFinishWithResult:(GAsyncResult*)result propValue:(gchar**)propValue err:(GError**)err
{
	return e_client_get_backend_property_finish([self CLIENT], result, propValue, err);
}

- (bool)backendPropertySyncWithPropName:(OFString*)propName propValue:(gchar**)propValue cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_client_get_backend_property_sync([self CLIENT], [propName UTF8String], propValue, cancellable, err);
}

- (const GSList*)capabilities
{
	return e_client_get_capabilities([self CLIENT]);
}

- (OGESource*)source
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_client_get_source([self CLIENT])] autorelease];
}

- (bool)isOnline
{
	return e_client_is_online([self CLIENT]);
}

- (bool)isOpened
{
	return e_client_is_opened([self CLIENT]);
}

- (bool)isReadonly
{
	return e_client_is_readonly([self CLIENT]);
}

- (void)openWithOnlyIfExists:(bool)onlyIfExists cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_open([self CLIENT], onlyIfExists, cancellable, callback, userData);
}

- (bool)openFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_client_open_finish([self CLIENT], result, err);
}

- (bool)openSyncWithOnlyIfExists:(bool)onlyIfExists cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_client_open_sync([self CLIENT], onlyIfExists, cancellable, err);
}

- (GMainContext*)refMainContext
{
	return e_client_ref_main_context([self CLIENT]);
}

- (void)refreshWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_refresh([self CLIENT], cancellable, callback, userData);
}

- (bool)refreshFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_client_refresh_finish([self CLIENT], result, err);
}

- (bool)refreshSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_client_refresh_sync([self CLIENT], cancellable, err);
}

- (void)removeWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_remove([self CLIENT], cancellable, callback, userData);
}

- (bool)removeFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_client_remove_finish([self CLIENT], result, err);
}

- (bool)removeSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_client_remove_sync([self CLIENT], cancellable, err);
}

- (void)retrieveCapabilitiesWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_retrieve_capabilities([self CLIENT], cancellable, callback, userData);
}

- (bool)retrieveCapabilitiesFinishWithResult:(GAsyncResult*)result capabilities:(gchar**)capabilities err:(GError**)err
{
	return e_client_retrieve_capabilities_finish([self CLIENT], result, capabilities, err);
}

- (bool)retrieveCapabilitiesSyncWithCapabilities:(gchar**)capabilities cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_client_retrieve_capabilities_sync([self CLIENT], capabilities, cancellable, err);
}

- (void)retrievePropertiesWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_retrieve_properties([self CLIENT], cancellable, callback, userData);
}

- (bool)retrievePropertiesFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_client_retrieve_properties_finish([self CLIENT], result, err);
}

- (bool)retrievePropertiesSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_client_retrieve_properties_sync([self CLIENT], cancellable, err);
}

- (void)setBackendPropertyWithPropName:(OFString*)propName propValue:(OFString*)propValue cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_set_backend_property([self CLIENT], [propName UTF8String], [propValue UTF8String], cancellable, callback, userData);
}

- (bool)setBackendPropertyFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_client_set_backend_property_finish([self CLIENT], result, err);
}

- (bool)setBackendPropertySyncWithPropName:(OFString*)propName propValue:(OFString*)propValue cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_client_set_backend_property_sync([self CLIENT], [propName UTF8String], [propValue UTF8String], cancellable, err);
}

- (void)setBusName:(OFString*)busName
{
	e_client_set_bus_name([self CLIENT], [busName UTF8String]);
}

- (void)unwrapDbusErrorWithDbusError:(GError*)dbusError err:(GError**)err
{
	e_client_unwrap_dbus_error([self CLIENT], dbusError, err);
}

- (void)waitForConnectedWithTimeoutSeconds:(guint32)timeoutSeconds cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_wait_for_connected([self CLIENT], timeoutSeconds, cancellable, callback, userData);
}

- (bool)waitForConnectedFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_client_wait_for_connected_finish([self CLIENT], result, err);
}

- (bool)waitForConnectedSyncWithTimeoutSeconds:(guint32)timeoutSeconds cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_client_wait_for_connected_sync([self CLIENT], timeoutSeconds, cancellable, err);
}


@end