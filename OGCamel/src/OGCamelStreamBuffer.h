/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStream.h"

@class OGCancellable;

@interface OGCamelStreamBuffer : OGCamelStream
{

}


/**
 * Constructors
 */
+ (instancetype)streamBufferWithStream:(OGCamelStream*)stream mode:(CamelStreamBufferMode)mode;

/**
 * Methods
 */

- (CamelStreamBuffer*)castedGObject;

/**
 * Discards any cached data in the @sbf. The next read reads
 * from the stream.
 *
 */
- (void)discardCache;

/**
 * Read a line of characters up to the next newline character or
 * @max-1 characters.
 * 
 * If the newline character is encountered, then it will be
 * included in the buffer @buf.  The buffer will be %NULL terminated.
 *
 * @param buf Memory to write the string to.
 * @param max Maxmimum number of characters to store.
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the number of characters read, or 0 for end of file,
 * and -1 on error.
 */
- (gint)sWithBuf:(OFString*)buf max:(guint)max cancellable:(OGCancellable*)cancellable;

/**
 * This function reads a complete newline-terminated line from the stream
 * and returns it in allocated memory. The trailing newline (and carriage
 * return if any) are not included in the returned string.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the line read, which the caller must free when done with,
 * or %NULL on eof. If an error occurs, @error will be set.
 */
- (OFString*)readLineWithCancellable:(OGCancellable*)cancellable;

@end