/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGIOStream;

@interface OGCamelStream : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)streamWithBaseStream:(OGIOStream*)baseStream;

/**
 * Methods
 */

- (CamelStream*)castedGObject;

/**
 * Closes the stream.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return 0 on success or -1 on error.
 */
- (gint)closeWithCancellable:(OGCancellable*)cancellable;

/**
 * Tests if there are bytes left to read on the @stream object.
 *
 * @return %TRUE on EOS or %FALSE otherwise.
 */
- (bool)eos;

/**
 * Flushes any buffered data to the stream's backing store.  Only
 * meaningful for writable streams.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return 0 on success or -1 on fail along with setting @error
 */
- (gint)flushWithCancellable:(OGCancellable*)cancellable;

/**
 * Attempts to read up to @n bytes from @stream into @buffer.
 *
 * @param buffer output buffer
 * @param n max number of bytes to read.
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the number of bytes actually read, or -1 on error and set
 * errno.
 */
- (gssize)readWithBuffer:(OFString*)buffer n:(gsize)n cancellable:(OGCancellable*)cancellable;

/**
 * Returns the #GIOStream for @stream.  This is only valid if @stream was
 * created with camel_stream_new().  For all other #CamelStream subclasses
 * this function returns %NULL.
 * 
 * The returned #GIOStream is referenced for thread-safety and should be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return a #GIOStream, or %NULL
 */
- (OGIOStream*)refBaseStream;

/**
 * Replaces the #GIOStream passed to camel_stream_new() with @base_stream.
 * The new @base_stream should wrap the original #GIOStream, such as when
 * adding Transport Layer Security after issuing a STARTTLS command.
 *
 * @param baseStream a #GIOStream
 */
- (void)setBaseStream:(OGIOStream*)baseStream;

/**
 * Attempts to write up to @n bytes of @buffer into @stream.
 *
 * @param buffer buffer to write.
 * @param n number of bytes to write
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the number of bytes written to the stream, or -1 on error
 * along with setting errno.
 */
- (gssize)writeWithBuffer:(OFString*)buffer n:(gsize)n cancellable:(OGCancellable*)cancellable;

/**
 * Writes the string to the stream.
 *
 * @param string a string
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the number of characters written or -1 on error.
 */
- (gssize)writeString:(OFString*)string cancellable:(OGCancellable*)cancellable;

/**
 * Write all of a stream (until eos) into another stream, in a
 * blocking fashion.
 *
 * @param outputStream destination #CamelStream object
 * @param cancellable optional #GCancellable object, or %NULL
 * @return -1 on error, or the number of bytes successfully
 * copied across streams.
 */
- (gssize)writeToStreamWithOutputStream:(OGCamelStream*)outputStream cancellable:(OGCancellable*)cancellable;

@end