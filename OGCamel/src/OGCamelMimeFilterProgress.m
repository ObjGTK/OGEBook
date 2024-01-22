/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterProgress.h"

#import <OGio/OGCancellable.h>

@implementation OGCamelMimeFilterProgress

- (instancetype)initWithCancellable:(OGCancellable*)cancellable total:(gsize)total
{
	CamelMimeFilterProgress* gobjectValue = CAMEL_MIME_FILTER_PROGRESS(camel_mime_filter_progress_new([cancellable castedGObject], total));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (CamelMimeFilterProgress*)castedGObject
{
	return CAMEL_MIME_FILTER_PROGRESS([self gObject]);
}


@end