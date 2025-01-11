/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSession.h"

#import "OGCamelFilterDriver.h"
#import "OGCamelFolder.h"
#import "OGCamelMimeMessage.h"
#import "OGCamelService.h"
#import <OGio/OGCancellable.h>
#import <OGio/OGTlsCertificate.h>

@implementation OGCamelSession

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_SESSION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelSession*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelSession, CamelSession);
}

- (OGCamelService*)addServiceWithUid:(OFString*)uid protocol:(OFString*)protocol type:(CamelProviderType)type
{
	GError* err = NULL;

	CamelService* gobjectValue = camel_session_add_service([self castedGObject], [uid UTF8String], [protocol UTF8String], type, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGCamelService* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)addressbookContainsSyncWithBookUid:(OFString*)bookUid emailAddress:(OFString*)emailAddress cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_session_addressbook_contains_sync([self castedGObject], [bookUid UTF8String], [emailAddress UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)authenticateWithService:(OGCamelService*)service mechanism:(OFString*)mechanism ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_session_authenticate([self castedGObject], [service castedGObject], [mechanism UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)authenticateFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_session_authenticate_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)authenticateSyncWithService:(OGCamelService*)service mechanism:(OFString*)mechanism cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_session_authenticate_sync([self castedGObject], [service castedGObject], [mechanism UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)forgetPasswordWithService:(OGCamelService*)service item:(OFString*)item
{
	GError* err = NULL;

	bool returnValue = (bool)camel_session_forget_password([self castedGObject], [service castedGObject], [item UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)forwardToWithFolder:(OGCamelFolder*)folder message:(OGCamelMimeMessage*)message address:(OFString*)address ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_session_forward_to([self castedGObject], [folder castedGObject], [message castedGObject], [address UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)forwardToFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_session_forward_to_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)forwardToSyncWithFolder:(OGCamelFolder*)folder message:(OGCamelMimeMessage*)message address:(OFString*)address cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_session_forward_to_sync([self castedGObject], [folder castedGObject], [message castedGObject], [address UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OGCamelFilterDriver*)filterDriverWithType:(OFString*)type forFolder:(OGCamelFolder*)forFolder
{
	GError* err = NULL;

	CamelFilterDriver* gobjectValue = camel_session_get_filter_driver([self castedGObject], [type UTF8String], [forFolder castedGObject], &err);

	[OGErrorException throwForError:err];

	OGCamelFilterDriver* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (CamelJunkFilter*)junkFilter
{
	CamelJunkFilter* returnValue = (CamelJunkFilter*)camel_session_get_junk_filter([self castedGObject]);

	return returnValue;
}

- (const GHashTable*)junkHeaders
{
	const GHashTable* returnValue = (const GHashTable*)camel_session_get_junk_headers([self castedGObject]);

	return returnValue;
}

- (bool)oauth2AccessTokenSyncWithService:(OGCamelService*)service outAccessToken:(gchar**)outAccessToken outExpiresIn:(gint*)outExpiresIn cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_session_get_oauth2_access_token_sync([self castedGObject], [service castedGObject], outAccessToken, outExpiresIn, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)online
{
	bool returnValue = (bool)camel_session_get_online([self castedGObject]);

	return returnValue;
}

- (OFString*)passwordWithService:(OGCamelService*)service prompt:(OFString*)prompt item:(OFString*)item flags:(guint32)flags
{
	GError* err = NULL;

	gchar* gobjectValue = camel_session_get_password([self castedGObject], [service castedGObject], [prompt UTF8String], [item UTF8String], flags, &err);

	[OGErrorException throwForError:err];

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)recipientCertificatesSyncWithFlags:(guint32)flags recipients:(const GPtrArray*)recipients outCertificates:(GSList**)outCertificates cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_session_get_recipient_certificates_sync([self castedGObject], flags, recipients, outCertificates, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OFString*)userCacheDir
{
	const gchar* gobjectValue = camel_session_get_user_cache_dir([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)userDataDir
{
	const gchar* gobjectValue = camel_session_get_user_data_dir([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint)idleAddWithPriority:(gint)priority function:(GSourceFunc)function data:(gpointer)data notify:(GDestroyNotify)notify
{
	guint returnValue = (guint)camel_session_idle_add([self castedGObject], priority, function, data, notify);

	return returnValue;
}

- (GList*)listServices
{
	GList* returnValue = (GList*)camel_session_list_services([self castedGObject]);

	return returnValue;
}

- (bool)lookupAddressbook:(OFString*)name
{
	bool returnValue = (bool)camel_session_lookup_addressbook([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (GMainContext*)refMainContext
{
	GMainContext* returnValue = (GMainContext*)camel_session_ref_main_context([self castedGObject]);

	return returnValue;
}

- (GNetworkMonitor*)refNetworkMonitor
{
	GNetworkMonitor* returnValue = (GNetworkMonitor*)camel_session_ref_network_monitor([self castedGObject]);

	return returnValue;
}

- (OGCamelService*)refService:(OFString*)uid
{
	CamelService* gobjectValue = camel_session_ref_service([self castedGObject], [uid UTF8String]);

	OGCamelService* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelService*)refServiceByUrlWithUrl:(CamelURL*)url type:(CamelProviderType)type
{
	CamelService* gobjectValue = camel_session_ref_service_by_url([self castedGObject], url, type);

	OGCamelService* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)removeService:(OGCamelService*)service
{
	camel_session_remove_service([self castedGObject], [service castedGObject]);
}

- (void)removeServices
{
	camel_session_remove_services([self castedGObject]);
}

- (void)setJunkFilter:(CamelJunkFilter*)junkFilter
{
	camel_session_set_junk_filter([self castedGObject], junkFilter);
}

- (void)setJunkHeadersWithHeaders:(const gchar**)headers values:(const gchar**)values len:(gint)len
{
	camel_session_set_junk_headers([self castedGObject], headers, values, len);
}

- (void)setNetworkMonitor:(GNetworkMonitor*)networkMonitor
{
	camel_session_set_network_monitor([self castedGObject], networkMonitor);
}

- (void)setOnline:(bool)online
{
	camel_session_set_online([self castedGObject], online);
}

- (void)submitJobWithDescription:(OFString*)description callback:(CamelSessionCallback)callback userData:(gpointer)userData notify:(GDestroyNotify)notify
{
	camel_session_submit_job([self castedGObject], [description UTF8String], callback, userData, notify);
}

- (CamelCertTrust)trustPromptWithService:(OGCamelService*)service certificate:(OGTlsCertificate*)certificate errors:(GTlsCertificateFlags)errors
{
	CamelCertTrust returnValue = (CamelCertTrust)camel_session_trust_prompt([self castedGObject], [service castedGObject], [certificate castedGObject], errors);

	return returnValue;
}

- (void)userAlertWithService:(OGCamelService*)service type:(CamelSessionAlertType)type message:(OFString*)message
{
	camel_session_user_alert([self castedGObject], [service castedGObject], type, [message UTF8String]);
}


@end