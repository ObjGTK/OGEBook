/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelAddress.h"

@interface OGCamelNNTPAddress : OGCamelAddress
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelNNTPAddress*)castedGObject;

/**
 * Add a new nntp address to the address object.  Duplicates are not added twice.
 *
 * @param name a new NNTP address to add
 * @return Index of added entry, or existing matching entry.
 */
- (gint)add:(OFString*)name;

/**
 * Get the address at @index.
 *
 * @param index address's array index
 * @param namep Holder for the returned address, or NULL, if not required.
 * @return TRUE if such an address exists, or FALSE otherwise.
 */
- (bool)getWithIndex:(gint)index namep:(const gchar**)namep;

@end