/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFilterInputStream.h"

#import "OGCamelMimeFilter.h"

@implementation OGCamelFilterInputStream

- (instancetype)initWithBaseStream:(GInputStream*)baseStream filter:(OGCamelMimeFilter*)filter
{
	self = [super initWithGObject:(GObject*)camel_filter_input_stream_new(baseStream, [filter MIMEFILTER])];

	return self;
}

- (CamelFilterInputStream*)FILTERINPUTSTREAM
{
	return CAMEL_FILTER_INPUT_STREAM([self GOBJECT]);
}

- (OGCamelMimeFilter*)filter
{
	return [[[OGCamelMimeFilter alloc] initWithGObject:(GObject*)camel_filter_input_stream_get_filter([self FILTERINPUTSTREAM])] autorelease];
}


@end