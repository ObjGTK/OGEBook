/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESoupSession.h"

@class OGESource;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGEWebDAVSession : OGESoupSession
{

}

/**
 * Functions
 */

/**
 * Frees @privileges returned by e_webdav_session_get_supported_privilege_set_sync().
 * The function does nothing, if @privileges is %NULL.
 *
 * @param privileges a tree of #EWebDAVPrivilege structures
 */
+ (void)utilFreePrivileges:(GNode*)privileges;

/**
 * Compares two hrefs and return whether they reference
 * the same item on the server. The comparison is done in
 * a relaxed way, not considering scheme part and comparing
 * the host name case insensitively, while the path
 * case sensitively. It also ignores the username/password
 * information in the hostname part, if it's included.
 * The function doesn't decode any URI-encoded characters.
 *
 * @param href1 the first href
 * @param href2 the second href
 * @return whether the two href-s reference the same item
 */
+ (bool)utilItemHrefEqualWithHref1:(OFString*)href1 href2:(OFString*)href2;

/**
 * Dequotes @text, if it's enclosed in double-quotes. The function
 * changes @text, it doesn't allocate new string. The function does
 * nothing when the @text is not enclosed in double-quotes.
 *
 * @param text text to dequote
 * @return possibly dequoted @text
 */
+ (OFString*)utilMaybeDequote:(OFString*)text;

/**
 * Constructors
 */
- (instancetype)init:(OGESource*)source;

/**
 * Methods
 */

- (EWebDAVSession*)WEBDAVSESSION;

/**
 * Issues ACL request on the provided @uri, or, in case it's %NULL, on the URI
 * defined in associated #ESource.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param xml the request itself, as an #EXmlDocument, the root element should be DAV:acl
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)aclSyncWithUri:(OFString*)uri xml:(const EXmlDocument*)xml cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Copies a resource identified by @source_uri to @destination_uri on the server.
 * The @source_uri can reference also collections, in which case the @depth influences
 * whether only the collection itself is copied (%E_WEBDAV_DEPTH_THIS) or whether
 * the collection with all its children is copied (%E_WEBDAV_DEPTH_INFINITY).
 *
 * @param sourceUri URI of the resource or collection to copy
 * @param destinationUri URI of the destination
 * @param depth requested depth, can be one of %E_WEBDAV_DEPTH_THIS or %E_WEBDAV_DEPTH_INFINITY
 * @param canOverwrite whether can overwrite @destination_uri, when it exists
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)copySyncWithSourceUri:(OFString*)sourceUri destinationUri:(OFString*)destinationUri depth:(OFString*)depth canOverwrite:(bool)canOverwrite cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Deletes a resource identified by @uri on the server. The URI can
 * reference a collection, in which case @depth should be %E_WEBDAV_DEPTH_INFINITY.
 * Use @depth %E_WEBDAV_DEPTH_THIS when deleting a regular resource, or %NULL,
 * to let the server use default Depth.
 * 
 * The @etag argument is used to avoid clashes when overwriting existing resources.
 * Use %NULL @etag when deleting collection resources or to force the deletion,
 * otherwise provide a valid ETag of a non-collection resource to verify that
 * the version requested to delete is the same as on the server.
 * 
 * Note that the actual usage of @etag is also influenced by #ESourceWebdav:avoid-ifmatch
 * property of the associated #ESource.
 *
 * @param uri URI of the resource to delete
 * @param depth optional requested depth, can be one of %E_WEBDAV_DEPTH_THIS or %E_WEBDAV_DEPTH_INFINITY, or %NULL
 * @param etag an optional ETag of the resource, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)deleteSyncWithUri:(OFString*)uri depth:(OFString*)depth etag:(OFString*)etag cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Converts possibly path-only @href into a full URI under the @request_uri.
 * When the @request_uri is %NULL, the URI defined in associated #ESource is
 * used instead, taken from the #ESourceWebdav extension, if defined.
 * 
 * Free the returned pointer with g_free(), when no longer needed.
 *
 * @param requestUri a #SoupURI to which the @href belongs, or %NULL
 * @param href a possibly path-only href
 * @return The @href as a full URI
 */
