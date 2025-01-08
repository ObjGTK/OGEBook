/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceAuthentication : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceAuthentication*)castedGObject;

/**
 * Thread-safe variation of e_source_authentication_get_credential_name().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceAuthentication:credential-name
 */
- (OFString*)dupCredentialName;

/**
 * Thread-safe variation of e_source_authentication_get_host().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceAuthentication:host
 */
- (OFString*)dupHost;

/**
 * Thread-safe variation of e_source_authentication_get_method().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceAuthentication:method
 */
- (OFString*)dupMethod;

/**
 * Thread-safe variation of e_source_authentication_get_proxy_uid().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceAuthentication:proxy-uid
 */
- (OFString*)dupProxyUid;

/**
 * Thread-safe variation of e_source_authentication_get_user().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceAuthentication:user
 */
- (OFString*)dupUser;

/**
 * Returns the credential name used to pass the stored or gathered credential
 * (like password) into the e_source_invoke_authenticate(). This is
 * a counterpart of the authentication method. The %NULL means to use
 * the default name, which is #E_SOURCE_CREDENTIAL_PASSWORD.
 *
 * @return the credential name to use for authentication, or %NULL
 */
- (OFString*)credentialName;

/**
 * Returns the host name used to authenticate to a remote account.
 *
 * @return the host name of a remote account
 */
- (OFString*)host;

/**
 * Get if the authentication is done by an external application such as a
 * Single Sign On application (e.g. GNOME Online Accounts)
 *
 * @return %TRUE if the authentication is done by an external application,
 * %FALSE otherwise
 */
- (bool)isExternal;

/**
 * Returns the authentication method for a remote account.  There are
 * no pre-defined method names; backends are free to set this however
 * they wish.  If authentication is not required for a remote account,
 * the convention is to set #ESourceAuthentication:method to "none".
 *
 * @return the authentication method for a remote account
 */
- (OFString*)method;

/**
 * Returns the port number used to authenticate to a remote account.
 *
 * @return the port number of a remote account
 */
- (guint16)port;

/**
 * Returns the #ESource:uid of the #ESource that holds network proxy
 * settings for use when connecting to a remote account.
 *
 * @return the proxy profile #ESource:uid
 */
- (OFString*)proxyUid;

/**
 * Returns whether to offer to remember the provided password by default
 * in password prompts.  This way, if the user unchecks the option it will
 * be unchecked by default in future password prompts.
 *
 * @return whether to offer to remember the password by default
 */
- (bool)rememberPassword;

/**
 * Returns the user name used to authenticate to a remote account.
 *
 * @return the user name of a remote account
 */
- (OFString*)user;

/**
 * Returns a #GSocketConnectable instance constructed from @extension's
 * #ESourceAuthentication:host and #ESourceAuthentication:port properties,
 * or %NULL if the #ESourceAuthentication:host is not set.
 * 
 * The returned #GSocketConnectable is referenced for thread-safety and must
 * be unreferenced with g_object_unref() when finished with it.
 *
 * @return a #GSocketConnectable, or %NULL
 */
- (GSocketConnectable*)refConnectable;

/**
 * This is a convenience function which returns whether authentication
 * is required at all, regardless of the method used.  This relies on
 * the convention of setting #ESourceAuthentication:method to "none"
 * when authentication is <emphasis>not</emphasis> required.
 *
 * @return whether authentication is required at all
 */
- (bool)required;

/**
 * Sets the credential name used to pass the stored or gathered credential
 * (like password) into the e_source_invoke_authenticate(). This is
 * a counterpart of the authentication method. The %NULL means to use
 * the default name, which is #E_SOURCE_CREDENTIAL_PASSWORD.
 * 
 * The internal copy of @credential_name is automatically stripped
 * of leading and trailing whitespace. If the resulting string is
 * empty, %NULL is set instead.
 *
 * @param credentialName a credential name, or %NULL
 */
- (void)setCredentialName:(OFString*)credentialName;

/**
 * Sets the host name used to authenticate to a remote account.
 * 
 * The internal copy of @host is automatically stripped of leading and
 * trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param host a host name, or %NULL
 */
- (void)setHost:(OFString*)host;

/**
 * Set if the authentication is done by an external application such as a
 * Single Sign On application (e.g. GNOME Online Accounts)
 *
 * @param isExternal %TRUE if the authentication is done using an external
 * application, %FALSE otherwise
 */
- (void)setIsExternal:(bool)isExternal;

/**
 * Sets the authentication method for a remote account.  There are no
 * pre-defined method names; backends are free to set this however they
 * wish.  If authentication is not required for a remote account, the
 * convention is to set the method to "none".  In keeping with that
 * convention, #ESourceAuthentication:method will be set to "none" if
 * @method is %NULL or an empty string.
 *
 * @param method authentication method, or %NULL
 */
- (void)setMethod:(OFString*)method;

/**
 * Sets the port number used to authenticate to a remote account.
 *
 * @param port a port number
 */
- (void)setPort:(guint16)port;

/**
 * Sets the #ESource:uid of the #ESource that holds network proxy settings
 * for use when connecting to a remote account.
 *
 * @param proxyUid the proxy profile #ESource:uid
 */
- (void)setProxyUid:(OFString*)proxyUid;

/**
 * Sets whether to offer to remember the provided password by default in
 * password prompts.  This way, if the user unchecks the option it will be
 * unchecked by default in future password prompts.
 *
 * @param rememberPassword whether to offer to remember the password by default
 */
- (void)setRememberPassword:(bool)rememberPassword;

/**
 * Sets the user name used to authenticate to a remote account.
 * 
 * The internal copy of @user is automatically stripped of leading and
 * trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param user a user name, or %NULL
 */
- (void)setUser:(OFString*)user;

@end