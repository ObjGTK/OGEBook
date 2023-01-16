/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelNullOutputStream : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelNullOutputStream*)NULLOUTPUTSTREAM;

/**
 * Gets the total number of bytes written to @null_stream.
 *
 * @return total byte count
 */
- (gsize)bytesWritten;

/**
 *
 * @return Whether the data being written to @null_stream ended with CRLF.
 */
- (bool)endsWithCrlf;

@end