- (OFString*)ensureFullUriWithRequestUri:(const SoupURI*)requestUri href:(OFString*)href;

/**
 * Gets Access Control List (ACL) restrictions for the @uri, or, in case it's %NULL,
 * for the URI defined in associated #ESource. The @out_principal_kind is valid only
 * if the @out_restrictions contains #E_WEBDAV_ACL_RESTRICTION_REQUIRED_PRINCIPAL.
 * The @out_principal_hrefs is valid only if the @out_principal_kind is valid and when
 * it is #E_WEBDAV_ACE_PRINCIPAL_HREF.
 * 
 * Free the returned @out_principal_hrefs with
 * g_slist_free_full (entries, g_free);
 * when no longer needed.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param outRestrictions return location for bit-or of #EWebDAVACLRestrictions
 * @param outPrincipalKind return location for principal kind
 * @param outPrincipalHrefs return location for a #GSList of principal href-s
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)aclRestrictionsSyncWithUri:(OFString*)uri outRestrictions:(guint32*)outRestrictions outPrincipalKind:(EWebDAVACEPrincipalKind*)outPrincipalKind outPrincipalHrefs:(GSList**)outPrincipalHrefs cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Gets Access Control List (ACL) for the @uri, or, in case it's %NULL, for the URI
 * defined in associated #ESource.
 * 
 * This function doesn't read general #E_WEBDAV_ACE_PRINCIPAL_PROPERTY.
 * 
 * Free the returned @out_entries with
 * g_slist_free_full (entries, e_webdav_access_control_entry_free);
 * when no longer needed.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param outEntries return location for a #GSList of #EWebDAVAccessControlEntry
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)aclSyncWithUri:(OFString*)uri outEntries:(GSList**)outEntries cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Gets current user privileges for the @uri, or, in case it's %NULL, for the URI
 * defined in associated #ESource.
 * 
 * Free the returned @out_privileges with
 * g_slist_free_full (privileges, e_webdav_privilege_free);
 * when no longer needed.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param outPrivileges return location for a %GSList of #EWebDAVPrivilege
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)currentUserPrivilegeSetSyncWithUri:(OFString*)uri outPrivileges:(GSList**)outPrivileges cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Reads a resource identified by @uri from the server. The URI cannot
 * reference a collection.
 * 
 * The @out_bytes is filled by actual data being read. If not %NULL, @out_length
 * is populated with how many bytes had been read. The @out_bytes is always
 * NUL-terminated, while this termination byte is not part of @out_length.
 * Free the @out_bytes with g_free(), when no longer needed.
 * 
 * Free returned pointer of @out_href and @out_etag, if not %NULL, with g_free(),
 * when no longer needed.
 * 
 * To read large data use e_webdav_session_get_sync() instead.
 *
 * @param uri URI of the resource to read
 * @param outHref optional return location for href of the resource, or %NULL
 * @param outEtag optional return location for etag of the resource, or %NULL
 * @param outBytes return location for bytes being read
 * @param outLength option return location for length of bytes being read, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)dataSyncWithUri:(OFString*)uri outHref:(gchar**)outHref outEtag:(gchar**)outEtag outBytes:(gchar**)outBytes outLength:(gsize*)outLength cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Returns last DAV error code as returned by the server. Each recognized code
 * is enclosed in "[]" in the returned string, to be able to distinguish between
 * them, in case the server returned multiple codes.
 * 
 * The string is valid until the next request is executed.
 *
 * @return a DAV error from the last request, or %NULL, when
 *    no error had been recognized.
 */
- (OFString*)lastDavErrorCode;

/**
 *
 * @return whether the last recognized DAV error code contains an error
 *    which means that user doesn't have permission for the operation. If there
 *    is no DAV error stored, then returns %FALSE.
 */
- (bool)lastDavErrorIsPermission;

