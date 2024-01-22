/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelMimeFilter : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelMimeFilter*)castedGObject;

/**
 * Saves @data to be used as prespace input data to the next call to
 * camel_mime_filter_filter() or camel_mime_filter_complete().
 * 
 * Note: New calls replace old data.
 *
 * @param data data buffer to backup
 * @param length length of @data
 */
- (void)backupWithData:(OFString*)data length:(gsize)length;

/**
 * Passes the input buffer, @in, through @filter and generates an
 * output buffer, @out and makes sure that all data is flushed to the
 * output buffer. This must be the last filtering call made, no
 * further calls to camel_mime_filter_filter() may be called on @filter
 * until @filter has been reset using camel_mime_filter_reset().
 *
 * @param in input buffer
 * @param len length of @in
 * @param prespace amount of prespace
 * @param out pointer to the output buffer (to be set)
 * @param outlen pointer to the length of the output buffer (to be set)
 * @param outprespace pointer to the output prespace length (to be set)
 */
- (void)completeWithIn:(OFString*)in len:(gsize)len prespace:(gsize)prespace out:(gchar**)out outlen:(gsize*)outlen outprespace:(gsize*)outprespace;

/**
 * Passes the input buffer, @in, through @filter and generates an
 * output buffer, @out.
 *
 * @param in input buffer
 * @param len length of @in
 * @param prespace amount of prespace
 * @param out pointer to the output buffer (to be set)
 * @param outlen pointer to the length of the output buffer (to be set)
 * @param outprespace pointer to the output prespace length (to be set)
 */
- (void)filterWithIn:(OFString*)in len:(gsize)len prespace:(gsize)prespace out:(gchar**)out outlen:(gsize*)outlen outprespace:(gsize*)outprespace;

/**
 * Resets the state on @filter so that it may be used again.
 *
 */
- (void)reset;

/**
 * Ensure that @filter has enough storage space to store @size bytes
 * for filter output.
 *
 * @param size requested amount of storage space
 * @param keep %TRUE to keep existing buffered data or %FALSE otherwise
 */
- (void)setSizeWithSize:(gsize)size keep:(gint)keep;

@end