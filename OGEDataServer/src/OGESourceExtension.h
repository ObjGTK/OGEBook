/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

@class OGESource;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceExtension : OGObject
{

}


/**
 * Methods
 */

- (ESourceExtension*)castedGObject;

/**
 * Returns the #ESource instance to which @extension belongs.
 * 
 * Note this function is not thread-safe.  The returned #ESource could
 * be finalized by another thread while the caller is still using it.
 *
 * @return the #ESource instance
 */
- (OGESource*)source;

/**
 * Acquires a property lock, thus no other thread can change properties
 * of the @extension until the lock is released.
 *
 */
- (void)propertyLock;

/**
 * Releases a property lock, previously acquired with e_source_extension_property_lock(),
 * thus other threads can change properties of the @extension.
 *
 */
- (void)propertyUnlock;

/**
 * Returns the #ESource instance to which the @extension belongs.
 * 
 * The returned #ESource is referenced for thread-safety.  Unreference
 * the #ESource with g_object_unref() when finished with it.
 *
 * @return the #ESource instance
 */
- (OGESource*)refSource;

@end