/**
 * Gets list of principal collection href for the @uri, or, in case it's %NULL,
 * for the URI defined in associated #ESource. The @out_principal_hrefs are root
 * collections that contain the principals that are available on the server that
 * implements this resource.
 * 
 * Free the returned @out_principal_hrefs with
 * g_slist_free_full (entries, g_free);
 * when no longer needed.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param outPrincipalHrefs return location for a #GSList of principal href-s
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)principalCollectionSetSyncWithUri:(OFString*)uri outPrincipalHrefs:(GSList**)outPrincipalHrefs cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Gets supported privileges for the @uri, or, in case it's %NULL, for the URI
 * defined in associated #ESource.
 * 
 * The root node of @out_privileges has always %NULL data.
 * 
 * Free the returned @out_privileges with e_webdav_session_util_free_privileges()
 * when no longer needed.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param outPrivileges return location for the tree of supported privileges
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)supportedPrivilegeSetSyncWithUri:(OFString*)uri outPrivileges:(GNode**)outPrivileges cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Reads a resource identified by @uri from the server and writes it
 * to the @stream. The URI cannot reference a collection.
 * 
 * Free returned pointer of @out_href and @out_etag, if not %NULL, with g_free(),
 * when no longer needed.
 * 
 * The e_webdav_session_get_data_sync() can be used to read the resource data
 * directly to memory.
 *
 * @param uri URI of the resource to read
 * @param outHref optional return location for href of the resource, or %NULL
 * @param outEtag optional return location for etag of the resource, or %NULL
 * @param outStream a #GOutputStream to write data to
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)syncWithUri:(OFString*)uri outHref:(gchar**)outHref outEtag:(gchar**)outEtag outStream:(GOutputStream*)outStream cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Issues a getctag property request for a collection identified by @uri, or,
 * in case it's %NULL, on the URI defined in associated #ESource. The ctag is
 * a collection tag, which changes whenever the collection changes (similar
 * to etag). The getctag is an extension, thus the function can fail when
 * the server doesn't support it.
 * 
 * Free the returned @out_ctag with g_free(), when no longer needed.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param outCtag return location for the ctag
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)ctagSyncWithUri:(OFString*)uri outCtag:(gchar**)outCtag cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Lists content of the @uri, or, in case it's %NULL, of the URI defined
 * in associated #ESource, which should point to a collection. The @flags
 * influences which properties are read for the resources.
 * 
 * The @out_resources is in no particular order.
 * 
 * Free the returned @out_resources with
 * g_slist_free_full (resources, e_webdav_resource_free);
 * when no longer needed.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param depth requested depth, can be one of %E_WEBDAV_DEPTH_THIS, %E_WEBDAV_DEPTH_THIS_AND_CHILDREN or %E_WEBDAV_DEPTH_INFINITY
 * @param flags a bit-or of #EWebDAVListFlags, claiming what properties to read
 * @param outResources return location for the resources
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)listSyncWithUri:(OFString*)uri depth:(OFString*)depth flags:(guint32)flags outResources:(GSList**)outResources cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Locks a resource identified by @uri, or, in case it's %NULL, by the URI defined
 * in associated #ESource. It obtains a write lock with the given @lock_scope.
 * 
 * The @owner is used to identify the lock owner. When it's an http:// or https://,
 * then it's referenced as DAV:href, otherwise the value is treated as plain text.
 * If it's %NULL, then the user name from the associated #ESource is used.
 * 
 * The @out_lock_token can be refreshed with e_webdav_session_refresh_lock_sync().
 * Release the lock with e_webdav_session_unlock_sync().
 * Free the returned @out_lock_token with g_free(), when no longer needed.
 *
 * @param uri URI to lock, or %NULL to read from #ESource
 * @param lockScope an #EWebDAVLockScope to define the scope of the lock
 * @param lockTimeout timeout for the lock, in seconds, on 0 to infinity
 * @param owner optional identificator of the owner of the lock, or %NULL
 * @param outLockToken return location of the obtained or refreshed lock token
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)lockResourceSyncWithUri:(OFString*)uri lockScope:(EWebDAVLockScope)lockScope lockTimeout:(gint32)lockTimeout owner:(OFString*)owner outLockToken:(gchar**)outLockToken cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Locks a resource identified by @uri, or, in case it's %NULL, on the URI
 * defined in associated #ESource.
 * 
 * The @out_lock_token can be refreshed with e_webdav_session_refresh_lock_sync().
 * Release the lock with e_webdav_session_unlock_sync().
 * Free the returned @out_lock_token with g_free(), when no longer needed.
 * 
 * If provided, free the returned @out_xml_response with xmlFreeDoc(),
 * when no longer needed.
 *
 * @param uri URI to lock, or %NULL to read from #ESource
 * @param depth requested depth, can be one of %E_WEBDAV_DEPTH_THIS or %E_WEBDAV_DEPTH_INFINITY
 * @param lockTimeout timeout for the lock, in seconds, on 0 to infinity
 * @param xml an XML describing the lock request, with DAV:lockinfo root element
 * @param outLockToken return location of the obtained or refreshed lock token
 * @param outXmlResponse optional return location for the server response as #xmlDocPtr
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)lockSyncWithUri:(OFString*)uri depth:(OFString*)depth lockTimeout:(gint32)lockTimeout xml:(const EXmlDocument*)xml outLockToken:(gchar**)outLockToken outXmlResponse:(xmlDoc**)outXmlResponse cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Creates a new calendar collection identified by @uri on the server.
 * The @supports defines what component types can be stored into
 * the created calendar collection. Only %E_WEBDAV_RESOURCE_SUPPORTS_NONE
 * and values related to iCalendar content can be used here.
 * Using %E_WEBDAV_RESOURCE_SUPPORTS_NONE means that everything is supported.
 * 
 * Note that CalDAV RFC 4791 Section 4.2 forbids to create calendar
 * resources under other calendar resources (no nested calendars
 * are allowed).
 *
 * @param uri URI of the collection to create
 * @param displayName a human-readable display name to set, or %NULL
 * @param description a human-readable description of the calendar, or %NULL
 * @param color a color to set, in format "&num;RRGGBB", or %NULL
 * @param supports a bit-or of EWebDAVResourceSupports values
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)mkcalendarSyncWithUri:(OFString*)uri displayName:(OFString*)displayName description:(OFString*)description color:(OFString*)color supports:(guint32)supports cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Creates a new address book collection identified by @uri on the server.
 * 
 * Note that CardDAV RFC 6352 Section 5.2 forbids to create address book
 * resources under other address book resources (no nested address books
 * are allowed).
 *
 * @param uri URI of the collection to create
 * @param displayName a human-readable display name to set, or %NULL
 * @param description a human-readable description of the address book, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)mkcolAddressbookSyncWithUri:(OFString*)uri displayName:(OFString*)displayName description:(OFString*)description cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Creates a new generic collection identified by @uri on the server.
 * To create specific collections use e_webdav_session_mkcalendar_sync()
 * or e_webdav_session_mkcol_addressbook_sync().
 *
 * @param uri URI of the collection to create
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)mkcolSyncWithUri:(OFString*)uri cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Moves a resource identified by @source_uri to @destination_uri on the server.
 * The @source_uri can reference also collections.
 *
 * @param sourceUri URI of the resource or collection to copy
 * @param destinationUri URI of the destination
 * @param canOverwrite whether can overwrite @destination_uri, when it exists
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)moveSyncWithSourceUri:(OFString*)sourceUri destinationUri:(OFString*)destinationUri canOverwrite:(bool)canOverwrite cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 *
 * @param method an HTTP method
 * @param uri URI to create the request for, or %NULL to read from #ESource
 * @param err
 * @return A new #SoupRequestHTTP for the given @uri, or, when %NULL,
 *    for the URI stored in the associated #ESource. Free the returned structure
 *    with g_object_unref(), when no longer needed.
 */
