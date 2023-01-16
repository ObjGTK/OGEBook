/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEWebDAVSession.h"

#import "OGESource.h"

@implementation OGEWebDAVSession

+ (void)utilFreePrivileges:(GNode*)privileges
{
	e_webdav_session_util_free_privileges(privileges);
}

+ (bool)utilItemHrefEqualWithHref1:(OFString*)href1 href2:(OFString*)href2
{
	return e_webdav_session_util_item_href_equal([href1 UTF8String], [href2 UTF8String]);
}

+ (OFString*)utilMaybeDequote:(OFString*)text
{
	return [OFString stringWithUTF8String:e_webdav_session_util_maybe_dequote((gchar*) [text UTF8String])];
}

- (instancetype)init:(OGESource*)source
{
	self = [super initWithGObject:(GObject*)e_webdav_session_new([source SOURCE])];

	return self;
}

- (EWebDAVSession*)WEBDAVSESSION
{
	return E_WEBDAV_SESSION([self GOBJECT]);
}

- (bool)aclSyncWithUri:(OFString*)uri xml:(const EXmlDocument*)xml cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_acl_sync([self WEBDAVSESSION], [uri UTF8String], xml, cancellable, err);
}

- (bool)copySyncWithSourceUri:(OFString*)sourceUri destinationUri:(OFString*)destinationUri depth:(OFString*)depth canOverwrite:(bool)canOverwrite cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_copy_sync([self WEBDAVSESSION], [sourceUri UTF8String], [destinationUri UTF8String], [depth UTF8String], canOverwrite, cancellable, err);
}

- (bool)deleteSyncWithUri:(OFString*)uri depth:(OFString*)depth etag:(OFString*)etag cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_delete_sync([self WEBDAVSESSION], [uri UTF8String], [depth UTF8String], [etag UTF8String], cancellable, err);
}

- (OFString*)ensureFullUriWithRequestUri:(const SoupURI*)requestUri href:(OFString*)href
{
	return [OFString stringWithUTF8String:e_webdav_session_ensure_full_uri([self WEBDAVSESSION], requestUri, [href UTF8String])];
}

- (bool)aclRestrictionsSyncWithUri:(OFString*)uri outRestrictions:(guint32*)outRestrictions outPrincipalKind:(EWebDAVACEPrincipalKind*)outPrincipalKind outPrincipalHrefs:(GSList**)outPrincipalHrefs cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_get_acl_restrictions_sync([self WEBDAVSESSION], [uri UTF8String], outRestrictions, outPrincipalKind, outPrincipalHrefs, cancellable, err);
}

- (bool)aclSyncWithUri:(OFString*)uri outEntries:(GSList**)outEntries cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_get_acl_sync([self WEBDAVSESSION], [uri UTF8String], outEntries, cancellable, err);
}

- (bool)currentUserPrivilegeSetSyncWithUri:(OFString*)uri outPrivileges:(GSList**)outPrivileges cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_get_current_user_privilege_set_sync([self WEBDAVSESSION], [uri UTF8String], outPrivileges, cancellable, err);
}

- (bool)dataSyncWithUri:(OFString*)uri outHref:(gchar**)outHref outEtag:(gchar**)outEtag outBytes:(gchar**)outBytes outLength:(gsize*)outLength cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_get_data_sync([self WEBDAVSESSION], [uri UTF8String], outHref, outEtag, outBytes, outLength, cancellable, err);
}

- (OFString*)lastDavErrorCode
{
	return [OFString stringWithUTF8String:e_webdav_session_get_last_dav_error_code([self WEBDAVSESSION])];
}

- (bool)lastDavErrorIsPermission
{
	return e_webdav_session_get_last_dav_error_is_permission([self WEBDAVSESSION]);
}

- (bool)principalCollectionSetSyncWithUri:(OFString*)uri outPrincipalHrefs:(GSList**)outPrincipalHrefs cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_get_principal_collection_set_sync([self WEBDAVSESSION], [uri UTF8String], outPrincipalHrefs, cancellable, err);
}

- (bool)supportedPrivilegeSetSyncWithUri:(OFString*)uri outPrivileges:(GNode**)outPrivileges cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_get_supported_privilege_set_sync([self WEBDAVSESSION], [uri UTF8String], outPrivileges, cancellable, err);
}

