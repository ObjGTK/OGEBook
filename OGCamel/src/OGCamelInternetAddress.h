/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelAddress.h"

@interface OGCamelInternetAddress : OGCamelAddress
{

}

/**
 * Functions
 */

/**
 * Encode a single address ready for internet usage.  Header folding
 * as per rfc822 is also performed, based on the length *@len.  If @len
 * is %NULL, then no folding will occur.
 * 
 * Note: The value at *@in will be updated based on any linewrapping done
 *
 * @param len the length of the line the address is being appended to
 * @param name the unencoded real name associated with the address
 * @param addr the routing address
 * @return the encoded address
 */
+ (OFString*)encodeAddressWithLen:(gint*)len name:(OFString*)name addr:(OFString*)addr;

/**
 * Function to format a single address, suitable for display.
 *
 * @param name a name, quotes may be stripped from it
 * @param addr an rfc822 routing address
 * @return a nicely formatted string containing the rfc822 address
 */
+ (OFString*)formatAddressWithName:(OFString*)name addr:(OFString*)addr;

/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelInternetAddress*)castedGObject;

/**
 * Add a new internet address to @addr.
 *
 * @param name name associated with the new address
 * @param address routing address associated with the new address
 * @return the index of added entry
 */
- (gint)addWithName:(OFString*)name address:(OFString*)address;

/**
 * Ensures that all email address' domains will be ASCII encoded,
 * which means that any non-ASCII letters will be properly encoded.
 * This includes IDN (Internationalized Domain Names).
 *
 */
- (void)ensureAsciiDomains;

/**
 * Find an address by address.
 *
 * @param address address to lookup
 * @param namep holder for the matching name, or %NULL, if not required.
 * @return the index of the address, or -1 if not found
 */
- (gint)findAddressWithAddress:(OFString*)address namep:(const gchar**)namep;

/**
 * Find address by real name.
 *
 * @param name name to lookup
 * @param addressp holder for address part, or %NULL, if not required.
 * @return the index of the address matching the name, or -1 if no
 * match was found
 */
- (gint)findNameWithName:(OFString*)name addressp:(const gchar**)addressp;

/**
 * Get the address at @index.
 *
 * @param index address's array index
 * @param namep holder for the returned name, or %NULL, if not required.
 * @param addressp holder for the returned address, or %NULL, if not required.
 * @return %TRUE if such an address exists, or %FALSE otherwise
 */
- (bool)getWithIndex:(gint)index namep:(const gchar**)namep addressp:(const gchar**)addressp;

/**
 * Checks the addresses in @addr for any suspicious characters in the domain
 * name and coverts those domains into their representation. In contrast to
 * camel_internet_address_ensure_ascii_domains(), this converts the domains
 * into ASCII only when needed, as returned by camel_hostname_utils_requires_ascii().
 *
 * @return %TRUE, when converted at least one address
 */
- (bool)sanitizeAsciiDomain;

@end