- (SoupRequestHTTP*)newRequestWithMethod:(OFString*)method uri:(OFString*)uri err:(GError**)err;

/**
 * Issues OPTIONS request on the provided @uri, or, in case it's %NULL, on the URI
 * defined in associated #ESource.
 * 
 * The @out_capabilities contains a set of returned capabilities. Some known are
 * defined as E_WEBDAV_CAPABILITY_CLASS_1, and so on. The 'value' of the #GHashTable
 * doesn't have any particular meaning and the strings are compared case insensitively.
 * Free the hash table with g_hash_table_destroy(), when no longer needed. The returned
 * value can be %NULL on success, it's when the server doesn't provide the information.
 * 
 * The @out_allows contains a set of allowed methods returned by the server. Some known
 * are defined as %SOUP_METHOD_OPTIONS, and so on. The 'value' of the #GHashTable
 * doesn't have any particular meaning and the strings are compared case insensitively.
 * Free the hash table with g_hash_table_destroy(), when no longer needed. The returned
 * value can be %NULL on success, it's when the server doesn't provide the information.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param outCapabilities return location for DAV capabilities
 * @param outAllows return location for allowed operations
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)optionsSyncWithUri:(OFString*)uri outCapabilities:(GHashTable**)outCapabilities outAllows:(GHashTable**)outAllows cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Issues POST request on the provided @uri, or, in case it's %NULL, on the URI
 * defined in associated #ESource. The Content-Type of the @data is set to
 * application/xml. To POST the @data with a different Content-Type use
 * e_webdav_session_post_with_content_type_sync().
 * 
 * The optional @out_content_type can be used to get content type of the response.
 * Free it with g_free(), when no longer needed.
 * 
 * The optional @out_content can be used to get actual result content. Free it
 * with g_byte_array_free(), when no longer needed.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param data data to post to the server
 * @param dataLength length of @data, or -1, when @data is NUL-terminated
 * @param outContentType return location for response Content-Type, or %NULL
 * @param outContent return location for response content, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)postSyncWithUri:(OFString*)uri data:(OFString*)data dataLength:(gsize)dataLength outContentType:(gchar**)outContentType outContent:(GByteArray**)outContent cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Issues POST request on the provided @uri, or, in case it's %NULL, on the URI
 * defined in associated #ESource.
 * 
 * The optional @out_content_type can be used to get content type of the response.
 * Free it with g_free(), when no longer needed.
 * 
 * The optional @out_content can be used to get actual result content. Free it
 * with g_byte_array_free(), when no longer needed.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param data data to post to the server
 * @param dataLength length of @data, or -1, when @data is NUL-terminated
 * @param inContentType a Content-Type of the @data, or %NULL, to use application/xml
 * @param outContentType return location for response Content-Type, or %NULL
 * @param outContent return location for response content, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)postWithContentTypeSyncWithUri:(OFString*)uri data:(OFString*)data dataLength:(gsize)dataLength inContentType:(OFString*)inContentType outContentType:(gchar**)outContentType outContent:(GByteArray**)outContent cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Issues a DAV:principal-property-search for the @uri, or, in case it's %NULL,
 * for the URI defined in associated #ESource. The DAV:principal-property-search
 * performs a search for all principals whose properties contain character data
 * that matches the search criteria @match_value in @match_property property
 * of namespace @match_ns_uri.
 * 
 * By default, the function searches all members (at any depth) of the collection
 * identified by the @uri. If @apply_to_principal_collection_set is set to %TRUE,
 * the search is applied instead to each collection returned by
 * e_webdav_session_get_principal_collection_set_sync() for the @uri.
 * 
 * The @out_principals is a #GSList of #EWebDAVResource, where the kind
 * is set to %E_WEBDAV_RESOURCE_KIND_PRINCIPAL and only href with displayname
 * are filled. All other members of #EWebDAVResource are not set.
 * 
 * Free the returned @out_principals with
 * g_slist_free_full (principals, e_webdav_resource_free);
 * when no longer needed.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param applyToPrincipalCollectionSet whether to apply to principal-collection-set
 * @param matchNsUri namespace URI of the property to search in, or %NULL for %E_WEBDAV_NS_DAV
 * @param matchProperty name of the property to search in
 * @param matchValue a string value to search for
 * @param outPrincipals return location for matching principals
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded. Note it can report success also when no matching
 *    principal had been found.
 */
