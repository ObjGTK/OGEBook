/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFilterOutputStream.h"

#import "OGCamelMimeFilter.h"

@implementation OGCamelFilterOutputStream

- (instancetype)initWithBaseStream:(GOutputStream*)baseStream filter:(OGCamelMimeFilter*)filter
{
	self = [super initWithGObject:(GObject*)camel_filter_output_stream_new(baseStream, [filter MIMEFILTER])];

	return self;
}

- (CamelFilterOutputStream*)FILTEROUTPUTSTREAM
{
	return CAMEL_FILTER_OUTPUT_STREAM([self GOBJECT]);
}

- (OGCamelMimeFilter*)filter
{
	return [[[OGCamelMimeFilter alloc] initWithGObject:(GObject*)camel_filter_output_stream_get_filter([self FILTEROUTPUTSTREAM])] autorelease];
}


@end