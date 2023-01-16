/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterGZip.h"

@implementation OGCamelMimeFilterGZip

- (instancetype)initWithMode:(CamelMimeFilterGZipMode)mode level:(gint)level
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_gzip_new(mode, level)];

	return self;
}

- (CamelMimeFilterGZip*)MIMEFILTERGZIP
{
	return CAMEL_MIME_FILTER_GZIP([self GOBJECT]);
}


@end