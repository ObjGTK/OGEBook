/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelMimeFilter;
@class OGCamelStream;
@class OGInputStream;

@interface OGCamelMimeParser : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelMimeParser*)castedGObject;

/**
 * Get the content type defined in the current part.
 *
 * @return A content_type structure, or %NULL if there
 * is no content-type defined for this part of state of the
 * parser.
 */
- (CamelContentType*)contentType;

/**
 * Drop the last step call.  This should only be used
 * in conjunction with seeking of the stream as the
 * stream may be in an undefined state relative to the
 * state of the parser.
 * 
 * Use this call with care.
 *
 */
- (void)dropStep;

/**
 * Get the list of the raw headers which are defined for the
 * current state of the parser.  These headers are valid
 * until the next call to camel_mime_parser_step(), or camel_mime_parser_drop_step().
 *
 * @return The headers, or %NULL, if there are no
 * headers defined for the current part or state. Free it with
 * camel_name_value_array_free().
 */
- (CamelNameValueArray*)dupHeaders;

/**
 *
 * @return
 */
- (gint)errNo;

/**
 * Add a filter that will be applied to any body content before it is passed
 * to the caller.  Filters may be pipelined to perform multi-pass operations
 * on the content, and are applied in the order they were added.
 * 
 * Note that filters are only applied to the body content of messages, and once
 * a filter has been set, all content returned by a camel_mime_parser_step()
 * with a state of CAMEL_MIME_PARSER_STATE_BODY will have passed through the
 * filter.
 *
 * @param mf a #CamelMimeFilter
 * @return An id that may be passed to camel_mime_parser_filter_remove() to
 * remove the filter, or -1 if the operation failed.
 */
- (gint)filterAdd:(OGCamelMimeFilter*)mf;

/**
 * Remove a processing filter from the pipeline.  There is no
 * restriction on the order the filters can be removed.
 *
 * @param identifier id of the filter to remove, as returned from camel_mime_parser_filter_add()
 */
- (void)filterRemove:(gint)identifier;

/**
 * Get the last scanned "From " line, from a recently scanned from.
 * This should only be called in the CAMEL_MIME_PARSER_STATE_FROM state.  The
 * from line will include the closing \n found (if there was one).
 * 
 * The return value will remain valid while in the CAMEL_MIME_PARSER_STATE_FROM
 * state, or any deeper state.
 *
 * @return The From line, or %NULL if called out of context.
 */
- (OFString*)fromLine;

/**
 * Lookup a header by name.
 *
 * @param name Name of header.
 * @param offset Pointer that can receive the offset of the header in
 * the stream from the start of parsing.
 * @return The header value, or %NULL if the header is not
 * defined.
 */
- (OFString*)headerWithName:(OFString*)name offset:(gint*)offset;

/**
 * Convenience function creates a #GMemoryInputStream from @bytes and hands
 * it off to camel_mime_parser_init_with_input_stream().
 *
 * @param bytes a #GBytes containing the message content
 */
- (void)initWithBytes:(GBytes*)bytes;

/**
 * Initialise the scanner with an fd.  The scanner's offsets
 * will be relative to the current file position of the file
 * descriptor.  As a result, seekable descritors should
 * be seeked using the parser seek functions.
 *
 * @param fd A valid file descriptor.
 * @return Returns -1 on error.
 */
- (gint)initWithFd:(gint)fd;

/**
 * Initialize the scanner with @input_stream.  The scanner's offsets will
 * be relative to the current file position of the stream.  As a result,
 * seekable streams should only be seeked using the parser seek function.
 *
 * @param inputStream a #GInputStream
 */
- (void)initWithInputStream:(OGInputStream*)inputStream;

/**
 * Initialise the scanner with a source stream.  The scanner's
 * offsets will be relative to the current file position of
 * the stream.  As a result, seekable streams should only
 * be seeked using the parser seek function.
 *
 * @param stream a #CamelStream to init with
 * @return -1 on error.
 */
- (gint)initWithStream:(OGCamelStream*)stream;

/**
 * Retrieve the postface text for the current multipart.
 * Only returns valid data when the current state if
 * CAMEL_MIME_PARSER_STATE_MULTIPART_END.
 *
 * @return The postface text, or %NULL if there wasn't any.
 */
- (OFString*)postface;

/**
 * Retrieve the preface text for the current multipart.
 * Can only be used when the state is CAMEL_MIME_PARSER_STATE_MULTIPART_END.
 *
 * @return The preface text, or %NULL if there wasn't any.
 */
- (OFString*)preface;

/**
 * Pre-load a new parser state.  Used to post-parse multipart content
 * without headers.
 *
 * @param newstate New state
 * @param boundary Boundary marker for state.
 */
- (void)pushStateWithNewstate:(CamelMimeParserState)newstate boundary:(OFString*)boundary;

/**
 * Read at most @len bytes from the internal mime parser buffer.
 * 
 * Returns the address of the internal buffer in @databuffer,
 * and the length of useful data.
 * 
 * @len may be specified as %G_MAXSSIZE, in which case you will
 * get the full remainder of the buffer at each call.
 * 
 * Note that no parsing of the data read through this function
 * occurs, so no state changes occur, but the seek position
 * is updated appropriately.
 *
 * @param databuffer The data buffer
 * @param len The length of data to read
 * @return The number of bytes available, or -1 on error.
 */
