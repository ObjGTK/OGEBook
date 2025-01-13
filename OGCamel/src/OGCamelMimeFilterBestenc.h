/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@interface OGCamelMimeFilterBestenc : OGCamelMimeFilter
{

}


/**
 * Constructors
 */
+ (instancetype)mimeFilterBestencWithFlags:(guint)flags;

/**
 * Methods
 */

- (CamelMimeFilterBestenc*)castedGObject;

/**
 * Gets the best charset that can be used to contain this content.
 *
 * @return the name of the best charset to use to encode the input
 * text filtered by @filter
 */
- (OFString*)bestCharset;

/**
 * Get the best encoding, given specific constraints, that can be used to
 * encode a stream of bytes.
 *
 * @param required maximum level of output encoding allowed.
 * @return the best encoding to use
 */
- (CamelTransferEncoding)bestEncodingWithRequired:(CamelBestencEncoding)required;

/**
 * Set the flags for subsequent operations.
 *
 * @param flags bestenc filter flags
 */
- (void)setFlags:(guint)flags;

@end