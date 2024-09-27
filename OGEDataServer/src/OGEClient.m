/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEClient.h"

#import "OGESource.h"
#import <OGio/OGCancellable.h>

@implementation OGEClient

+ (GError*)errorCreateWithCode:(EClientError)code customMsg:(OFString*)customMsg
{
	GError* returnValue = e_client_error_create(code, [customMsg UTF8String]);

	return returnValue;
}

+ (GQuark)errorQuark
{
	GQuark returnValue = e_client_error_quark();

	return returnValue;
}

+ (OFString*)errorToString:(EClientError)code
{
	const gchar* gobjectValue = e_client_error_to_string(code);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (GSList*)utilCopyObjectSlistWithCopyTo:(GSList*)copyTo objects:(const GSList*)objects
{
	GSList* returnValue = e_client_util_copy_object_slist(copyTo, objects);

	return returnValue;
}

+ (GSList*)utilCopyStringSlistWithCopyTo:(GSList*)copyTo strings:(const GSList*)strings
{
	GSList* returnValue = e_client_util_copy_string_slist(copyTo, strings);

	return returnValue;
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
	GSList* returnValue = e_client_util_parse_comma_strings([strings UTF8String]);

	return returnValue;
}

+ (gchar**)utilSlistToStrv:(const GSList*)strings
{
	gchar** returnValue = e_client_util_slist_to_strv(strings);

	return returnValue;
}

+ (GSList*)utilStrvToSlist:(const gchar* const*)strv
{
	GSList* returnValue = e_client_util_strv_to_slist(strv);

	return returnValue;
}

+ (bool)utilUnwrapDbusErrorWithDbusError:(GError*)dbusError clientError:(GError**)clientError knownErrors:(const EClientErrorsList*)knownErrors knownErrorsCount:(guint)knownErrorsCount knownErrorsDomain:(GQuark)knownErrorsDomain failWhenNoneMatched:(bool)failWhenNoneMatched
{
	bool returnValue = e_client_util_unwrap_dbus_error(dbusError, clientError, knownErrors, knownErrorsCount, knownErrorsDomain, failWhenNoneMatched);

	return returnValue;
}

- (EClient*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EClient, EClient);
}

- (void)cancelAll
{
	e_client_cancel_all([self castedGObject]);
}

- (bool)checkCapability:(OFString*)capability
{
	bool returnValue = e_client_check_capability([self castedGObject], [capability UTF8String]);

	return returnValue;
}

- (bool)checkRefreshSupported
{
	bool returnValue = e_client_check_refresh_supported([self castedGObject]);

	return returnValue;
}

- (OFString*)dupBusName
{
	gchar* gobjectValue = e_client_dup_bus_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)backendPropertyWithPropName:(OFString*)propName cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_get_backend_property([self castedGObject], [propName UTF8String], [cancellable castedGObject], callback, userData);
}

- (bool)backendPropertyFinishWithResult:(GAsyncResult*)result propValue:(gchar**)propValue
{
	GError* err = NULL;

	bool returnValue = e_client_get_backend_property_finish([self castedGObject], result, propValue, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)backendPropertySyncWithPropName:(OFString*)propName propValue:(gchar**)propValue cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_client_get_backend_property_sync([self castedGObject], [propName UTF8String], propValue, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (const GSList*)capabilities
{
	const GSList* returnValue = e_client_get_capabilities([self castedGObject]);

	return returnValue;
}

- (OGESource*)source
{
	ESource* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_client_get_source([self castedGObject]), ESource, ESource);

	OGESource* returnValue = [OGESource withGObject:gobjectValue];
	return returnValue;
}

- (bool)isOnline
{
	bool returnValue = e_client_is_online([self castedGObject]);

	return returnValue;
}

- (bool)isOpened
{
	bool returnValue = e_client_is_opened([self castedGObject]);

	return returnValue;
}

- (bool)isReadonly
{
	bool returnValue = e_client_is_readonly([self castedGObject]);

	return returnValue;
}

- (void)openWithOnlyIfExists:(bool)onlyIfExists cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_open([self castedGObject], onlyIfExists, [cancellable castedGObject], callback, userData);
}

- (bool)openFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = e_client_open_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)openSyncWithOnlyIfExists:(bool)onlyIfExists cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_client_open_sync([self castedGObject], onlyIfExists, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (GMainContext*)refMainContext
{
	GMainContext* returnValue = e_client_ref_main_context([self castedGObject]);

	return returnValue;
}

- (void)refreshWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_refresh([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)refreshFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = e_client_refresh_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)refreshSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_client_refresh_sync([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)removeWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_remove([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)removeFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = e_client_remove_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)removeSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_client_remove_sync([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)retrieveCapabilitiesWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_retrieve_capabilities([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)retrieveCapabilitiesFinishWithResult:(GAsyncResult*)result capabilities:(gchar**)capabilities
{
	GError* err = NULL;

	bool returnValue = e_client_retrieve_capabilities_finish([self castedGObject], result, capabilities, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)retrieveCapabilitiesSyncWithCapabilities:(gchar**)capabilities cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_client_retrieve_capabilities_sync([self castedGObject], capabilities, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)retrievePropertiesWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_retrieve_properties([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)retrievePropertiesFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = e_client_retrieve_properties_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)retrievePropertiesSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_client_retrieve_properties_sync([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setBackendPropertyWithPropName:(OFString*)propName propValue:(OFString*)propValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_set_backend_property([self castedGObject], [propName UTF8String], [propValue UTF8String], [cancellable castedGObject], callback, userData);
}

- (bool)setBackendPropertyFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = e_client_set_backend_property_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)setBackendPropertySyncWithPropName:(OFString*)propName propValue:(OFString*)propValue cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_client_set_backend_property_sync([self castedGObject], [propName UTF8String], [propValue UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setBusName:(OFString*)busName
{
	e_client_set_bus_name([self castedGObject], [busName UTF8String]);
}

- (void)unwrapDbusError:(GError*)dbusError
{
	GError* err = NULL;

	e_client_unwrap_dbus_error([self castedGObject], dbusError, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (void)waitForConnectedWithTimeoutSeconds:(guint32)timeoutSeconds cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_client_wait_for_connected([self castedGObject], timeoutSeconds, [cancellable castedGObject], callback, userData);
}

- (bool)waitForConnectedFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = e_client_wait_for_connected_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)waitForConnectedSyncWithTimeoutSeconds:(guint32)timeoutSeconds cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_client_wait_for_connected_sync([self castedGObject], timeoutSeconds, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end