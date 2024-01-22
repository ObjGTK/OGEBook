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
@interface OGESourceAutoconfig : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceAutoconfig*)castedGObject;

/**
 * Thread-safe variation of e_source_autoconfig_get_revision().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceAutoconfig:revision
 */
- (OFString*)dupRevision;

/**
 * Returns the revision of a data source. This maps a particular version of a
 * system-wide source to a user-specific source.
 * 
 * If doesn't match, the system-wide source will be copied to the user-specific
 * evolution config directory, preserving the already present fields that are
 * not defined by the system-wide source.
 * 
 * If it matches, no copying is done.
 *
 * @return revision of the data source
 */
- (OFString*)revision;

/**
 * Sets the revision used to map a particular version of a system-wide source
 * to a user-specific source.
 * 
 * If doesn't match, the system-wide source will be copied to the user-specific
 * evolution config directory, preserving the already present fields that are
 * not defined by the system-wide source.
 * 
 * If it matches, no copying is done.
 * 
 * The internal copy of @revision is automatically stripped of leading and
 * trailing whitespace.
 *
 * @param revision a revision
 */
- (void)setRevision:(OFString*)revision;

@end