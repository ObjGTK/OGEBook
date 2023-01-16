/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceProxy : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceProxy*)SOURCEPROXY;

/**
 * Thread-safe variation of e_source_proxy_get_autoconfig_url().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceProxy:autoconfig-url
 */
- (OFString*)dupAutoconfigUrl;

/**
 * Thread-safe variation of e_source_proxy_get_ftp_host().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceProxy:ftp-host
 */
- (OFString*)dupFtpHost;

/**
 * Thread-safe variation of e_source_proxy_get_http_auth_password().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceProxy:http-auth-password
 */
- (OFString*)dupHttpAuthPassword;

/**
 * Thread-safe variation of e_source_proxy_get_http_auth_user().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceProxy:http-auth-user
 */
- (OFString*)dupHttpAuthUser;

/**
 * Thread-safe variation of e_source_proxy_get_http_host().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceProxy:http-host
 */
- (OFString*)dupHttpHost;

/**
 * Threads-safe variation of e_source_proxy_get_https_host().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceProxy:https-host
 */
- (OFString*)dupHttpsHost;

/**
 * Thread-safe variation of e_source_proxy_get_ignore_hosts().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string array should be freed with g_strfreev() when no
 * longer needed.
 *
 * @return a newly-allocated copy of
 *          #ESourceProxy:ignore-hosts
 */
- (gchar**)dupIgnoreHosts;

/**
 * Thread-safe variation of e_source_proxy_get_socks_host().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceProxy:socks-host
 */
- (OFString*)dupSocksHost;

/**
 * Returns the URL that provides proxy configuration values.  When the
 * @extension's #ESourceProxy:method is @E_PROXY_METHOD_AUTO, this URL
 * is used to look up proxy information for all protocols.
 *
 * @return the autoconfiguration URL
 */
- (OFString*)autoconfigUrl;

/**
 * Returns the machine name to proxy FTP through when @extension's
 * #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @return FTP proxy host name
 */
- (OFString*)ftpHost;

/**
 * Returns the port on the machine defined by #ESourceProxy:ftp-host to proxy
 * through when @extension's #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @return FTP proxy port
 */
- (guint16)ftpPort;

/**
 * Returns the password to pass as authentication when doing HTTP proxying
 * and #ESourceProxy:http-use-auth is %TRUE.
 *
 * @return HTTP proxy password
 */
- (OFString*)httpAuthPassword;

/**
 * Returns the user name to pass as authentication when doing HTTP proxying
 * and #ESourceProxy:http-use-auth is %TRUE.
 *
 * @return HTTP proxy username
 */
- (OFString*)httpAuthUser;

/**
 * Returns the machine name to proxy HTTP through when @extension's
 * #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @return HTTP proxy host name
 */
- (OFString*)httpHost;

/**
 * Returns the port on the machine defined by #ESourceProxy:http-host to proxy
 * through when @extension's #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @return HTTP proxy port
 */
- (guint16)httpPort;

/**
 * Returns whether the HTTP proxy server at #ESourceProxy:http-host and
 * #ESourceProxy:http-port requires authentication.
 * 
 * The username/password combo is defined by #ESourceProxy:http-auth-user
 * and #ESourceProxy:http-auth-password, but only applies when @extension's
 * #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @return whether to authenticate HTTP proxy connections
 */
- (bool)httpUseAuth;

/**
 * Returns the machine name to proxy secure HTTP through when @extension's
 * #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @return secure HTTP proxy host name
 */
- (OFString*)httpsHost;

/**
 * Returns the port on the machine defined by #ESourceProxy:https-host to proxy
 * through when @extension's #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @return secure HTTP proxy port
 */
- (guint16)httpsPort;

/**
 * Returns a %NULL-terminated string array of hosts which are connected to
 * directly, rather than via the proxy (if it is active).  The array elements
 * can be hostnames, domains (using an initial wildcard like *.foo.com), IP
 * host addresses (both IPv4 and IPv6) and network addresses with a netmask
 * (something like 192.168.0.0/24).
 * 
 * The returned array is owned by @extension and should not be modified or
 * freed.
 *
 * @return a %NULL-terminated string array of hosts
 */
- (const gchar* const*)ignoreHosts;

