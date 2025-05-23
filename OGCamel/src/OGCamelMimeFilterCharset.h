/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@interface OGCamelMimeFilterCharset : OGCamelMimeFilter
{

}


/**
 * Constructors
 */
+ (instancetype)mimeFilterCharsetWithFromCharset:(OFString*)fromCharset toCharset:(OFString*)toCharset;

/**
 * Methods
 */

- (CamelMimeFilterCharset*)castedGObject;

@end