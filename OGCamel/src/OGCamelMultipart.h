/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelDataWrapper.h"

@class OGCamelMimePart;
@class OGCamelMimeParser;

@interface OGCamelMultipart : OGCamelDataWrapper
{

}


/**
 * Constructors
 */
- (instancetype)init;

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
- (OGCamelMimePart*)part:(guint)index;

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