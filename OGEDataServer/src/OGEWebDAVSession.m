/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEWebDAVSession.h"

#import <OGio/OGInputStream.h>
#import <OGio/OGOutputStream.h>
#import <OGio/OGCancellable.h>
#import "OGESource.h"

@implementation OGEWebDAVSession

+ (void)utilFreePrivileges:(GNode*)privileges
{
	e_webdav_session_util_free_privileges(privileges);
}

+ (bool)utilItemHrefEqualWithHref1:(OFString*)href1 href2:(OFString*)href2
{
	bool returnValue = e_webdav_session_util_item_href_equal([href1 UTF8String], [href2 UTF8String]);

	return returnValue;
}

+ (OFString*)utilMaybeDequote:(OFString*)text
{
	gchar* gobjectValue = e_webdav_session_util_maybe_dequote(g_strdup([text UTF8String]));

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (instancetype)init:(OGESource*)source
{
	EWebDAVSession* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_webdav_session_new([source castedGObject]), EWebDAVSession, EWebDAVSession);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (EWebDAVSession*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EWebDAVSession, EWebDAVSession);
}

- (bool)aclSyncWithUri:(OFString*)uri xml:(const EXmlDocument*)xml cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_acl_sync([self castedGObject], [uri UTF8String], xml, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)copySyncWithSourceUri:(OFString*)sourceUri destinationUri:(OFString*)destinationUri depth:(OFString*)depth canOverwrite:(bool)canOverwrite cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_copy_sync([self castedGObject], [sourceUri UTF8String], [destinationUri UTF8String], [depth UTF8String], canOverwrite, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)deleteSyncWithUri:(OFString*)uri depth:(OFString*)depth etag:(OFString*)etag cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_delete_sync([self castedGObject], [uri UTF8String], [depth UTF8String], [etag UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)deleteWithHeadersSyncWithUri:(OFString*)uri depth:(OFString*)depth etag:(OFString*)etag inHeaders:(SoupMessageHeaders*)inHeaders cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_delete_with_headers_sync([self castedGObject], [uri UTF8String], [depth UTF8String], [etag UTF8String], inHeaders, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OFString*)ensureFullUriWithRequestUri:(const GUri*)requestUri href:(OFString*)href
{
	gchar* gobjectValue = e_webdav_session_ensure_full_uri([self castedGObject], requestUri, [href UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)aclRestrictionsSyncWithUri:(OFString*)uri outRestrictions:(guint32*)outRestrictions outPrincipalKind:(EWebDAVACEPrincipalKind*)outPrincipalKind outPrincipalHrefs:(GSList**)outPrincipalHrefs cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_get_acl_restrictions_sync([self castedGObject], [uri UTF8String], outRestrictions, outPrincipalKind, outPrincipalHrefs, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)aclSyncWithUri:(OFString*)uri outEntries:(GSList**)outEntries cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_get_acl_sync([self castedGObject], [uri UTF8String], outEntries, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)currentUserPrivilegeSetFullSyncWithUri:(OFString*)uri outPrivileges:(GSList**)outPrivileges outCapabilities:(GHashTable**)outCapabilities outAllows:(GHashTable**)outAllows cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_get_current_user_privilege_set_full_sync([self castedGObject], [uri UTF8String], outPrivileges, outCapabilities, outAllows, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)currentUserPrivilegeSetSyncWithUri:(OFString*)uri outPrivileges:(GSList**)outPrivileges cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_get_current_user_privilege_set_sync([self castedGObject], [uri UTF8String], outPrivileges, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)dataSyncWithUri:(OFString*)uri outHref:(gchar**)outHref outEtag:(gchar**)outEtag outHeaders:(SoupMessageHeaders**)outHeaders outBytes:(gchar**)outBytes outLength:(gsize*)outLength cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_get_data_sync([self castedGObject], [uri UTF8String], outHref, outEtag, outHeaders, outBytes, outLength, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OFString*)lastDavErrorCode
{
	const gchar* gobjectValue = e_webdav_session_get_last_dav_error_code([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)lastDavErrorIsPermission
{
	bool returnValue = e_webdav_session_get_last_dav_error_is_permission([self castedGObject]);

	return returnValue;
}

- (bool)principalCollectionSetSyncWithUri:(OFString*)uri outPrincipalHrefs:(GSList**)outPrincipalHrefs cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_get_principal_collection_set_sync([self castedGObject], [uri UTF8String], outPrincipalHrefs, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)supportedPrivilegeSetSyncWithUri:(OFString*)uri outPrivileges:(GNode**)outPrivileges cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_get_supported_privilege_set_sync([self castedGObject], [uri UTF8String], outPrivileges, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)syncWithUri:(OFString*)uri outHref:(gchar**)outHref outEtag:(gchar**)outEtag outHeaders:(SoupMessageHeaders**)outHeaders outStream:(OGOutputStream*)outStream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_get_sync([self castedGObject], [uri UTF8String], outHref, outEtag, outHeaders, [outStream castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)ctagSyncWithUri:(OFString*)uri outCtag:(gchar**)outCtag cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_getctag_sync([self castedGObject], [uri UTF8String], outCtag, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)listSyncWithUri:(OFString*)uri depth:(OFString*)depth flags:(guint32)flags outResources:(GSList**)outResources cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_list_sync([self castedGObject], [uri UTF8String], [depth UTF8String], flags, outResources, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)lockResourceSyncWithUri:(OFString*)uri lockScope:(EWebDAVLockScope)lockScope lockTimeout:(gint32)lockTimeout owner:(OFString*)owner outLockToken:(gchar**)outLockToken cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_lock_resource_sync([self castedGObject], [uri UTF8String], lockScope, lockTimeout, [owner UTF8String], outLockToken, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)lockSyncWithUri:(OFString*)uri depth:(OFString*)depth lockTimeout:(gint32)lockTimeout xml:(const EXmlDocument*)xml outLockToken:(gchar**)outLockToken outXmlResponse:(xmlDoc**)outXmlResponse cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_lock_sync([self castedGObject], [uri UTF8String], [depth UTF8String], lockTimeout, xml, outLockToken, outXmlResponse, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)mkcalendarSyncWithUri:(OFString*)uri displayName:(OFString*)displayName description:(OFString*)description color:(OFString*)color supports:(guint32)supports cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_mkcalendar_sync([self castedGObject], [uri UTF8String], [displayName UTF8String], [description UTF8String], [color UTF8String], supports, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)mkcolAddressbookSyncWithUri:(OFString*)uri displayName:(OFString*)displayName description:(OFString*)description cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_mkcol_addressbook_sync([self castedGObject], [uri UTF8String], [displayName UTF8String], [description UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)mkcolSyncWithUri:(OFString*)uri cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_mkcol_sync([self castedGObject], [uri UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)moveSyncWithSourceUri:(OFString*)sourceUri destinationUri:(OFString*)destinationUri canOverwrite:(bool)canOverwrite cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_move_sync([self castedGObject], [sourceUri UTF8String], [destinationUri UTF8String], canOverwrite, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (SoupMessage*)newMessageWithMethod:(OFString*)method uri:(OFString*)uri
{
	GError* err = NULL;

	SoupMessage* returnValue = e_webdav_session_new_message([self castedGObject], [method UTF8String], [uri UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)optionsSyncWithUri:(OFString*)uri outCapabilities:(GHashTable**)outCapabilities outAllows:(GHashTable**)outAllows cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_options_sync([self castedGObject], [uri UTF8String], outCapabilities, outAllows, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)postSyncWithUri:(OFString*)uri data:(OFString*)data dataLength:(gsize)dataLength inContentType:(OFString*)inContentType inHeaders:(SoupMessageHeaders*)inHeaders outContentType:(gchar**)outContentType outHeaders:(SoupMessageHeaders**)outHeaders outContent:(GByteArray**)outContent cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_post_sync([self castedGObject], [uri UTF8String], [data UTF8String], dataLength, [inContentType UTF8String], inHeaders, outContentType, outHeaders, outContent, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)principalPropertySearchSyncWithUri:(OFString*)uri applyToPrincipalCollectionSet:(bool)applyToPrincipalCollectionSet matchNsUri:(OFString*)matchNsUri matchProperty:(OFString*)matchProperty matchValue:(OFString*)matchValue outPrincipals:(GSList**)outPrincipals cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_principal_property_search_sync([self castedGObject], [uri UTF8String], applyToPrincipalCollectionSet, [matchNsUri UTF8String], [matchProperty UTF8String], [matchValue UTF8String], outPrincipals, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)propfindSyncWithUri:(OFString*)uri depth:(OFString*)depth xml:(const EXmlDocument*)xml func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_propfind_sync([self castedGObject], [uri UTF8String], [depth UTF8String], xml, func, funcUserData, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)proppatchSyncWithUri:(OFString*)uri xml:(const EXmlDocument*)xml cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_proppatch_sync([self castedGObject], [uri UTF8String], xml, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)putDataSyncWithUri:(OFString*)uri etag:(OFString*)etag contentType:(OFString*)contentType inHeaders:(SoupMessageHeaders*)inHeaders bytes:(OFString*)bytes length:(gsize)length outHref:(gchar**)outHref outEtag:(gchar**)outEtag outHeaders:(SoupMessageHeaders**)outHeaders cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_put_data_sync([self castedGObject], [uri UTF8String], [etag UTF8String], [contentType UTF8String], inHeaders, [bytes UTF8String], length, outHref, outEtag, outHeaders, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)putSyncWithUri:(OFString*)uri etag:(OFString*)etag contentType:(OFString*)contentType inHeaders:(SoupMessageHeaders*)inHeaders stream:(OGInputStream*)stream streamLength:(gssize)streamLength outHref:(gchar**)outHref outEtag:(gchar**)outEtag outHeaders:(SoupMessageHeaders**)outHeaders cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_put_sync([self castedGObject], [uri UTF8String], [etag UTF8String], [contentType UTF8String], inHeaders, [stream castedGObject], streamLength, outHref, outEtag, outHeaders, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)refreshLockSyncWithUri:(OFString*)uri lockToken:(OFString*)lockToken lockTimeout:(gint32)lockTimeout cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_refresh_lock_sync([self castedGObject], [uri UTF8String], [lockToken UTF8String], lockTimeout, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)replaceWithDetailedErrorWithMessage:(SoupMessage*)message responseData:(const GByteArray*)responseData ignoreMultistatus:(bool)ignoreMultistatus prefix:(OFString*)prefix
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_replace_with_detailed_error([self castedGObject], message, responseData, ignoreMultistatus, [prefix UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)reportSyncWithUri:(OFString*)uri depth:(OFString*)depth xml:(const EXmlDocument*)xml func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData outContentType:(gchar**)outContentType outContent:(GByteArray**)outContent cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_report_sync([self castedGObject], [uri UTF8String], [depth UTF8String], xml, func, funcUserData, outContentType, outContent, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)setAclSyncWithUri:(OFString*)uri entries:(const GSList*)entries cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_set_acl_sync([self castedGObject], [uri UTF8String], entries, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)traverseMkcalendarResponseWithMessage:(SoupMessage*)message xmlData:(const GByteArray*)xmlData func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_traverse_mkcalendar_response([self castedGObject], message, xmlData, func, funcUserData, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)traverseMkcolResponseWithMessage:(SoupMessage*)message xmlData:(const GByteArray*)xmlData func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_traverse_mkcol_response([self castedGObject], message, xmlData, func, funcUserData, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)traverseMultistatusResponseWithMessage:(SoupMessage*)message xmlData:(const GByteArray*)xmlData func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_traverse_multistatus_response([self castedGObject], message, xmlData, func, funcUserData, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)unlockSyncWithUri:(OFString*)uri lockToken:(OFString*)lockToken cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_unlock_sync([self castedGObject], [uri UTF8String], [lockToken UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)updatePropertiesSyncWithUri:(OFString*)uri changes:(const GSList*)changes cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_webdav_session_update_properties_sync([self castedGObject], [uri UTF8String], changes, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end