- (bool)syncWithUri:(OFString*)uri outHref:(gchar**)outHref outEtag:(gchar**)outEtag outStream:(GOutputStream*)outStream cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_get_sync([self WEBDAVSESSION], [uri UTF8String], outHref, outEtag, outStream, cancellable, err);
}

- (bool)ctagSyncWithUri:(OFString*)uri outCtag:(gchar**)outCtag cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_getctag_sync([self WEBDAVSESSION], [uri UTF8String], outCtag, cancellable, err);
}

- (bool)listSyncWithUri:(OFString*)uri depth:(OFString*)depth flags:(guint32)flags outResources:(GSList**)outResources cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_list_sync([self WEBDAVSESSION], [uri UTF8String], [depth UTF8String], flags, outResources, cancellable, err);
}

- (bool)lockResourceSyncWithUri:(OFString*)uri lockScope:(EWebDAVLockScope)lockScope lockTimeout:(gint32)lockTimeout owner:(OFString*)owner outLockToken:(gchar**)outLockToken cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_lock_resource_sync([self WEBDAVSESSION], [uri UTF8String], lockScope, lockTimeout, [owner UTF8String], outLockToken, cancellable, err);
}

- (bool)lockSyncWithUri:(OFString*)uri depth:(OFString*)depth lockTimeout:(gint32)lockTimeout xml:(const EXmlDocument*)xml outLockToken:(gchar**)outLockToken outXmlResponse:(xmlDoc**)outXmlResponse cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_lock_sync([self WEBDAVSESSION], [uri UTF8String], [depth UTF8String], lockTimeout, xml, outLockToken, outXmlResponse, cancellable, err);
}

- (bool)mkcalendarSyncWithUri:(OFString*)uri displayName:(OFString*)displayName description:(OFString*)description color:(OFString*)color supports:(guint32)supports cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_mkcalendar_sync([self WEBDAVSESSION], [uri UTF8String], [displayName UTF8String], [description UTF8String], [color UTF8String], supports, cancellable, err);
}

- (bool)mkcolAddressbookSyncWithUri:(OFString*)uri displayName:(OFString*)displayName description:(OFString*)description cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_mkcol_addressbook_sync([self WEBDAVSESSION], [uri UTF8String], [displayName UTF8String], [description UTF8String], cancellable, err);
}

- (bool)mkcolSyncWithUri:(OFString*)uri cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_mkcol_sync([self WEBDAVSESSION], [uri UTF8String], cancellable, err);
}

- (bool)moveSyncWithSourceUri:(OFString*)sourceUri destinationUri:(OFString*)destinationUri canOverwrite:(bool)canOverwrite cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_move_sync([self WEBDAVSESSION], [sourceUri UTF8String], [destinationUri UTF8String], canOverwrite, cancellable, err);
}

- (SoupRequestHTTP*)newRequestWithMethod:(OFString*)method uri:(OFString*)uri err:(GError**)err
{
	return e_webdav_session_new_request([self WEBDAVSESSION], [method UTF8String], [uri UTF8String], err);
}

- (bool)optionsSyncWithUri:(OFString*)uri outCapabilities:(GHashTable**)outCapabilities outAllows:(GHashTable**)outAllows cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_options_sync([self WEBDAVSESSION], [uri UTF8String], outCapabilities, outAllows, cancellable, err);
}

- (bool)postSyncWithUri:(OFString*)uri data:(OFString*)data dataLength:(gsize)dataLength outContentType:(gchar**)outContentType outContent:(GByteArray**)outContent cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_post_sync([self WEBDAVSESSION], [uri UTF8String], [data UTF8String], dataLength, outContentType, outContent, cancellable, err);
}

- (bool)postWithContentTypeSyncWithUri:(OFString*)uri data:(OFString*)data dataLength:(gsize)dataLength inContentType:(OFString*)inContentType outContentType:(gchar**)outContentType outContent:(GByteArray**)outContent cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_post_with_content_type_sync([self WEBDAVSESSION], [uri UTF8String], [data UTF8String], dataLength, [inContentType UTF8String], outContentType, outContent, cancellable, err);
}