- (bool)principalPropertySearchSyncWithUri:(OFString*)uri applyToPrincipalCollectionSet:(bool)applyToPrincipalCollectionSet matchNsUri:(OFString*)matchNsUri matchProperty:(OFString*)matchProperty matchValue:(OFString*)matchValue outPrincipals:(GSList**)outPrincipals cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Issues PROPFIND request on the provided @uri, or, in case it's %NULL, on the URI
 * defined in associated #ESource. On success, calls @func for each returned
 * DAV:propstat.
 * 
 * The @xml can be %NULL, in which case the server should behave like DAV:allprop request.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param depth requested depth, can be one of %E_WEBDAV_DEPTH_THIS, %E_WEBDAV_DEPTH_THIS_AND_CHILDREN or %E_WEBDAV_DEPTH_INFINITY
 * @param xml the request itself, as an #EXmlDocument, the root element should be DAV:propfind, or %NULL
 * @param func an #EWebDAVPropstatTraverseFunc function to call for each DAV:propstat in the multistatus response
 * @param funcUserData user data passed to @func
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)propfindSyncWithUri:(OFString*)uri depth:(OFString*)depth xml:(const EXmlDocument*)xml func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Issues PROPPATCH request on the provided @uri, or, in case it's %NULL, on the URI
 * defined in associated #ESource, with the @changes. The order of requested changes
 * inside @xml is significant, unlike on other places.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param xml an #EXmlDocument with request changes, its root element should be DAV:propertyupdate
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)proppatchSyncWithUri:(OFString*)uri xml:(const EXmlDocument*)xml cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Writes data to a resource identified by @uri to the server. The URI cannot
 * reference a collection.
 * 
 * The @etag argument is used to avoid clashes when overwriting existing
 * resources. It can contain three values:
 *  - %NULL - to write completely new resource
 *  - empty string - write new resource or overwrite any existing, regardless changes on the server
 *  - valid ETag - overwrite existing resource only if it wasn't changed on the server.
 * 
 * Note that the actual usage of @etag is also influenced by #ESourceWebdav:avoid-ifmatch
 * property of the associated #ESource.
 * 
 * The @out_href, if provided, is filled with the resulting URI
 * of the written resource. It can be different from the @uri when the server
 * redirected to a different location.
 * 
 * The @out_etag contains ETag of the resource after it had been saved.
 * 
 * To write large data use e_webdav_session_put_sync() instead.
 *
 * @param uri URI of the resource to write
 * @param etag an ETag of the resource, if it's an existing resource, or %NULL
 * @param contentType Content-Type of the @bytes to be written
 * @param bytes actual bytes to be written
 * @param length how many bytes to write, or -1, when the @bytes is NUL-terminated
 * @param outHref optional return location for href of the resource, or %NULL
 * @param outEtag optional return location for etag of the resource, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)putDataSyncWithUri:(OFString*)uri etag:(OFString*)etag contentType:(OFString*)contentType bytes:(OFString*)bytes length:(gsize)length outHref:(gchar**)outHref outEtag:(gchar**)outEtag cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Writes data from @stream to a resource identified by @uri to the server.
 * The URI cannot reference a collection.
 * 
 * The @etag argument is used to avoid clashes when overwriting existing
 * resources. It can contain three values:
 *  - %NULL - to write completely new resource
 *  - empty string - write new resource or overwrite any existing, regardless changes on the server
 *  - valid ETag - overwrite existing resource only if it wasn't changed on the server.
 * 
 * Note that the actual behaviour is also influenced by #ESourceWebdav:avoid-ifmatch
 * property of the associated #ESource.
 * 
 * The @out_href, if provided, is filled with the resulting URI
 * of the written resource. It can be different from the @uri when the server
 * redirected to a different location.
 * 
 * The @out_etag contains ETag of the resource after it had been saved.
 * 
 * The @stream should support also #GSeekable interface, because the data
 * send can require restart of the send due to redirect or other reasons.
 * 
 * This method uses Transfer-Encoding:chunked, in contrast to the
 * e_webdav_session_put_data_sync(), which writes data stored in memory
 * like any other request.
 *
 * @param uri URI of the resource to write
 * @param etag an ETag of the resource, if it's an existing resource, or %NULL
 * @param contentType Content-Type of the @bytes to be written
 * @param stream a #GInputStream with data to be written
 * @param outHref optional return location for href of the resource, or %NULL
 * @param outEtag optional return location for etag of the resource, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)putSyncWithUri:(OFString*)uri etag:(OFString*)etag contentType:(OFString*)contentType stream:(GInputStream*)stream outHref:(gchar**)outHref outEtag:(gchar**)outEtag cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Refreshes existing lock @lock_token for a resource identified by @uri,
 * or, in case it's %NULL, on the URI defined in associated #ESource.
 * The @lock_token is returned from e_webdav_session_lock_sync() and
 * the @uri should be the same as that used with e_webdav_session_lock_sync().
 *
 * @param uri URI to lock, or %NULL to read from #ESource
 * @param lockToken token of an existing lock
 * @param lockTimeout timeout for the lock, in seconds, on 0 to infinity
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)refreshLockSyncWithUri:(OFString*)uri lockToken:(OFString*)lockToken lockTimeout:(gint32)lockTimeout cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Tries to read detailed error information from @response_data,
 * if not provided, then from @request's response_body. If the detailed
 * error cannot be found, then does nothing, otherwise frees the content
 * of @inout_error, if any, and then populates it with an error message
 * prefixed with @prefix.
 * 
 * The @prefix might be of form "Failed to something", because the resulting
 * error message will be:
 * "Failed to something: HTTP error code XXX (reason_phrase): detailed_error".
 * When @prefix is %NULL, the error message will be:
 * "Failed with HTTP error code XXX (reason phrase): detailed_error".
 * 
 * As the caller might not be interested in errors, also the @inout_error
 * can be %NULL, in which case the function does nothing.
 *
 * @param request a #SoupRequestHTTP
 * @param responseData received response data, or %NULL
 * @param ignoreMultistatus whether to ignore multistatus responses
 * @param prefix error message prefix, used when replacing, or %NULL
 * @param err
 * @return Whether any detailed error had been recognized.
 */
