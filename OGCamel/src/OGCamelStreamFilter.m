/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamFilter.h"

#import "OGCamelMimeFilter.h"

@implementation OGCamelStreamFilter

- (instancetype)init:(OGCamelStream*)source
{
	self = [super initWithGObject:(GObject*)camel_stream_filter_new([source STREAM])];

	return self;
}

- (CamelStreamFilter*)STREAMFILTER
{
	return CAMEL_STREAM_FILTER([self GOBJECT]);
}

- (gint)add:(OGCamelMimeFilter*)filter
{
	return camel_stream_filter_add([self STREAMFILTER], [filter MIMEFILTER]);
}

- (OGCamelStream*)source
{
	return [[[OGCamelStream alloc] initWithGObject:(GObject*)camel_stream_filter_get_source([self STREAMFILTER])] autorelease];
}

- (void)remove:(gint)id
{
	camel_stream_filter_remove([self STREAMFILTER], id);
}


@end