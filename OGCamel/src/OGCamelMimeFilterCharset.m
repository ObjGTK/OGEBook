/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterCharset.h"

@implementation OGCamelMimeFilterCharset

- (instancetype)initWithFromCharset:(OFString*)fromCharset toCharset:(OFString*)toCharset
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_charset_new([fromCharset UTF8String], [toCharset UTF8String])];

	return self;
}

- (CamelMimeFilterCharset*)MIMEFILTERCHARSET
{
	return CAMEL_MIME_FILTER_CHARSET([self GOBJECT]);
}


@end