/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelIndexName : OGObject
{

}


/**
 * Methods
 */

- (CamelIndexName*)INDEXNAME;

/**
 *
 * @param buffer
 * @param len
 * @return
 */
- (gsize)addBufferWithBuffer:(OFString*)buffer len:(gsize)len;

/**
 *
 * @param word
 */
- (void)addWord:(OFString*)word;

@end