/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterLinewrap.h"

@implementation OGCamelMimeFilterLinewrap

- (instancetype)initWithPreferredLen:(guint)preferredLen maxLen:(guint)maxLen indentChar:(gchar)indentChar flags:(guint32)flags
{
	CamelMimeFilterLinewrap* gobjectValue = CAMEL_MIME_FILTER_LINEWRAP(camel_mime_filter_linewrap_new(preferredLen, maxLen, indentChar, flags));

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

- (CamelMimeFilterLinewrap*)castedGObject
{
	return CAMEL_MIME_FILTER_LINEWRAP([self gObject]);
}


@end