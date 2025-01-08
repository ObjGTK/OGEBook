/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStream.h"

@interface OGCamelStreamNull : OGCamelStream
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelStreamNull*)castedGObject;

/**
 *
 * @return how many bytes had been written to the @stream_null since
 *   it was created or rewind to the beginning.
 */
- (gsize)bytesWritten;

/**
 *
 * @return Whether the data being written to @stream_null ended with CRLF.
 */
- (bool)endsWithCrlf;

@end