- (gssize)readWithDatabuffer:(const gchar**)databuffer len:(gssize)len;

/**
 * Tell the scanner if it should scan "^From " lines or not.
 * 
 * If the scanner is scanning from lines, two additional
 * states CAMEL_MIME_PARSER_STATE_FROM and CAMEL_MIME_PARSER_STATE_FROM_END will be returned
 * to the caller during parsing.
 * 
 * This may also be preceeded by an optional
 * CAMEL_MIME_PARSER_STATE_PRE_FROM state which contains the scanned data
 * found before the From line is encountered.  See also
 * camel_mime_parser_scan_pre_from().
 *
 * @param scanFrom %TRUE if the scanner should scan From lines.
 */
- (void)scanFrom:(bool)scanFrom;

/**
 * Tell the scanner whether we want to know abou the pre-from
 * data during a scan.  If we do, then we may get an additional
 * state CAMEL_MIME_PARSER_STATE_PRE_FROM which returns the specified data.
 *
 * @param scanPreFrom %TRUE if we want to get pre-from data.
 */
- (void)scanPreFrom:(bool)scanPreFrom;

/**
 * Reset the source position to a known value.
 * 
 * Note that if the source stream/descriptor was not
 * positioned at 0 to begin with, and an absolute seek
 * is specified (whence != SEEK_CUR), then the seek
 * position may not match the desired seek position.
 *
 * @param offset Number of bytes to offset the seek by.
 * @param whence SEEK_SET, SEEK_CUR, SEEK_END
 * @return The new seek offset, or -1 on
 * an error (for example, trying to seek on a non-seekable
 * stream or file descriptor).
 */
- (goffset)seekWithOffset:(goffset)offset whence:(gint)whence;

/**
 *
 * @param matchstr
 * @return
 */
- (gint)setHeaderRegex:(OFString*)matchstr;

/**
 * Get the current parser state.
 *
 * @return The current parser state.
 */
- (CamelMimeParserState)state;

/**
 * Parse the next part of the MIME message.  If camel_mime_parser_unstep()
 * has been called, then continue to return the same state
 * for that many calls.
 * 
 * If the step is CAMEL_MIME_PARSER_STATE_BODY then the databuffer and datalength
 * pointers will be setup to point to the internal data buffer
 * of the scanner and may be processed as required.  Any
 * filters will have already been applied to this data.
 * 
 * Refer to the state diagram elsewhere for a full listing of
 * the states an application is gauranteed to get from the
 * scanner.
 *
 * @param databuffer Pointer to
 * accept a pointer to the data associated with this step (if any).  May be %NULL,
 * in which case datalength is also ingored.
 * @param datalength Pointer to accept a pointer to the data
 * length associated with this step (if any).
 * @return The current new state of the parser
 * is returned.
 */
- (CamelMimeParserState)stepWithDatabuffer:(gchar**)databuffer datalength:(gsize*)datalength;

/**
 * Get the stream, if any, the parser has been initialised
 * with.  May be used to setup sub-streams, but should not
 * be read from directly (without saving and restoring
 * the seek position in between).
 *
 * @return The stream from camel_mime_parser_init_with_stream(),
 * or NULL if the parser is reading from a file descriptor or is
 * uninitialised.
 */
- (OGCamelStream*)stream;

/**
 * Return the current scanning offset.  The meaning of this
 * value will depend on the current state of the parser.
 * 
 * An incomplete listing of the states:
 * 
 * CAMEL_MIME_PARSER_STATE_INITIAL, The start of the current message.
 * CAMEL_MIME_PARSER_STATE_HEADER, CAMEL_MIME_PARSER_STATE_MESSAGE, CAMEL_MIME_PARSER_STATE_MULTIPART, the character
 * position immediately after the end of the header.
 * CAMEL_MIME_PARSER_STATE_BODY, Position within the message of the start
 * of the current data block.
 * CAMEL_MIME_PARSER_STATE_*_END, The position of the character starting
 * the next section of the scan (the last position + 1 of
 * the respective current state).
 *
 * @return See above.
 */
- (goffset)tell;

/**
 * When parsing a multipart, this returns the start of the last
 * boundary.
 *
 * @return The start of the boundary, or -1 if there
 * was no boundary encountered yet.
 */
- (goffset)tellStartBoundary;

/**
 * If the parser is scanning From lines, then this returns
 * the position of the start of the From line.
 *
 * @return The start of the from line, or -1 if there
 * was no From line, or From lines are not being scanned.
 */
- (goffset)tellStartFrom;

/**
 * Find out the position within the file of where the
 * headers started, this is cached by the parser
 * at the time.
 *
 * @return The header start position, or -1 if
 * no headers were scanned in the current state.
 */
- (goffset)tellStartHeaders;

/**
 * Cause the last step operation to repeat itself.  If this is
 * called repeated times, then the same step will be repeated
 * that many times.
 * 
 * Note that it is not possible to scan back using this function,
 * only to have a way of peeking the next state.
 *
 */
- (void)unstep;

@end