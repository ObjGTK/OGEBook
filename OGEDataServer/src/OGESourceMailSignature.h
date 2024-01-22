/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * function below.
 *
 */
@interface OGESourceMailSignature : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceMailSignature*)castedGObject;

/**
 * Thread-safe variation of e_source_mail_signature_get_mime_type().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailSignature:mime-type,
 *    or %NULL
 */
- (OFString*)dupMimeType;

/**
 * Returns a #GFile instance pointing to the signature file for @extension.
 * The signature file may be a regular file containing the static signature
 * content, or it may be a symbolic link to an executable file that produces
 * the signature content.
 * 
 * e_source_mail_signature_load() uses this to load the signature content.
 *
 * @return a #GFile
 */
- (GFile*)file;

/**
 * Returns the MIME type of the signature content for @extension, or %NULL
 * if it has not yet been determined.
 * 
 * e_source_mail_signature_load() sets this automatically if the MIME type
 * has not yet been determined.
 *
 * @return the MIME type of the signature content, or %NULL
 */
- (OFString*)mimeType;

/**
 * Sets the MIME type of the signature content for @extension.
 * 
 * e_source_mail_signature_load() sets this automatically if the MIME type
 * has not yet been determined.
 * 
 * The internal copy of @mime_type is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is
 * set instead.
 *
 * @param mimeType a MIME type, or %NULL
 */
- (void)setMimeType:(OFString*)mimeType;

@end