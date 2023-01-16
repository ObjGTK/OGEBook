/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESource.h"

#import <OGCamel/OGCamelService.h>

@implementation OGESource

+ (OFString*)parameterToKey:(OFString*)paramName
{
	return [OFString stringWithUTF8String:e_source_parameter_to_key([paramName UTF8String])];
}

- (instancetype)initWithDbusObject:(GDBusObject*)dbusObject mainContext:(GMainContext*)mainContext err:(GError**)err
{
	self = [super initWithGObject:(GObject*)e_source_new(dbusObject, mainContext, err)];

	return self;
}

- (instancetype)initWithUidWithUid:(OFString*)uid mainContext:(GMainContext*)mainContext err:(GError**)err
{
	self = [super initWithGObject:(GObject*)e_source_new_with_uid([uid UTF8String], mainContext, err)];

	return self;
}

- (ESource*)SOURCE
{
	return E_SOURCE([self GOBJECT]);
}

- (void)camelConfigureService:(OGCamelService*)service
{
	e_source_camel_configure_service([self SOURCE], [service SERVICE]);
}

- (void)changed
{
	e_source_changed([self SOURCE]);
}

- (gint)compareByDisplayName:(OGESource*)source2
{
	return e_source_compare_by_display_name([self SOURCE], [source2 SOURCE]);
}

- (void)deletePasswordWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_delete_password([self SOURCE], cancellable, callback, userData);
}

- (bool)deletePasswordFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_delete_password_finish([self SOURCE], result, err);
}

- (bool)deletePasswordSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_delete_password_sync([self SOURCE], cancellable, err);
}

- (OFString*)dupDisplayName
{
	return [OFString stringWithUTF8String:e_source_dup_display_name([self SOURCE])];
}

- (OFString*)dupParent
{
	return [OFString stringWithUTF8String:e_source_dup_parent([self SOURCE])];
}

- (OFString*)dupSecretLabel
{
	return [OFString stringWithUTF8String:e_source_dup_secret_label([self SOURCE])];
}

- (OFString*)dupUid
{
	return [OFString stringWithUTF8String:e_source_dup_uid([self SOURCE])];
}

- (void)emitCredentialsRequiredWithReason:(ESourceCredentialsReason)reason certificatePem:(OFString*)certificatePem certificateErrors:(GTlsCertificateFlags)certificateErrors opError:(const GError*)opError
{
	e_source_emit_credentials_required([self SOURCE], reason, [certificatePem UTF8String], certificateErrors, opError);
}

- (bool)equal:(OGESource*)source2
{
	return e_source_equal([self SOURCE], [source2 SOURCE]);
}

- (ESourceConnectionStatus)connectionStatus
{
	return e_source_get_connection_status([self SOURCE]);
}

- (OFString*)displayName
{
	return [OFString stringWithUTF8String:e_source_get_display_name([self SOURCE])];
}

- (bool)enabled
{
	return e_source_get_enabled([self SOURCE]);
}

- (gpointer)extension:(OFString*)extensionName
{
	return e_source_get_extension([self SOURCE], [extensionName UTF8String]);
}

- (void)lastCredentialsRequiredArgumentsWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_get_last_credentials_required_arguments([self SOURCE], cancellable, callback, userData);
}

- (bool)lastCredentialsRequiredArgumentsFinishWithResult:(GAsyncResult*)result outReason:(ESourceCredentialsReason*)outReason outCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors outOpError:(GError**)outOpError err:(GError**)err
{
	return e_source_get_last_credentials_required_arguments_finish([self SOURCE], result, outReason, outCertificatePem, outCertificateErrors, outOpError, err);
}

- (bool)lastCredentialsRequiredArgumentsSyncWithOutReason:(ESourceCredentialsReason*)outReason outCertificatePem:(gchar**)outCertificatePem outCertificateErrors:(GTlsCertificateFlags*)outCertificateErrors outOpError:(GError**)outOpError cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_get_last_credentials_required_arguments_sync([self SOURCE], outReason, outCertificatePem, outCertificateErrors, outOpError, cancellable, err);
}

- (void)oauth2AccessTokenWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_get_oauth2_access_token([self SOURCE], cancellable, callback, userData);
}

- (bool)oauth2AccessTokenFinishWithResult:(GAsyncResult*)result outAccessToken:(gchar**)outAccessToken outExpiresIn:(gint*)outExpiresIn err:(GError**)err
{
	return e_source_get_oauth2_access_token_finish([self SOURCE], result, outAccessToken, outExpiresIn, err);
}

