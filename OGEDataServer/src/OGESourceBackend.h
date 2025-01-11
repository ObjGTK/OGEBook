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
@interface OGESourceBackend : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceBackend*)castedGObject;

/**
 * Thread-safe variation of e_source_backend_get_backend_name().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceBackend:backend-name
 */
- (OFString*)dupBackendName;

/**
 * Returns the backend name for @extension.
 *
 * @return the backend name for @extension
 */
- (OFString*)backendName;

/**
 * Sets the backend name for @extension.
 * 
 * The internal copy of @backend_name is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param backendName a backend name, or %NULL
 */
- (void)setBackendName:(OFString*)backendName;

@end