/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMedium.h"

@class OGCancellable;
@class OGCamelMimeParser;

@interface OGCamelMimePart : OGCamelMedium
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelMimePart*)castedGObject;

/**
 * Constructs the contnet of @mime_part from the given mime parser.
 *
 * @param mp a #CamelMimeParser
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)constructContentFromParserWithMp:(OGCamelMimeParser*)mp cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously constructs a MIME part from a parser.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_mime_part_construct_from_parser_finish() to get the result of
 * the operation.
 *
 * @param parser a #CamelMimeParser
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)constructFromParserWithParser:(OGCamelMimeParser*)parser ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_mime_part_construct_from_parser().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)constructFromParserFinish:(GAsyncResult*)result;

/**
 * Constructs a MIME part from a parser.
 *
 * @param parser a #CamelMimeParser
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)constructFromParserSyncWithParser:(OGCamelMimeParser*)parser cancellable:(OGCancellable*)cancellable;

/**
 * Generates preview of the @mime_part, to be used in the interface,
 * read by the users.
 * 
 * The optional @func can be used to override default preview generation
 * function. If provided, it's always called as the first try on the parts.
 *
 * @param func an optional #CamelGeneratePreviewFunc function, or %NULL
 * @param userData user data for the @func, or %NULL
 * @return part's preview as a new string,
 *    or %NULL, when cannot be generated. Free with g_free(), when no
 *    longer needed.
 */
- (OFString*)generatePreviewWithFunc:(CamelGeneratePreviewFunc)func userData:(gpointer)userData;

/**
 * Get the disposition of the MIME part as a structure.
 * Returned pointer is owned by @mime_part.
 *
 * @return the disposition structure
 */
- (const CamelContentDisposition*)contentDisposition;

/**
 * Get the content-id field of a MIME part.
 *
 * @return the content-id field of the MIME part
 */
- (OFString*)contentId;

/**
 * Get the Content-Languages set on the MIME part.
 *
 * @return a #GList of languages
 */
- (const GList*)contentLanguages;

/**
 * Get the content-location field of a MIME part.
 *
 * @return the content-location field of a MIME part
 */
- (OFString*)contentLocation;

/**
 * Get the content-md5 field of the MIME part.
 *
 * @return the content-md5 field of the MIME part
 */
- (OFString*)contentMd5;

/**
 * Get the Content-Type of a MIME part.
 *
 * @return the parsed #CamelContentType of the MIME part
 */
- (CamelContentType*)contentType;

/**
 * Get the description of the MIME part.
 *
 * @return the description
 */
- (OFString*)description;

/**
 * Get the disposition of the MIME part.
 *
 * @return the disposition
 */
- (OFString*)disposition;

/**
 * Get the Content-Transfer-Encoding of a MIME part.
 *
 * @return a #CamelTransferEncoding
 */
- (CamelTransferEncoding)encoding;

/**
 * Get the filename of a MIME part.
 *
 * @return the filename of the MIME part
 */
- (OFString*)filename;

/**
 * Utility function used to set the content of a mime part object to
 * be the provided data. If @length is 0, this routine can be used as
 * a way to remove old content (in which case @data and @type are
 * ignored and may be %NULL).
 *
 * @param data data to put into the part
 * @param length length of @data
 * @param type Content-Type of the data
 */
- (void)setContentWithData:(OFString*)data length:(gint)length type:(OFString*)type;

/**
 * Set the content-id field on a MIME part.
 *
 * @param contentid content id
 */
- (void)setContentId:(OFString*)contentid;

/**
 * Set the Content-Languages field of a MIME part.
 *
 * @param contentLanguages list of languages
 */
- (void)setContentLanguages:(GList*)contentLanguages;

/**
 * Set the content-location field of the MIME part.
 *
 * @param location the content-location value of the MIME part
 */
- (void)setContentLocation:(OFString*)location;

/**
 * Set the content-md5 field of the MIME part.
 *
 * @param md5sum the md5sum of the MIME part
 */
- (void)setContentMd5:(OFString*)md5sum;

/**
 * Set the content-type on a MIME part.
 *
 * @param contentType content-type string
 */
- (void)setContentType:(OFString*)contentType;

/**
 * Set a description on the MIME part.
 *
 * @param description description of the MIME part
 */
- (void)setDescription:(OFString*)description;

/**
 * Set a disposition on the MIME part.
 *
 * @param disposition disposition of the MIME part
 */
- (void)setDisposition:(OFString*)disposition;

/**
 * Set the Content-Transfer-Encoding to use on a MIME part.
 *
 * @param encoding a #CamelTransferEncoding
 */
- (void)setEncoding:(CamelTransferEncoding)encoding;

/**
 * Set the filename on a MIME part.
 *
 * @param filename filename given to the MIME part
 */
- (void)setFilename:(OFString*)filename;

@end