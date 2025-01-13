/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@interface OGCamelMimeFilterYenc : OGCamelMimeFilter
{

}


/**
 * Constructors
 */
+ (instancetype)mimeFilterYencWithDirection:(CamelMimeFilterYencDirection)direction;

/**
 * Methods
 */

- (CamelMimeFilterYenc*)castedGObject;

/**
 * Get the computed crc or (#guint32) -1 on fail.
 *
 * @return the computed crc or (#guint32) -1 on fail.
 */
- (guint32)crc;

/**
 * Get the computed part crc or (#guint32) -1 on fail.
 *
 * @return the computed part crc or (#guint32) -1 on fail.
 */
- (guint32)pcrc;

/**
 * Sets the current crc32 value on the yEnc filter @yenc to @crc.
 *
 * @param crc crc32 value
 */
- (void)setCrc:(guint32)crc;

/**
 * Sets the current state of the yencoder/ydecoder
 *
 * @param state encode/decode state
 */
- (void)setState:(gint)state;

@end