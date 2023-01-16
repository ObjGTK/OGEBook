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
@interface OGESourceMailIdentity : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceMailIdentity*)SOURCEMAILIDENTITY;

/**
 * Thread-safe variation of e_source_mail_identity_get_address().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailIdentity:address
 */
- (OFString*)dupAddress;

/**
 * Thread-safe variation of e_source_mail_identity_get_aliases().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailIdentity:aliases
 */
- (OFString*)dupAliases;

/**
 * Thread-safe variation of e_source_mail_identity_get_name().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailIdentity:name
 */
- (OFString*)dupName;

/**
 * Thread-safe variation of e_source_mail_identity_dup_organization().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailIdentity:organization
 */
- (OFString*)dupOrganization;

/**
 * Thread-safe variation of e_source_mail_identity_get_reply_to().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailIdentity:reply-to
 */
- (OFString*)dupReplyTo;

/**
 * Thread-safe variation of e_source_mail_identity_get_signature_uid().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailIdentity:signature-uid
 */
- (OFString*)dupSignatureUid;

/**
 * Returns the email address for this identity from which to send messages.
 * This may be an empty string but will never be %NULL.
 *
 * @return the sender's email address
 */
- (OFString*)address;

/**
 * Returns the email address aliases for this identity. These are comma-separated
 * email addresses which may or may not contain also different name.
 * This may be an empty string, but will never be %NULL.
 * There can be used camel_address_decode() on a #CamelInternetAddress
 * to decode the list of aliases.
 *
 * @return the sender's email address aliases
 */
- (OFString*)aliases;

/**
 * Returns a set aliases as a hash table with address as key and
 * name as value of the hash table. The name can be sometimes
 * empty or NULL, thus rather use g_hash_table_contains() when
 * checking for particular address. The addresses are
 * compared case insensitively. The same addresses with a different
 * name are included only once, the last variant of it. Use
 * e_source_mail_identity_get_aliases() if you need more fine-grained
 * control on the list of aliases.
 *
 * @return A newly created
 *   #GHashTable will all the aliases. Returns %NULL if there are none set.
 *   Use g_hash_table_destroy() to free the returned hash table.
 */
- (GHashTable*)aliasesAsHashTable;

/**
 * Returns the sender's name for this identity.
 *
 * @return the sender's name
 */
- (OFString*)name;

/**
 * Returns the sender's organization for this identity.
 *
 * @return the sender's organization
 */
- (OFString*)organization;

/**
 * Returns the email address for this identity to which recipients should
 * send replies.
 *
 * @return the sender's reply-to address
 */
- (OFString*)replyTo;

/**
 * Returns the #ESource:uid of an #ESource describing a mail signature.
 * 
 * If the user does not want to use a signature for this identity, the
 * convention is to set the #ESourceMailIdentity:signature-uid property
 * to "none".
 *
 * @return the sender's signature ID, or "none"
 */
- (OFString*)signatureUid;

/**
 * Sets the email address for this identity from which to send messages.
 * 
 * The internal copy of @address is automatically stripped of leading and
 * trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param address the sender's email address, or %NULL
 */
- (void)setAddress:(OFString*)address;

/**
 * Sets the email address aliases for this identity. These are comma-separated
 * email addresses which may or may not contain also different name.
 * 
 * The internal copy of @aliases is automatically stripped of leading and
 * trailing whitespace. If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param aliases the sender's email address aliases, or %NULL
 */
- (void)setAliases:(OFString*)aliases;

/**
 * Sets the sender's name for this identity.
 * 
 * The internal copy of @name is automatically stripped of leading and
 * trailing whitespace.
 *
 * @param name the sender's name, or %NULL
 */
- (void)setName:(OFString*)name;

/**
 * Sets the sender's organization for this identity.
 * 
 * The internal copy of @organization is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param organization the sender's organization, or %NULL
 */
- (void)setOrganization:(OFString*)organization;

/**
 * Sets the email address for this identity to which recipients should
 * send replies.
 * 
 * The internal copy of @reply_to is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is
 * set instead.
 *
 * @param replyTo the sender's reply-to address, or %NULL
 */
- (void)setReplyTo:(OFString*)replyTo;

/**
 * Sets the #ESource:uid of an #ESource describing a mail signature.
 * 
 * If the user does not want to use a signature for this identity, the
 * convention is to set the #ESourceMailIdentity:signature-uid property
 * to "none".  In keeping with that convention, the property will be set
 * to "none" if @signature is %NULL or an empty string.
 *
 * @param signatureUid the sender's signature ID, or %NULL
 */
- (void)setSignatureUid:(OFString*)signatureUid;

@end