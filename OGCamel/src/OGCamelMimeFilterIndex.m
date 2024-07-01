/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterIndex.h"

#import "OGCamelIndexName.h"
#import "OGCamelIndex.h"

@implementation OGCamelMimeFilterIndex

- (instancetype)init:(OGCamelIndex*)index
{
	CamelMimeFilterIndex* gobjectValue = CAMEL_MIME_FILTER_INDEX(camel_mime_filter_index_new([index castedGObject]));

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

- (CamelMimeFilterIndex*)castedGObject
{
	return CAMEL_MIME_FILTER_INDEX([self gObject]);
}

- (void)setIndex:(OGCamelIndex*)index
{
	camel_mime_filter_index_set_index([self castedGObject], [index castedGObject]);
}

- (void)setName:(OGCamelIndexName*)name
{
	camel_mime_filter_index_set_name([self castedGObject], [name castedGObject]);
}


@end