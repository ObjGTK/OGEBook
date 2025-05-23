/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@class OGCancellable;

@interface OGCamelMimeFilterProgress : OGCamelMimeFilter
{

}


/**
 * Constructors
 */
+ (instancetype)mimeFilterProgressWithCancellable:(OGCancellable*)cancellable total:(gsize)total;

/**
 * Methods
 */

- (CamelMimeFilterProgress*)castedGObject;

@end