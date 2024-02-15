/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFilterOutputStream.h"

#import "OGCamelMimeFilter.h"
#import <OGio/OGOutputStream.h>

@implementation OGCamelFilterOutputStream

- (instancetype)initWithBaseStream:(OGOutputStream*)baseStream filter:(OGCamelMimeFilter*)filter
{
	CamelFilterOutputStream* gobjectValue = CAMEL_FILTER_OUTPUT_STREAM(camel_filter_output_stream_new([baseStream castedGObject], [filter castedGObject]));

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

- (CamelFilterOutputStream*)castedGObject
{
	return CAMEL_FILTER_OUTPUT_STREAM([self gObject]);
}

- (OGCamelMimeFilter*)filter
{
	CamelMimeFilter* gobjectValue = CAMEL_MIME_FILTER(camel_filter_output_stream_get_filter([self castedGObject]));

	OGCamelMimeFilter* returnValue = [OGCamelMimeFilter withGObject:gobjectValue];
	return returnValue;
}


@end