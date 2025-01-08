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
@interface OGESourceOffline : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceOffline*)castedGObject;

/**
 * Returns whether data from a remote server should be cached locally
 * for viewing while offline.  Backends are responsible for implementing
 * such caching.
 *
 * @return whether data should be cached for offline
 */
- (bool)staySynchronized;

/**
 * Sets whether data from a remote server should be cached locally for
 * viewing while offline.  Backends are responsible for implementing
 * such caching.
 *
 * @param staySynchronized whether data should be cached for offline
 */
- (void)setStaySynchronized:(bool)staySynchronized;

@end