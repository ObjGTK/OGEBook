/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

@class OGTlsCertificate;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceWebdav : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceWebdav*)castedGObject;

/**
 * Thread-safe variation of e_source_webdav_get_color().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceWebdav:color
 */
- (OFString*)dupColor;

/**
 * Thread-safe variation of e_source_webdav_get_display_name().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceWebdav:display-name
 */
- (OFString*)dupDisplayName;

/**
 * Thread-safe variation of e_source_webdav_get_email_address().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return the newly-allocated copy of #ESourceWebdav:email-address
 */
- (OFString*)dupEmailAddress;

/**
 * Thread-safe variation of e_source_webdav_get_resource_path().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return the newly-allocated copy of #ESourceWebdav:resource-path
 */
- (OFString*)dupResourcePath;

/**
 * Thread-safe variation of e_source_webdav_get_resource_query().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return the newly-allocated copy of #ESourceWebdav:resource-query
 */
- (OFString*)dupResourceQuery;

/**
 * Thread-safe variation of e_source_webdav_get_ssl_trust().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return the newly-allocated copy of #ESourceWebdav:ssl-trust
 */
- (OFString*)dupSslTrust;

/**
 * This is a convenience function which returns a newly-allocated
 * #GUri, its contents assembled from the #ESourceAuthentication
 * extension, the #ESourceSecurity extension, and @extension itself.
 * Free the returned #GUri with g_uri_unref().
 *
 * @return a newly-allocated #GUri
 */
- (GUri*)dupUri;

/**
 * This setting works around a
 * <ulink url="https://issues.apache.org/bugzilla/show_bug.cgi?id=38034">
 * bug</ulink> in older Apache mod_dav versions.
 * 
 * <note>
 *   <para>
 *     We may deprecate this once Apache 2.2.8 or newer becomes
 *     sufficiently ubiquitous, or we figure out a way to detect
 *     and work around the bug automatically.
 *   </para>
 * </note>
 *
 * @return whether the WebDAV server is known to exhibit the bug
 */
- (bool)avoidIfmatch;

/**
 * FIXME Document me!
 *
 * @return
 */
- (bool)calendarAutoSchedule;

/**
 * Returns the last known color of a WebDAV resource as provided by the server.
 *
 * @return the color of the WebDAV resource, if any set on the server
 */
- (OFString*)color;

/**
 * Returns the last known display name of a WebDAV resource, which may
 * differ from the #ESource:display-name property of the #ESource to which
 * @extension belongs.
 *
 * @return the display name of the WebDAV resource
 */
- (OFString*)displayName;

/**
 * Returns the user's email address which can be passed to a CalDAV server
 * if the user wishes to receive scheduling messages.
 *
 * @return the user's email address
 */
- (OFString*)emailAddress;

/**
 *
 * @return the sorting order of the resource, if known. The default
 *    is (guint) -1, which means unknown/unset.
 */
- (guint)order;

/**
 * Returns the absolute path to a resource on a WebDAV server.
 *
 * @return the absolute path to a WebDAV resource
 */
- (OFString*)resourcePath;

/**
 * Returns the URI query required to access a resource on a WebDAV server.
 * 
 * This is typically used when the #ESourceWebdav:resource-path points not
 * to the resource itself but to a web program that generates the resource
 * content on-the-fly.  The #ESourceWebdav:resource-query holds the input
 * values for the program.
 *
 * @return the query to access a WebDAV resource
 */
- (OFString*)resourceQuery;

/**
 * Returns an SSL/TLS certificate trust for the @extension.
 * The value encodes three parameters, divided by a pipe '|',
 * the first is users preference, can be one of "reject", "accept",
 * "temporary-reject" and "temporary-accept". The second is a host
 * name for which the trust was set. Finally the last is a SHA256
 * hash of the certificate. This is not meant to be changed by a caller,
 * it is supposed to be manipulated with e_source_webdav_update_ssl_trust()
 * and e_source_webdav_verify_ssl_trust().
 *
 * @return an SSL/TLS certificate trust for the @extension
 */
- (OFString*)sslTrust;

/**
 *
 * @return the last SSL trust response, as #ETrustPromptResponse, if none
 *    is set, then returns %E_TRUST_PROMPT_RESPONSE_UNKNOWN
 */
- (ETrustPromptResponse)sslTrustResponse;

/**
 * This setting works around a
 * <ulink url="https://issues.apache.org/bugzilla/show_bug.cgi?id=38034">
 * bug</ulink> in older Apache mod_dav versions.
 * 
 * <note>
 *   <para>
 *     We may deprecate this once Apache 2.2.8 or newer becomes
 *     sufficiently ubiquitous, or we figure out a way to detect
 *     and work around the bug automatically.
 *   </para>
 * </note>
 *
 * @param avoidIfmatch whether the WebDAV server is known to exhibit the bug
 */
