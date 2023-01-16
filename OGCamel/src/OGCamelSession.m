/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSession.h"

#import "OGCamelFilterDriver.h"
#import "OGCamelFolder.h"
#import "OGCamelService.h"
#import "OGCamelMimeMessage.h"

@implementation OGCamelSession

- (CamelSession*)SESSION
{
	return CAMEL_SESSION([self GOBJECT]);
}

- (OGCamelService*)addServiceWithUid:(OFString*)uid protocol:(OFString*)protocol type:(CamelProviderType)type err:(GError**)err
{
	return [[[OGCamelService alloc] initWithGObject:(GObject*)camel_session_add_service([self SESSION], [uid UTF8String], [protocol UTF8String], type, err)] autorelease];
}

- (void)authenticateWithService:(OGCamelService*)service mechanism:(OFString*)mechanism ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_session_authenticate([self SESSION], [service SERVICE], [mechanism UTF8String], ioPriority, cancellable, callback, userData);
}

- (bool)authenticateFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_session_authenticate_finish([self SESSION], result, err);
}

- (bool)authenticateSyncWithService:(OGCamelService*)service mechanism:(OFString*)mechanism cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_session_authenticate_sync([self SESSION], [service SERVICE], [mechanism UTF8String], cancellable, err);
}

- (bool)forgetPasswordWithService:(OGCamelService*)service item:(OFString*)item err:(GError**)err
{
	return camel_session_forget_password([self SESSION], [service SERVICE], [item UTF8String], err);
}

- (void)forwardToWithFolder:(OGCamelFolder*)folder message:(OGCamelMimeMessage*)message address:(OFString*)address ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_session_forward_to([self SESSION], [folder FOLDER], [message MIMEMESSAGE], [address UTF8String], ioPriority, cancellable, callback, userData);
}

- (bool)forwardToFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_session_forward_to_finish([self SESSION], result, err);
}

- (bool)forwardToSyncWithFolder:(OGCamelFolder*)folder message:(OGCamelMimeMessage*)message address:(OFString*)address cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_session_forward_to_sync([self SESSION], [folder FOLDER], [message MIMEMESSAGE], [address UTF8String], cancellable, err);
}

- (OGCamelFilterDriver*)filterDriverWithType:(OFString*)type forFolder:(OGCamelFolder*)forFolder err:(GError**)err
{
	return [[[OGCamelFilterDriver alloc] initWithGObject:(GObject*)camel_session_get_filter_driver([self SESSION], [type UTF8String], [forFolder FOLDER], err)] autorelease];
}

- (CamelJunkFilter*)junkFilter
{
	return camel_session_get_junk_filter([self SESSION]);
}

- (const GHashTable*)junkHeaders
{
	return camel_session_get_junk_headers([self SESSION]);
}

- (bool)oauth2AccessTokenSyncWithService:(OGCamelService*)service outAccessToken:(gchar**)outAccessToken outExpiresIn:(gint*)outExpiresIn cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_session_get_oauth2_access_token_sync([self SESSION], [service SERVICE], outAccessToken, outExpiresIn, cancellable, err);
}

- (bool)online
{
	return camel_session_get_online([self SESSION]);
}

- (OFString*)passwordWithService:(OGCamelService*)service prompt:(OFString*)prompt item:(OFString*)item flags:(guint32)flags err:(GError**)err
{
	return [OFString stringWithUTF8String:camel_session_get_password([self SESSION], [service SERVICE], [prompt UTF8String], [item UTF8String], flags, err)];
}

- (bool)recipientCertificatesSyncWithFlags:(guint32)flags recipients:(const GPtrArray*)recipients outCertificates:(GSList**)outCertificates cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_session_get_recipient_certificates_sync([self SESSION], flags, recipients, outCertificates, cancellable, err);
}

- (OFString*)userCacheDir
{
	return [OFString stringWithUTF8String:camel_session_get_user_cache_dir([self SESSION])];
}

- (OFString*)userDataDir
{
	return [OFString stringWithUTF8String:camel_session_get_user_data_dir([self SESSION])];
}

- (guint)idleAddWithPriority:(gint)priority function:(GSourceFunc)function data:(gpointer)data notify:(GDestroyNotify)notify
{
	return camel_session_idle_add([self SESSION], priority, function, data, notify);
}

- (GList*)listServices
{
	return camel_session_list_services([self SESSION]);
}

- (bool)lookupAddressbook:(OFString*)name
{
	return camel_session_lookup_addressbook([self SESSION], [name UTF8String]);
}

- (GMainContext*)refMainContext
{
	return camel_session_ref_main_context([self SESSION]);
}

- (GNetworkMonitor*)refNetworkMonitor
{
	return camel_session_ref_network_monitor([self SESSION]);
}

- (OGCamelService*)refService:(OFString*)uid
{
	return [[[OGCamelService alloc] initWithGObject:(GObject*)camel_session_ref_service([self SESSION], [uid UTF8String])] autorelease];
}

- (OGCamelService*)refServiceByUrlWithUrl:(CamelURL*)url type:(CamelProviderType)type
{
	return [[[OGCamelService alloc] initWithGObject:(GObject*)camel_session_ref_service_by_url([self SESSION], url, type)] autorelease];
}

- (void)removeService:(OGCamelService*)service
{
	camel_session_remove_service([self SESSION], [service SERVICE]);
}

- (void)removeServices
{
	camel_session_remove_services([self SESSION]);
}

- (void)setJunkFilter:(CamelJunkFilter*)junkFilter
{
	camel_session_set_junk_filter([self SESSION], junkFilter);
}

- (void)setJunkHeadersWithHeaders:(const gchar**)headers values:(const gchar**)values len:(gint)len
{
	camel_session_set_junk_headers([self SESSION], headers, values, len);
}

- (void)setNetworkMonitor:(GNetworkMonitor*)networkMonitor
{
	camel_session_set_network_monitor([self SESSION], networkMonitor);
}

- (void)setOnline:(bool)online
{
	camel_session_set_online([self SESSION], online);
}

- (void)submitJobWithDescription:(OFString*)description callback:(CamelSessionCallback)callback userData:(gpointer)userData notify:(GDestroyNotify)notify
{
	camel_session_submit_job([self SESSION], [description UTF8String], callback, userData, notify);
}

- (CamelCertTrust)trustPromptWithService:(OGCamelService*)service certificate:(GTlsCertificate*)certificate errors:(GTlsCertificateFlags)errors
{
	return camel_session_trust_prompt([self SESSION], [service SERVICE], certificate, errors);
}

- (void)userAlertWithService:(OGCamelService*)service type:(CamelSessionAlertType)type message:(OFString*)message
{
	camel_session_user_alert([self SESSION], [service SERVICE], type, [message UTF8String]);
}


@end