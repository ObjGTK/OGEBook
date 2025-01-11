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
@interface OGESourceWebDAVNotes : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceWebDAVNotes*)castedGObject;

/**
 * Thread-safe variation of e_source_webdav_notes_get_default_ext().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceWebDAVNotes:default-ext,
 *    or %NULL, when none is set
 */
- (OFString*)dupDefaultExt;

/**
 * Returns the default file extension for new notes.
 *
 * @return the default file extension, or %NULL, when none is set
 */
- (OFString*)defaultExt;

/**
 * Sets the default file extension for new notes.
 * 
 * The internal copy of @default_ext is automatically stripped of leading and
 * trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param defaultExt a default file extension, or %NULL
 */
- (void)setDefaultExt:(OFString*)defaultExt;

@end