- (bool)principalPropertySearchSyncWithUri:(OFString*)uri applyToPrincipalCollectionSet:(bool)applyToPrincipalCollectionSet matchNsUri:(OFString*)matchNsUri matchProperty:(OFString*)matchProperty matchValue:(OFString*)matchValue outPrincipals:(GSList**)outPrincipals cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_principal_property_search_sync([self WEBDAVSESSION], [uri UTF8String], applyToPrincipalCollectionSet, [matchNsUri UTF8String], [matchProperty UTF8String], [matchValue UTF8String], outPrincipals, cancellable, err);
}

- (bool)propfindSyncWithUri:(OFString*)uri depth:(OFString*)depth xml:(const EXmlDocument*)xml func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_propfind_sync([self WEBDAVSESSION], [uri UTF8String], [depth UTF8String], xml, func, funcUserData, cancellable, err);
}

- (bool)proppatchSyncWithUri:(OFString*)uri xml:(const EXmlDocument*)xml cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_proppatch_sync([self WEBDAVSESSION], [uri UTF8String], xml, cancellable, err);
}

- (bool)putDataSyncWithUri:(OFString*)uri etag:(OFString*)etag contentType:(OFString*)contentType bytes:(OFString*)bytes length:(gsize)length outHref:(gchar**)outHref outEtag:(gchar**)outEtag cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_put_data_sync([self WEBDAVSESSION], [uri UTF8String], [etag UTF8String], [contentType UTF8String], [bytes UTF8String], length, outHref, outEtag, cancellable, err);
}

- (bool)putSyncWithUri:(OFString*)uri etag:(OFString*)etag contentType:(OFString*)contentType stream:(GInputStream*)stream outHref:(gchar**)outHref outEtag:(gchar**)outEtag cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_put_sync([self WEBDAVSESSION], [uri UTF8String], [etag UTF8String], [contentType UTF8String], stream, outHref, outEtag, cancellable, err);
}

- (bool)refreshLockSyncWithUri:(OFString*)uri lockToken:(OFString*)lockToken lockTimeout:(gint32)lockTimeout cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_refresh_lock_sync([self WEBDAVSESSION], [uri UTF8String], [lockToken UTF8String], lockTimeout, cancellable, err);
}

- (bool)replaceWithDetailedErrorWithRequest:(SoupRequestHTTP*)request responseData:(const GByteArray*)responseData ignoreMultistatus:(bool)ignoreMultistatus prefix:(OFString*)prefix err:(GError**)err
{
	return e_webdav_session_replace_with_detailed_error([self WEBDAVSESSION], request, responseData, ignoreMultistatus, [prefix UTF8String], err);
}

- (bool)reportSyncWithUri:(OFString*)uri depth:(OFString*)depth xml:(const EXmlDocument*)xml func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData outContentType:(gchar**)outContentType outContent:(GByteArray**)outContent cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_report_sync([self WEBDAVSESSION], [uri UTF8String], [depth UTF8String], xml, func, funcUserData, outContentType, outContent, cancellable, err);
}

- (bool)setAclSyncWithUri:(OFString*)uri entries:(const GSList*)entries cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_set_acl_sync([self WEBDAVSESSION], [uri UTF8String], entries, cancellable, err);
}

- (bool)traverseMkcalendarResponseWithMessage:(const SoupMessage*)message xmlData:(const GByteArray*)xmlData func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData err:(GError**)err
{
	return e_webdav_session_traverse_mkcalendar_response([self WEBDAVSESSION], message, xmlData, func, funcUserData, err);
}

- (bool)traverseMkcolResponseWithMessage:(const SoupMessage*)message xmlData:(const GByteArray*)xmlData func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData err:(GError**)err
{
	return e_webdav_session_traverse_mkcol_response([self WEBDAVSESSION], message, xmlData, func, funcUserData, err);
}

- (bool)traverseMultistatusResponseWithMessage:(const SoupMessage*)message xmlData:(const GByteArray*)xmlData func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData err:(GError**)err
{
	return e_webdav_session_traverse_multistatus_response([self WEBDAVSESSION], message, xmlData, func, funcUserData, err);
}

- (bool)unlockSyncWithUri:(OFString*)uri lockToken:(OFString*)lockToken cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_unlock_sync([self WEBDAVSESSION], [uri UTF8String], [lockToken UTF8String], cancellable, err);
}

- (bool)updatePropertiesSyncWithUri:(OFString*)uri changes:(const GSList*)changes cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_webdav_session_update_properties_sync([self WEBDAVSESSION], [uri UTF8String], changes, cancellable, err);
}


@end