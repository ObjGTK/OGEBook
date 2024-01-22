/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterToHTML.h"

@implementation OGCamelMimeFilterToHTML

- (instancetype)initWithFlags:(CamelMimeFilterToHTMLFlags)flags color:(guint32)color
{
	CamelMimeFilterToHTML* gobjectValue = CAMEL_MIME_FILTER_TOHTML(camel_mime_filter_tohtml_new(flags, color));

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

- (CamelMimeFilterToHTML*)castedGObject
{
	return CAMEL_MIME_FILTER_TOHTML([self gObject]);
}


@end