- (void)setAvoidIfmatch:(bool)avoidIfmatch;

/**
 * FIXME Document me!
 *
 * @param calendarAutoSchedule whether the server supports the
 * "calendar-auto-schedule" feature of CalDAV
 */
- (void)setCalendarAutoSchedule:(bool)calendarAutoSchedule;

/**
 * Updates the last known color of a WebDAV resource, as provided by the server.
 * 
 * The internal copy of @color is automatically stripped of leading
 * and trailing whitespace. If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param color the color of the WebDAV resource, or %NULL
 */
- (void)setColor:(OFString*)color;

/**
 * Updates the last known display name of a WebDAV resource, which may
 * differ from the #ESource:display-name property of the #ESource to which
 * @extension belongs.
 * 
 * The internal copy of @display_name is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param displayName the display name of the WebDAV resource,
 *                or %NULL
 */
- (void)setDisplayName:(OFString*)displayName;

/**
 * Sets the user's email address which can be passed to a CalDAV server if
 * the user wishes to receive scheduling messages.
 * 
 * The internal copy of @email_address is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param emailAddress the user's email address, or %NULL
 */
- (void)setEmailAddress:(OFString*)emailAddress;

/**
 * Set the sorting order of the resource.
 *
 * @param order a sorting order
 */
- (void)setOrder:(guint)order;

/**
 * Sets the absolute path to a resource on a WebDAV server.
 * 
 * The internal copy of @resource_path is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param resourcePath the absolute path to a WebDAV resource,
 *                 or %NULL
 */
- (void)setResourcePath:(OFString*)resourcePath;

/**
 * Sets the URI query required to access a resource on a WebDAV server.
 * 
 * This is typically used when the #ESourceWebdav:resource-path points not
 * to the resource itself but to a web program that generates the resource
 * content on-the-fly.  The #ESourceWebdav:resource-query holds the input
 * values for the program.
 * 
 * The internal copy of @resource_query is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param resourceQuery the query to access a WebDAV resource,
 *                  or %NULL
 */
- (void)setResourceQuery:(OFString*)resourceQuery;

/**
 * Sets the SSL/TLS certificate trust. See e_source_webdav_get_ssl_trust()
 * for more infomation about its content and how to use it.
 *
 * @param sslTrust the ssl_trust to store, or %NULL to unset
 */
- (void)setSslTrust:(OFString*)sslTrust;

/**
 * Set the SSL trust response, as #ETrustPromptResponse, while keeping
 * the certificate and host information as before. The function does
 * nothing, when none SSL trust is set or when %E_TRUST_PROMPT_RESPONSE_UNKNOWN
 * is used as the @response.
 *
 * @param response an #ETrustPromptResponse to set
 */
- (void)setSslTrustResponse:(ETrustPromptResponse)response;

/**
 * This is a convenience function which propagates the components of
 * @uri to the #ESourceAuthentication extension, the #ESourceSecurity
 * extension, and @extension itself.  (The "fragment" component of
 * @uri is ignored.)
 *
 * @param uri a #GUri
 */
- (void)setUri:(GUri*)uri;

/**
 * Unsets temporary trust set on this @extension, but keeps
 * it as is for other values.
 *
 */
- (void)unsetTemporarySslTrust;

/**
 * Updates user's response from a trust prompt, thus it is re-used the next
 * time it'll be needed. An #E_TRUST_PROMPT_RESPONSE_UNKNOWN is treated as
 * a temporary reject, which means the user will be asked again.
 *
 * @param host a host name to store the certificate for
 * @param cert the invalid certificate of the connection over which @host is about
 *        to be sent
 * @param response user's response from a trust prompt for @cert
 */
- (void)updateSslTrustWithHost:(OFString*)host cert:(OGTlsCertificate*)cert response:(ETrustPromptResponse)response;

/**
 * Verifies SSL/TLS trust for the given @host and @cert, as previously stored in the @extension
 * with e_source_webdav_update_ssl_trust().
 *
 * @param host a host name to store the certificate for
 * @param cert the invalid certificate of the connection over which @host is about
 *        to be sent
 * @param certErrors a bit-or of #GTlsCertificateFlags describing the reason
 *   for the @cert to be considered invalid
 * @return
 */
- (ETrustPromptResponse)verifySslTrustWithHost:(OFString*)host cert:(OGTlsCertificate*)cert certErrors:(GTlsCertificateFlags)certErrors;

@end