- (bool)oauth2AccessTokenSyncWithCancellable:(GCancellable*)cancellable outAccessToken:(gchar**)outAccessToken outExpiresIn:(gint*)outExpiresIn err:(GError**)err
{
	return e_source_get_oauth2_access_token_sync([self SOURCE], cancellable, outAccessToken, outExpiresIn, err);
}

- (OFString*)parent
{
	return [OFString stringWithUTF8String:e_source_get_parent([self SOURCE])];
}

- (bool)remoteCreatable
{
	return e_source_get_remote_creatable([self SOURCE]);
}

- (bool)remoteDeletable
{
	return e_source_get_remote_deletable([self SOURCE]);
}

- (bool)removable
{
	return e_source_get_removable([self SOURCE]);
}

- (OFString*)uid
{
	return [OFString stringWithUTF8String:e_source_get_uid([self SOURCE])];
}

- (bool)writable
{
	return e_source_get_writable([self SOURCE]);
}

- (bool)hasExtension:(OFString*)extensionName
{
	return e_source_has_extension([self SOURCE], [extensionName UTF8String]);
}

- (guint)hash
{
	return e_source_hash([self SOURCE]);
}

- (void)invokeAuthenticateWithCredentials:(const ENamedParameters*)credentials cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_invoke_authenticate([self SOURCE], credentials, cancellable, callback, userData);
}

- (bool)invokeAuthenticateFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_invoke_authenticate_finish([self SOURCE], result, err);
}

- (bool)invokeAuthenticateSyncWithCredentials:(const ENamedParameters*)credentials cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_invoke_authenticate_sync([self SOURCE], credentials, cancellable, err);
}

- (void)invokeCredentialsRequiredWithReason:(ESourceCredentialsReason)reason certificatePem:(OFString*)certificatePem certificateErrors:(GTlsCertificateFlags)certificateErrors opError:(const GError*)opError cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_invoke_credentials_required([self SOURCE], reason, [certificatePem UTF8String], certificateErrors, opError, cancellable, callback, userData);
}

- (bool)invokeCredentialsRequiredFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_invoke_credentials_required_finish([self SOURCE], result, err);
}

- (bool)invokeCredentialsRequiredSyncWithReason:(ESourceCredentialsReason)reason certificatePem:(OFString*)certificatePem certificateErrors:(GTlsCertificateFlags)certificateErrors opError:(const GError*)opError cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_invoke_credentials_required_sync([self SOURCE], reason, [certificatePem UTF8String], certificateErrors, opError, cancellable, err);
}

- (void)lookupPasswordWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_lookup_password([self SOURCE], cancellable, callback, userData);
}

- (bool)lookupPasswordFinishWithResult:(GAsyncResult*)result outPassword:(gchar**)outPassword err:(GError**)err
{
	return e_source_lookup_password_finish([self SOURCE], result, outPassword, err);
}

- (bool)lookupPasswordSyncWithCancellable:(GCancellable*)cancellable outPassword:(gchar**)outPassword err:(GError**)err
{
	return e_source_lookup_password_sync([self SOURCE], cancellable, outPassword, err);
}

- (void)mailSignatureLoadWithIoPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_mail_signature_load([self SOURCE], ioPriority, cancellable, callback, userData);
}

- (bool)mailSignatureLoadFinishWithResult:(GAsyncResult*)result contents:(gchar**)contents length:(gsize*)length err:(GError**)err
{
	return e_source_mail_signature_load_finish([self SOURCE], result, contents, length, err);
}

- (bool)mailSignatureLoadSyncWithContents:(gchar**)contents length:(gsize*)length cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_mail_signature_load_sync([self SOURCE], contents, length, cancellable, err);
}

- (void)mailSignatureReplaceWithContents:(OFString*)contents length:(gsize)length ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_mail_signature_replace([self SOURCE], [contents UTF8String], length, ioPriority, cancellable, callback, userData);
}

- (bool)mailSignatureReplaceFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_mail_signature_replace_finish([self SOURCE], result, err);
}

- (bool)mailSignatureReplaceSyncWithContents:(OFString*)contents length:(gsize)length cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_mail_signature_replace_sync([self SOURCE], [contents UTF8String], length, cancellable, err);
}

- (void)mailSignatureSymlinkWithSymlinkTarget:(OFString*)symlinkTarget ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_mail_signature_symlink([self SOURCE], [symlinkTarget UTF8String], ioPriority, cancellable, callback, userData);
}

