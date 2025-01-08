/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelAddress : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelAddress*)castedGObject;

/**
 * Concatenate one address onto another. The addresses must
 * be of the same type.
 *
 * @param source source #CamelAddress object
 * @return the number of addresses concatenated
 */
- (gint)cat:(OGCamelAddress*)source;

/**
 * Copy the contents of one address into another.
 *
 * @param source source #CamelAddress object
 * @return the number of addresses copied
 */
- (gint)copy:(OGCamelAddress*)source;

/**
 * Construct a new address from a raw address field.
 *
 * @param raw raw address description
 * @return the number of addresses parsed or -1 on fail
 */
- (gint)decode:(OFString*)raw;

/**
 * Encode an address in a format suitable for a raw header.
 *
 * @return the encoded address
 */
- (OFString*)encode;

/**
 * Format an address in a format suitable for display.
 *
 * @return a newly allocated string containing the formatted addresses
 */
- (OFString*)format;

/**
 * Get the number of addresses stored in the address @addr.
 *
 * @return the number of addresses contained in @addr
 */
- (gint)length;

/**
 * Clone an existing address type.
 *
 * @return the cloned address
 */
- (OGCamelAddress*)newClone;

/**
 * Remove an address by index, or all addresses.
 *
 * @param index The address to remove, use -1 to remove all address.
 */
- (void)remove:(gint)index;

/**
 * Attempt to convert a previously formatted and/or edited
 * address back into internal form.
 *
 * @param raw raw address description
 * @return the number of addresses parsed or -1 on fail
 */
- (gint)unformat:(OFString*)raw;

@end