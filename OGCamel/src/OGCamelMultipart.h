/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelDataWrapper.h"

@class OGCamelMimeParser;
@class OGCamelMimePart;

@interface OGCamelMultipart : OGCamelDataWrapper
{

}


/**
 * Constructors
 */
+ (instancetype)multipart;

/**
 * Methods
 */

- (CamelMultipart*)castedGObject;

/**
 * Appends the part to the multipart object.
 *
 * @param part a #CamelMimePart to add
 */
- (void)addPart:(OGCamelMimePart*)part;

/**
 * Construct a multipart from a parser.
 *
 * @param parser a #CamelMimeParser object
 * @return 0 on success or -1 on fail
 */
- (gint)constructFromParser:(OGCamelMimeParser*)parser;

/**
 * Generates preview of the @multipart, to be used in the interface,
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
 *
 * @return the boundary
 */
- (OFString*)boundary;

/**
 *
 * @return the number of subparts in @multipart
 */
- (guint)number;

/**
 *
 * @param index a zero-based index indicating the part to get
 * @return the indicated subpart, or %NULL
 */
- (OGCamelMimePart*)partWithIndex:(guint)index;

/**
 * Returns the postface text for @multipart.
 *
 * @return the postface text
 */
- (OFString*)postface;

/**
 * Returns the preface text for @multipart.
 *
 * @return the preface text
 */
- (OFString*)preface;

/**
 * Sets the message boundary for @multipart to @boundary. This should
 * be a string which does not occur anywhere in any of @multipart's
 * subparts. If @boundary is %NULL, a randomly-generated boundary will
 * be used.
 *
 * @param boundary the message boundary, or %NULL
 */
- (void)setBoundary:(OFString*)boundary;

/**
 * Set the postface text for this multipart.  Will be written out after
 * the last boundary of the multipart, and ignored by any MIME mail
 * client.
 * 
 * Generally postface texts should not be sent with multipart messages.
 *
 * @param postface multipat postface
 */
- (void)setPostface:(OFString*)postface;

/**
 * Set the preface text for this multipart.  Will be written out infront
 * of the multipart.  This text should only include US-ASCII strings, and
 * be relatively short, and will be ignored by any MIME mail client.
 *
 * @param preface the multipart preface
 */
- (void)setPreface:(OFString*)preface;

@end