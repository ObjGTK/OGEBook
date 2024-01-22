/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelMimeFilter;
@class OGOutputStream;

@interface OGCamelFilterOutputStream : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithBaseStream:(OGOutputStream*)baseStream filter:(OGCamelMimeFilter*)filter;

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