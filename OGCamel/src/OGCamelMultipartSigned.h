/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMultipart.h"

@class OGCamelMimePart;
@class OGCamelStream;

@interface OGCamelMultipartSigned : OGCamelMultipart
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelMultipartSigned*)castedGObject;

/**
 * Get the raw signed content stream of the multipart/signed MIME part
 * suitable for use with verification of the signature.
 *
 * @return the signed content stream
 */
- (OGCamelStream*)contentStream;

/**
 * Explicits sets the raw signed content stream of the multipart/signed
 * MIME part.
 *
 * @param contentStream a #CamelStream
 */
- (void)setContentStream:(OGCamelStream*)contentStream;

/**
 * Explicitly sets the signature part of @mps.
 *
 * @param signature a #CamelMimePart
 */
- (void)setSignature:(OGCamelMimePart*)signature;

@end