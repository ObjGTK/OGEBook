/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceResource : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceResource*)castedGObject;

/**
 * Thread-safe variation of e_source_resource_get_identity().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceResource:identity
 */
- (OFString*)dupIdentity;

/**
 * Returns the server-assigned identity of the remote resource associated
 * with the #ESource to which @extension belongs.
 *
 * @return the identity of a remote resource
 */
- (OFString*)identity;

/**
 * Sets the server-assigned identity of the remote resource associated with
 * the #ESource to which @extension belongs.
 * 
 * The internal copy of @identity is automatically stripped of leading and
 * trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param identity the identity of a remote resource
 */
- (void)setIdentity:(OFString*)identity;

@end