- (bool)mailSignatureSymlinkFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_mail_signature_symlink_finish([self SOURCE], result, err);
}

- (bool)mailSignatureSymlinkSyncWithSymlinkTarget:(OFString*)symlinkTarget cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_mail_signature_symlink_sync([self SOURCE], [symlinkTarget UTF8String], cancellable, err);
}

- (void)proxyLookupWithUri:(OFString*)uri cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_proxy_lookup([self SOURCE], [uri UTF8String], cancellable, callback, userData);
}

- (gchar**)proxyLookupFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_proxy_lookup_finish([self SOURCE], result, err);
}

- (gchar**)proxyLookupSyncWithUri:(OFString*)uri cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_proxy_lookup_sync([self SOURCE], [uri UTF8String], cancellable, err);
}

- (GDBusObject*)refDbusObject
{
	return e_source_ref_dbus_object([self SOURCE]);
}

- (GMainContext*)refMainContext
{
	return e_source_ref_main_context([self SOURCE]);
}

- (guint)refreshAddTimeoutWithContext:(GMainContext*)context callback:(ESourceRefreshFunc)callback userData:(gpointer)userData notify:(GDestroyNotify)notify
{
	return e_source_refresh_add_timeout([self SOURCE], context, callback, userData, notify);
}

- (void)refreshForceTimeout
{
	e_source_refresh_force_timeout([self SOURCE]);
}

- (bool)refreshRemoveTimeout:(guint)refreshTimeoutId
{
	return e_source_refresh_remove_timeout([self SOURCE], refreshTimeoutId);
}

- (guint)refreshRemoveTimeoutsByData:(gpointer)userData
{
	return e_source_refresh_remove_timeouts_by_data([self SOURCE], userData);
}

- (void)remoteCreateWithScratchSource:(OGESource*)scratchSource cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_remote_create([self SOURCE], [scratchSource SOURCE], cancellable, callback, userData);
}

- (bool)remoteCreateFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_remote_create_finish([self SOURCE], result, err);
}

- (bool)remoteCreateSyncWithScratchSource:(OGESource*)scratchSource cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_remote_create_sync([self SOURCE], [scratchSource SOURCE], cancellable, err);
}

- (void)remoteDeleteWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_remote_delete([self SOURCE], cancellable, callback, userData);
}

- (bool)remoteDeleteFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_remote_delete_finish([self SOURCE], result, err);
}

- (bool)remoteDeleteSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_remote_delete_sync([self SOURCE], cancellable, err);
}

- (void)removeWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_remove([self SOURCE], cancellable, callback, userData);
}

- (bool)removeFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_remove_finish([self SOURCE], result, err);
}

- (bool)removeSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_remove_sync([self SOURCE], cancellable, err);
}

- (void)setConnectionStatus:(ESourceConnectionStatus)connectionStatus
{
	e_source_set_connection_status([self SOURCE], connectionStatus);
}

- (void)setDisplayName:(OFString*)displayName
{
	e_source_set_display_name([self SOURCE], [displayName UTF8String]);
}

- (void)setEnabled:(bool)enabled
{
	e_source_set_enabled([self SOURCE], enabled);
}

- (void)setParent:(OFString*)parent
{
	e_source_set_parent([self SOURCE], [parent UTF8String]);
}

- (void)storePasswordWithPassword:(OFString*)password permanently:(bool)permanently cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_store_password([self SOURCE], [password UTF8String], permanently, cancellable, callback, userData);
}

- (bool)storePasswordFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_store_password_finish([self SOURCE], result, err);
}

- (bool)storePasswordSyncWithPassword:(OFString*)password permanently:(bool)permanently cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_store_password_sync([self SOURCE], [password UTF8String], permanently, cancellable, err);
}

- (OFString*)toString:(gsize*)length
{
	return [OFString stringWithUTF8String:e_source_to_string([self SOURCE], length)];
}

- (void)unsetLastCredentialsRequiredArgumentsWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_unset_last_credentials_required_arguments([self SOURCE], cancellable, callback, userData);
}

- (bool)unsetLastCredentialsRequiredArgumentsFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_unset_last_credentials_required_arguments_finish([self SOURCE], result, err);
}

- (bool)unsetLastCredentialsRequiredArgumentsSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_unset_last_credentials_required_arguments_sync([self SOURCE], cancellable, err);
}

- (void)writeWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_write([self SOURCE], cancellable, callback, userData);
}

- (bool)writeFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_write_finish([self SOURCE], result, err);
}

- (bool)writeSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_write_sync([self SOURCE], cancellable, err);
}


@end