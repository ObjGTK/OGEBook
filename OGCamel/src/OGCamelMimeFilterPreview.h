/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@interface OGCamelMimeFilterPreview : OGCamelMimeFilter
{

}


/**
 * Constructors
 */
+ (instancetype)mimeFilterPreview:(guint)limit;

/**
 * Methods
 */

- (CamelMimeFilterPreview*)castedGObject;

/**
 * Returns set limit for the text length, in characters.
 * Zero means unlimited length.
 *
 * @return limit for the text length, in characters
 */
- (guint)limit;

/**
 * Returns read text until now.
 *
 * @return read text until now or %NULL, when nothing was read
 */
- (OFString*)text;

/**
 * Sets limit for the text length, in characters. Zero
 * means unlimited length.
 *
 * @param limit a limit to set
 */
- (void)setLimit:(guint)limit;

@end