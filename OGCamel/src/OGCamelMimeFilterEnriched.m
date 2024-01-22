/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterEnriched.h"

@implementation OGCamelMimeFilterEnriched

- (instancetype)init:(guint32)flags
{
	CamelMimeFilterEnriched* gobjectValue = CAMEL_MIME_FILTER_ENRICHED(camel_mime_filter_enriched_new(flags));

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

- (CamelMimeFilterEnriched*)castedGObject
{
	return CAMEL_MIME_FILTER_ENRICHED([self gObject]);
}


@end