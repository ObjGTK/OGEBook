/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@class OGCamelIndex;
@class OGCamelIndexName;

@interface OGCamelMimeFilterIndex : OGCamelMimeFilter
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGCamelIndex*)index;

/**
 * Methods
 */

- (CamelMimeFilterIndex*)castedGObject;

/**
 * Set @index on @filter.
 *
 * @param index a #CamelIndex object
 */
- (void)setIndex:(OGCamelIndex*)index;

/**
 * Set the match name for any indexed words.
 *
 * @param name a #CamelIndexName object
 */
- (void)setName:(OGCamelIndexName*)name;

@end