- (bool)replaceWithDetailedErrorWithRequest:(SoupRequestHTTP*)request responseData:(const GByteArray*)responseData ignoreMultistatus:(bool)ignoreMultistatus prefix:(OFString*)prefix err:(GError**)err;

/**
 * Issues REPORT request on the provided @uri, or, in case it's %NULL, on the URI
 * defined in associated #ESource. On success, calls @func for each returned
 * DAV:propstat.
 * 
 * The report can result in a multistatus response, but also to raw data. In case
 * the @func is provided and the result is a multistatus response, then it is traversed
 * using this @func.
 * 
 * The optional @out_content_type can be used to get content type of the response.
 * Free it with g_free(), when no longer needed.
 * 
 * The optional @out_content can be used to get actual result content. Free it
 * with g_byte_array_free(), when no longer needed.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param depth requested depth, can be %NULL, then no Depth header is sent
 * @param xml the request itself, as an #EXmlDocument
 * @param func an #EWebDAVPropstatTraverseFunc function to call for each DAV:propstat in the multistatus response, or %NULL
 * @param funcUserData user data passed to @func
 * @param outContentType return location for response Content-Type, or %NULL
 * @param outContent return location for response content, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)reportSyncWithUri:(OFString*)uri depth:(OFString*)depth xml:(const EXmlDocument*)xml func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData outContentType:(gchar**)outContentType outContent:(GByteArray**)outContent cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Changes Access Control List (ACL) for the @uri, or, in case it's %NULL,
 * for the URI defined in associated #ESource.
 * 
 * Make sure that the @entries satisfy ACL restrictions, as returned
 * by e_webdav_session_get_acl_restrictions_sync(). The order in the @entries
 * is preserved. It cannot contain any %E_WEBDAV_ACE_FLAG_PROTECTED,
 * nor @E_WEBDAV_ACE_FLAG_INHERITED, items.
 * 
 * Use e_webdav_session_get_acl_sync() to read currently known ACL entries,
 * remove from the list those protected and inherited, and then modify
 * the rest with the required changed.
 * 
 * Note this function doesn't support general %E_WEBDAV_ACE_PRINCIPAL_PROPERTY and
 * returns %G_IO_ERROR_NOT_SUPPORTED error when any such is tried to be written.
 * 
 * In case the returned entries contain any %E_WEBDAV_ACE_PRINCIPAL_PROPERTY,
 * or there's a need to write such Access Control Entry, then do not use
 * e_webdav_session_get_acl_sync(), neither e_webdav_session_set_acl_sync(),
 * and write more generic implementation.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param entries entries to write
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)setAclSyncWithUri:(OFString*)uri entries:(const GSList*)entries cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Traverses a CALDAV:mkcalendar-response response and calls @func for each returned DAV:propstat.
 * 
 * The @message, if provided, is used to verify that the response is an XML Content-Type.
 * It's used to get the request URI as well.
 *
 * @param message an optional #SoupMessage corresponding to the response, or %NULL
 * @param xmlData a #GByteArray containing CALDAV:mkcalendar-response response
 * @param func an #EWebDAVPropstatTraverseFunc function to call for each DAV:propstat in the response
 * @param funcUserData user data passed to @func
 * @param err
 * @return Whether succeeded.
 */
