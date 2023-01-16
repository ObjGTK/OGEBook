/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@class OGCamelIndexName;
@class OGCamelIndex;

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

- (CamelMimeFilterIndex*)MIMEFILTERINDEX;

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