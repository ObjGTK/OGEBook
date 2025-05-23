/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESource.h"

#import <OGCamel/OGCamelService.h>
#import <OGio/OGCancellable.h>

@implementation OGESource

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OFString*)parameterToKeyWithParamName:(OFString*)paramName
{
	gchar* gobjectValue = e_source_parameter_to_key([paramName UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

+ (instancetype)sourceWithDbusObject:(GDBusObject*)dbusObject mainContext:(GMainContext*)mainContext
{
	GError* err = NULL;

	ESource* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_source_new(dbusObject, mainContext, &err), ESource, ESource);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGESource* wrapperObject;
	@try {
		wrapperObject = [[OGESource alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)sourceWithUid:(OFString*)uid mainContext:(GMainContext*)mainContext
{
	GError* err = NULL;

	ESource* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_source_new_with_uid([uid UTF8String], mainContext, &err), ESource, ESource);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGESource* wrapperObject;
	@try {
		wrapperObject = [[OGESource alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (ESource*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESource, ESource);
}

- (void)camelConfigureService:(OGCamelService*)service
{
	e_source_camel_configure_service([self castedGObject], [service castedGObject]);
}

- (void)changed
{
	e_source_changed([self castedGObject]);
}

- (gint)compareByDisplayNameWithSource2:(OGESource*)source2
{
	gint returnValue = (gint)e_source_compare_by_display_name([self castedGObject], [source2 castedGObject]);

	return returnValue;
}

- (void)deletePasswordWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_delete_password([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)deletePasswordFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_delete_password_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)deletePasswordSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_delete_password_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OFString*)dupDisplayName
{
	gchar* gobjectValue = e_source_dup_display_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupParent
{
	gchar* gobjectValue = e_source_dup_parent([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupSecretLabel
{
	gchar* gobjectValue = e_source_dup_secret_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupUid
{
	gchar* gobjectValue = e_source_dup_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)emitCredentialsRequiredWithReason:(ESourceCredentialsReason)reason certificatePem:(OFString*)certificatePem certificateErrors:(GTlsCertificateFlags)certificateErrors opError:(const GError*)opError
{
	e_source_emit_credentials_required([self castedGObject], reason, [certificatePem UTF8String], certificateErrors, opError);
}

- (bool)equalWithSource2:(OGESource*)source2
{
	bool returnValue = (bool)e_source_equal([self castedGObject], [source2 castedGObject]);

	return returnValue;
}

- (ESourceConnectionStatus)connectionStatus
{
	ESourceConnectionStatus returnValue = (ESourceConnectionStatus)e_source_get_connection_status([self castedGObject]);

	return returnValue;
}

- (OFString*)displayName
{
	const gchar* gobjectValue = e_source_get_display_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)enabled
{
	bool returnValue = (bool)e_source_get_enabled([self castedGObject]);

	return returnValue;
}

- (gpointer)extensionWithExtensionName:(OFString*)extensionName
{
	gpointer returnValue = (gpointer)e_source_get_extension([self castedGObject], [extensionName UTF8String]);

	return returnValue;
}

- (void)lastCredentialsRequiredArgumentsWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_get_last_credentials_required_arguments([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)lastCredentialsRequiredArgumentsFinishWithResult:(GAsyncResult*)result outReason:(ESourceCredentialsReason*)outReason outCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors outOpError:(GError**)outOpError
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_get_last_credentials_required_arguments_finish([self castedGObject], result, outReason, outCertificatePem, outCertificateErrors, outOpError, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)lastCredentialsRequiredArgumentsSyncWithOutReason:(ESourceCredentialsReason*)outReason outCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors outOpError:(GError**)outOpError cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_get_last_credentials_required_arguments_sync([self castedGObject], outReason, outCertificatePem, outCertificateErrors, outOpError, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)oauth2AccessTokenWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_get_oauth2_access_token([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)oauth2AccessTokenFinishWithResult:(GAsyncResult*)result outAccessToken:(gchar**)outAccessToken outExpiresIn:(gint*)outExpiresIn
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_get_oauth2_access_token_finish([self castedGObject], result, outAccessToken, outExpiresIn, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)oauth2AccessTokenSyncWithCancellable:(OGCancellable*)cancellable outAccessToken:(gchar**)outAccessToken outExpiresIn:(gint*)outExpiresIn
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_get_oauth2_access_token_sync([self castedGObject], [cancellable castedGObject], outAccessToken, outExpiresIn, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OFString*)parent
{
	const gchar* gobjectValue = e_source_get_parent([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)remoteCreatable
{
	bool returnValue = (bool)e_source_get_remote_creatable([self castedGObject]);

	return returnValue;
}

- (bool)remoteDeletable
{
	bool returnValue = (bool)e_source_get_remote_deletable([self castedGObject]);

	return returnValue;
}

- (bool)removable
{
	bool returnValue = (bool)e_source_get_removable([self castedGObject]);

	return returnValue;
}

- (OFString*)uid
{
	const gchar* gobjectValue = e_source_get_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)writable
{
	bool returnValue = (bool)e_source_get_writable([self castedGObject]);

	return returnValue;
}

- (bool)hasExtensionWithExtensionName:(OFString*)extensionName
{
	bool returnValue = (bool)e_source_has_extension([self castedGObject], [extensionName UTF8String]);

	return returnValue;
}

- (guint)hash
{
	guint returnValue = (guint)e_source_hash([self castedGObject]);

	return returnValue;
}

- (void)invokeAuthenticateWithCredentials:(const ENamedParameters*)credentials cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_invoke_authenticate([self castedGObject], credentials, [cancellable castedGObject], callback, userData);
}

- (bool)invokeAuthenticateFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_invoke_authenticate_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)invokeAuthenticateSyncWithCredentials:(const ENamedParameters*)credentials cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_invoke_authenticate_sync([self castedGObject], credentials, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)invokeCredentialsRequiredWithReason:(ESourceCredentialsReason)reason certificatePem:(OFString*)certificatePem certificateErrors:(GTlsCertificateFlags)certificateErrors opError:(const GError*)opError cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_invoke_credentials_required([self castedGObject], reason, [certificatePem UTF8String], certificateErrors, opError, [cancellable castedGObject], callback, userData);
}

- (bool)invokeCredentialsRequiredFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_invoke_credentials_required_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)invokeCredentialsRequiredSyncWithReason:(ESourceCredentialsReason)reason certificatePem:(OFString*)certificatePem certificateErrors:(GTlsCertificateFlags)certificateErrors opError:(const GError*)opError cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_invoke_credentials_required_sync([self castedGObject], reason, [certificatePem UTF8String], certificateErrors, opError, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)lookupPasswordWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_lookup_password([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)lookupPasswordFinishWithResult:(GAsyncResult*)result outPassword:(gchar**)outPassword
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_lookup_password_finish([self castedGObject], result, outPassword, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)lookupPasswordSyncWithCancellable:(OGCancellable*)cancellable outPassword:(gchar**)outPassword
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_lookup_password_sync([self castedGObject], [cancellable castedGObject], outPassword, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)mailSignatureLoadWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_mail_signature_load([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)mailSignatureLoadFinishWithResult:(GAsyncResult*)result contents:(gchar**)contents length:(gsize*)length
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_mail_signature_load_finish([self castedGObject], result, contents, length, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)mailSignatureLoadSyncWithContents:(gchar**)contents length:(gsize*)length cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_mail_signature_load_sync([self castedGObject], contents, length, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)mailSignatureReplaceWithContents:(OFString*)contents length:(gsize)length ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_mail_signature_replace([self castedGObject], [contents UTF8String], length, ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)mailSignatureReplaceFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_mail_signature_replace_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)mailSignatureReplaceSyncWithContents:(OFString*)contents length:(gsize)length cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_mail_signature_replace_sync([self castedGObject], [contents UTF8String], length, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)mailSignatureSymlinkWithSymlinkTarget:(OFString*)symlinkTarget ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_mail_signature_symlink([self castedGObject], [symlinkTarget UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)mailSignatureSymlinkFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_mail_signature_symlink_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)mailSignatureSymlinkSyncWithSymlinkTarget:(OFString*)symlinkTarget cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_mail_signature_symlink_sync([self castedGObject], [symlinkTarget UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)proxyLookupWithUri:(OFString*)uri cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_proxy_lookup([self castedGObject], [uri UTF8String], [cancellable castedGObject], callback, userData);
}

- (gchar**)proxyLookupFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	gchar** returnValue = (gchar**)e_source_proxy_lookup_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gchar**)proxyLookupSyncWithUri:(OFString*)uri cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gchar** returnValue = (gchar**)e_source_proxy_lookup_sync([self castedGObject], [uri UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GDBusObject*)refDbusObject
{
	GDBusObject* returnValue = (GDBusObject*)e_source_ref_dbus_object([self castedGObject]);

	return returnValue;
}

- (GMainContext*)refMainContext
{
	GMainContext* returnValue = (GMainContext*)e_source_ref_main_context([self castedGObject]);

	return returnValue;
}

- (guint)refreshAddTimeoutWithContext:(GMainContext*)context callback:(ESourceRefreshFunc)callback userData:(gpointer)userData notify:(GDestroyNotify)notify
{
	guint returnValue = (guint)e_source_refresh_add_timeout([self castedGObject], context, callback, userData, notify);

	return returnValue;
}

- (void)refreshForceTimeout
{
	e_source_refresh_force_timeout([self castedGObject]);
}

- (bool)refreshRemoveTimeoutWithRefreshTimeoutId:(guint)refreshTimeoutId
{
	bool returnValue = (bool)e_source_refresh_remove_timeout([self castedGObject], refreshTimeoutId);

	return returnValue;
}

- (guint)refreshRemoveTimeoutsByDataWithUserData:(gpointer)userData
{
	guint returnValue = (guint)e_source_refresh_remove_timeouts_by_data([self castedGObject], userData);

	return returnValue;
}

- (void)remoteCreateWithScratchSource:(OGESource*)scratchSource cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_remote_create([self castedGObject], [scratchSource castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)remoteCreateFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_remote_create_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)remoteCreateSyncWithScratchSource:(OGESource*)scratchSource cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_remote_create_sync([self castedGObject], [scratchSource castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)remoteDeleteWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_remote_delete([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)remoteDeleteFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_remote_delete_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)remoteDeleteSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_remote_delete_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)removeWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_remove([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)removeFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_remove_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)removeSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_remove_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setConnectionStatus:(ESourceConnectionStatus)connectionStatus
{
	e_source_set_connection_status([self castedGObject], connectionStatus);
}

- (void)setDisplayName:(OFString*)displayName
{
	e_source_set_display_name([self castedGObject], [displayName UTF8String]);
}

- (void)setEnabled:(bool)enabled
{
	e_source_set_enabled([self castedGObject], enabled);
}

- (void)setParent:(OFString*)parent
{
	e_source_set_parent([self castedGObject], [parent UTF8String]);
}

- (void)storePassword:(OFString*)password permanently:(bool)permanently cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_store_password([self castedGObject], [password UTF8String], permanently, [cancellable castedGObject], callback, userData);
}

- (bool)storePasswordFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_store_password_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)storePasswordSync:(OFString*)password permanently:(bool)permanently cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_store_password_sync([self castedGObject], [password UTF8String], permanently, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OFString*)toStringWithLength:(gsize*)length
{
	gchar* gobjectValue = e_source_to_string([self castedGObject], length);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)unsetLastCredentialsRequiredArgumentsWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_unset_last_credentials_required_arguments([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)unsetLastCredentialsRequiredArgumentsFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_unset_last_credentials_required_arguments_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)unsetLastCredentialsRequiredArgumentsSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_unset_last_credentials_required_arguments_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)writeWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_write([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)writeFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_write_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)writeSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_write_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end