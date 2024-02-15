/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFilterInputStream.h"

#import <OGio/OGInputStream.h>
#import "OGCamelMimeFilter.h"

@implementation OGCamelFilterInputStream

- (instancetype)initWithBaseStream:(OGInputStream*)baseStream filter:(OGCamelMimeFilter*)filter
{
	CamelFilterInputStream* gobjectValue = CAMEL_FILTER_INPUT_STREAM(camel_filter_input_stream_new([baseStream castedGObject], [filter castedGObject]));

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

- (CamelFilterInputStream*)castedGObject
{
	return CAMEL_FILTER_INPUT_STREAM([self gObject]);
}

- (OGCamelMimeFilter*)filter
{
	CamelMimeFilter* gobjectValue = CAMEL_MIME_FILTER(camel_filter_input_stream_get_filter([self castedGObject]));

	OGCamelMimeFilter* returnValue = [OGCamelMimeFilter withGObject:gobjectValue];
	return returnValue;
}


@end