/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterFrom.h"

@implementation OGCamelMimeFilterFrom

- (instancetype)init
{
	CamelMimeFilterFrom* gobjectValue = CAMEL_MIME_FILTER_FROM(camel_mime_filter_from_new());

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

- (CamelMimeFilterFrom*)castedGObject
{
	return CAMEL_MIME_FILTER_FROM([self gObject]);
}


@end