/**
 * Returns the proxy configuration method for @extension.
 * 
 * The proxy configuration method determines the behavior of
 * e_source_proxy_lookup().
 *
 * @return the proxy configuration method
 */
- (EProxyMethod)method;

/**
 * Returns the machine name to use as a SOCKS proxy when @extension's
 * #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @return SOCKS proxy host name
 */
- (OFString*)socksHost;

/**
 * Returns the port on the machine defined by #ESourceProxy:socks-host to proxy
 * through when @extension's #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @return SOCKS proxy port
 */
- (guint16)socksPort;

/**
 * Sets the URL that provides proxy configuration values.  When the
 * @extension's #ESourceProxy:method is @E_PROXY_METHOD_AUTO, this URL
 * is used to look up proxy information for all protocols.
 *
 * @param autoconfigUrl an autoconfiguration URL
 */
- (void)setAutoconfigUrl:(OFString*)autoconfigUrl;

/**
 * Sets the machine name to proxy FTP through when @extension's
 * #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @param ftpHost FTP proxy host name
 */
- (void)setFtpHost:(OFString*)ftpHost;

/**
 * Sets the port on the machine defined by #ESourceProxy:ftp-host to proxy
 * through when @extension's #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @param ftpPort FTP proxy port
 */
- (void)setFtpPort:(guint16)ftpPort;

/**
 * Sets the password to pass as authentication when doing HTTP proxying
 * and #ESourceProxy:http-use-auth is %TRUE.
 *
 * @param httpAuthPassword HTTP proxy password
 */
- (void)setHttpAuthPassword:(OFString*)httpAuthPassword;

/**
 * Sets the user name to pass as authentication when doing HTTP proxying
 * and #ESourceProxy:http-use-auth is %TRUE.
 *
 * @param httpAuthUser HTTP proxy username
 */
- (void)setHttpAuthUser:(OFString*)httpAuthUser;

/**
 * Sets the machine name to proxy HTTP through when @extension's
 * #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @param httpHost HTTP proxy host name
 */
- (void)setHttpHost:(OFString*)httpHost;

/**
 * Sets the port on the machine defined by #ESourceProxy:http-host to proxy
 * through when @extension's #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @param httpPort HTTP proxy port
 */
- (void)setHttpPort:(guint16)httpPort;

/**
 * Sets whether the HTTP proxy server at #ESourceProxy:http-host and
 * #ESourceProxy:http-port requires authentication.
 * 
 * The username/password combo is defined by #ESourceProxy:http-auth-user
 * and #ESourceProxy:http-auth-password, but only applies when @extension's
 * #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @param httpUseAuth whether to authenticate HTTP proxy connections
 */
- (void)setHttpUseAuth:(bool)httpUseAuth;

/**
 * Sets the machine name to proxy secure HTTP through when @extension's
 * #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @param httpsHost secure HTTP proxy host name
 */
- (void)setHttpsHost:(OFString*)httpsHost;

/**
 * Sets the port on the machine defined by #ESourceProxy:https-host to proxy
 * through when @extension's #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @param httpsPort secure HTTP proxy port
 */
- (void)setHttpsPort:(guint16)httpsPort;

/**
 * Sets the hosts which are connected to directly, rather than via the proxy
 * (if it is active).  The array elements can be hostnames, domains (using an
 * initial wildcard like *.foo.com), IP host addresses (both IPv4 and IPv6)
 * and network addresses with a netmask (something like 192.168.0.0/24).
 *
 * @param ignoreHosts a %NULL-terminated string array of hosts
 */
- (void)setIgnoreHosts:(const gchar* const*)ignoreHosts;

/**
 * Sets the proxy configuration method for @extension.
 * 
 * The proxy configuration method determines the behavior of
 * e_source_proxy_lookup().
 *
 * @param method the proxy configuration method
 */
- (void)setMethod:(EProxyMethod)method;

/**
 * Sets the machine name to use as a SOCKS proxy when @extension's
 * #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @param socksHost SOCKS proxy host name
 */
- (void)setSocksHost:(OFString*)socksHost;

/**
 * Sets the port on the machine defined by #ESourceProxy:socks-host to proxy
 * through when @extension's #ESourceProxy:method is @E_PROXY_METHOD_MANUAL.
 *
 * @param socksPort SOCKS proxy port
 */
- (void)setSocksPort:(guint16)socksPort;

@end