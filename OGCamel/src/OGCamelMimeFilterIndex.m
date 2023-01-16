/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterIndex.h"

#import "OGCamelIndexName.h"
#import "OGCamelIndex.h"

@implementation OGCamelMimeFilterIndex

- (instancetype)init:(OGCamelIndex*)index
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_index_new([index INDEX])];

	return self;
}

- (CamelMimeFilterIndex*)MIMEFILTERINDEX
{
	return CAMEL_MIME_FILTER_INDEX([self GOBJECT]);
}

- (void)setIndex:(OGCamelIndex*)index
{
	camel_mime_filter_index_set_index([self MIMEFILTERINDEX], [index INDEX]);
}

- (void)setName:(OGCamelIndexName*)name
{
	camel_mime_filter_index_set_name([self MIMEFILTERINDEX], [name INDEXNAME]);
}


@end