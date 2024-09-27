/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterCharset.h"

@implementation OGCamelMimeFilterCharset

- (instancetype)initWithFromCharset:(OFString*)fromCharset toCharset:(OFString*)toCharset
{
	CamelMimeFilterCharset* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_charset_new([fromCharset UTF8String], [toCharset UTF8String]), CamelMimeFilterCharset, CamelMimeFilterCharset);

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

- (CamelMimeFilterCharset*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterCharset, CamelMimeFilterCharset);
}


@end