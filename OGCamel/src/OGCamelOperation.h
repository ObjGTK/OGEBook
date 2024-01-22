/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCancellable;

@interface OGCamelOperation : OGObject
{

}

/**
 * Functions
 */

/**
 * Cancel all outstanding operations.
 *
 */
+ (void)cancelAll;

/**
 * Pops the most recently pushed message.
 * 
 * This function only works if @cancellable is a #CamelOperation cast as a
 * #GCancellable.  If @cancellable is a plain #GCancellable or %NULL, the
 * function does nothing and returns silently.
 *
 * @param cancellable a #GCancellable
 */
+ (void)popMessage:(OGCancellable*)cancellable;

/**
 * Report progress on the current operation.  @percent reports the current
 * percentage of completion, which should be in the range of 0 to 100.
 * 
 * This function only works if @cancellable is a #CamelOperation cast as a
 * #GCancellable.  If @cancellable is a plain #GCancellable or %NULL, the
 * function does nothing and returns silently.
 *
 * @param cancellable a #GCancellable or %NULL
 * @param percent percent complete, 0 to 100.
 */
+ (void)progressWithCancellable:(OGCancellable*)cancellable percent:(gint)percent;

/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initProxy:(OGCancellable*)cancellable;

/**
 * Methods
 */

- (CamelOperation*)castedGObject;

@end