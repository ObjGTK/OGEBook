/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGio/OGFilterInputStream.h>

@class OGInputStream;
@class OGCamelMimeFilter;

@interface OGCamelFilterInputStream : OGFilterInputStream
{

}


/**
 * Constructors
 */
- (instancetype)initWithBaseStream:(OGInputStream*)baseStream filter:(OGCamelMimeFilter*)filter;

/**
 * Methods
 */

- (CamelFilterInputStream*)castedGObject;

/**
 * Gets the #CamelMimeFilter that is used by @filter_stream.
 *
 * @return a #CamelMimeFilter
 */
- (OGCamelMimeFilter*)filter;

@end