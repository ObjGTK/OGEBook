/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGio/OGFilterOutputStream.h>

@class OGCamelMimeFilter;
@class OGOutputStream;

@interface OGCamelFilterOutputStream : OGFilterOutputStream
{

}


/**
 * Constructors
 */
+ (instancetype)filterOutputStreamWithBaseStream:(OGOutputStream*)baseStream filter:(OGCamelMimeFilter*)filter;

/**
 * Methods
 */

- (CamelFilterOutputStream*)castedGObject;

/**
 * Gets the #CamelMimeFilter that is used by @filter_stream.
 *
 * @return a #CamelMimeFilter
 */
- (OGCamelMimeFilter*)filter;

@end