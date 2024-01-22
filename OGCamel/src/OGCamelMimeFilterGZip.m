/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterGZip.h"

@implementation OGCamelMimeFilterGZip

- (instancetype)initWithMode:(CamelMimeFilterGZipMode)mode level:(gint)level
{
	CamelMimeFilterGZip* gobjectValue = CAMEL_MIME_FILTER_GZIP(camel_mime_filter_gzip_new(mode, level));

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

- (CamelMimeFilterGZip*)castedGObject
{
	return CAMEL_MIME_FILTER_GZIP([self gObject]);
}


@end