/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGOutputStream;

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

- (CamelNullOutputStream*)castedGObject;

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