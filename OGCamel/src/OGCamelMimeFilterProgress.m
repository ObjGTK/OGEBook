/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterProgress.h"

@implementation OGCamelMimeFilterProgress

- (instancetype)initWithCancellable:(GCancellable*)cancellable total:(gsize)total
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_progress_new(cancellable, total)];

	return self;
}

- (CamelMimeFilterProgress*)MIMEFILTERPROGRESS
{
	return CAMEL_MIME_FILTER_PROGRESS([self GOBJECT]);
}


@end