- (bool)traverseMkcalendarResponseWithMessage:(const SoupMessage*)message xmlData:(const GByteArray*)xmlData func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData err:(GError**)err;

/**
 * Traverses a DAV:mkcol-response response and calls @func for each returned DAV:propstat.
 * 
 * The @message, if provided, is used to verify that the response is an XML Content-Type.
 * It's used to get the request URI as well.
 *
 * @param message an optional #SoupMessage corresponding to the response, or %NULL
 * @param xmlData a #GByteArray containing DAV:mkcol-response response
 * @param func an #EWebDAVPropstatTraverseFunc function to call for each DAV:propstat in the response
 * @param funcUserData user data passed to @func
 * @param err
 * @return Whether succeeded.
 */
- (bool)traverseMkcolResponseWithMessage:(const SoupMessage*)message xmlData:(const GByteArray*)xmlData func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData err:(GError**)err;

/**
 * Traverses a DAV:multistatus response and calls @func for each returned DAV:propstat.
 * 
 * The @message, if provided, is used to verify that the response is a multi-status
 * and that the Content-Type is properly set. It's used to get a request URI as well.
 *
 * @param message an optional #SoupMessage corresponding to the response, or %NULL
 * @param xmlData a #GByteArray containing DAV:multistatus response
 * @param func an #EWebDAVPropstatTraverseFunc function to call for each DAV:propstat in the multistatus response
 * @param funcUserData user data passed to @func
 * @param err
 * @return Whether succeeded.
 */
