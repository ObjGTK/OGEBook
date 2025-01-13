/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStream.h"

@class OGCamelMimeFilter;

@interface OGCamelStreamFilter : OGCamelStream
{

}


/**
 * Constructors
 */
+ (instancetype)streamFilterWithSource:(OGCamelStream*)source;

/**
 * Methods
 */

- (CamelStreamFilter*)castedGObject;

/**
 * Add a new #CamelMimeFilter to execute during the processing of this
 * stream.  Each filter added is processed after the previous one.
 * 
 * Note that a filter should only be added to a single stream
 * at a time, otherwise unpredictable results may occur.
 *
 * @param filter a #CamelMimeFilter object
 * @return a filter id for the added @filter.
 */
- (gint)addWithFilter:(OGCamelMimeFilter*)filter;

/**
 *
 * @return
 */
- (OGCamelStream*)source;

/**
 * Remove a processing filter from the stream by id.
 *
 * @param identifier Filter id, as returned from camel_stream_filter_add()
 */
- (void)removeWithIdentifier:(gint)identifier;

@end