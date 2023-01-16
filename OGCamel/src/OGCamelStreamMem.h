/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStream.h"

@interface OGCamelStreamMem : OGCamelStream
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithBufferWithBuffer:(OFString*)buffer len:(gsize)len;
- (instancetype)initWithByteArray:(GByteArray*)buffer;

/**
 * Methods
 */

- (CamelStreamMem*)STREAMMEM;

/**
 *
 * @return
 */
- (GByteArray*)byteArray;

/**
 * Set @buffer to be the backing data to the existing #CamelStreamMem, @mem.
 * 
 * Note: @buffer will be copied into an internal #GByteArray structure
 * and so may have resource implications to consider.
 *
 * @param buffer a memory buffer
 * @param len length of @buffer
 */
- (void)setBufferWithBuffer:(OFString*)buffer len:(gsize)len;

/**
 * Set @buffer to be the backing data to the existing #CamelStreamMem, @mem.
 * 
 * Note: @mem will not take ownership of @buffer and so will need to
 * be freed separately from @mem.
 *
 * @param buffer a #GByteArray
 */
- (void)setByteArray:(GByteArray*)buffer;

/**
 * Mark the memory stream as secure.  At the very least this means the
 * data in the buffer will be cleared when the buffer is finalized.
 * This only applies to buffers owned by the stream.
 *
 */
- (void)setSecure;

@end