- (bool)traverseMultistatusResponseWithMessage:(const SoupMessage*)message xmlData:(const GByteArray*)xmlData func:(EWebDAVPropstatTraverseFunc)func funcUserData:(gpointer)funcUserData err:(GError**)err;

/**
 * Releases (unlocks) existing lock @lock_token for a resource identified by @uri,
 * or, in case it's %NULL, on the URI defined in associated #ESource.
 * The @lock_token is returned from e_webdav_session_lock_sync() and
 * the @uri should be the same as that used with e_webdav_session_lock_sync().
 *
 * @param uri URI to lock, or %NULL to read from #ESource
 * @param lockToken token of an existing lock
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)unlockSyncWithUri:(OFString*)uri lockToken:(OFString*)lockToken cancellable:(GCancellable*)cancellable err:(GError**)err;

/**
 * Updates properties (set/remove) on the provided @uri, or, in case it's %NULL,
 * on the URI defined in associated #ESource, with the @changes. The order
 * of @changes is significant, unlike on other places.
 * 
 * This function supports only flat properties, those not under other element.
 * To support more complex property tries use e_webdav_session_proppatch_sync()
 * directly.
 *
 * @param uri URI to issue the request for, or %NULL to read from #ESource
 * @param changes a #GSList with request changes
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return Whether succeeded.
 */
- (bool)updatePropertiesSyncWithUri:(OFString*)uri changes:(const GSList*)changes cancellable:(GCancellable*)cancellable err:(GError**)err;

@end