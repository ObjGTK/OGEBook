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
	CamelFilterInputStream* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_filter_input_stream_new([baseStream castedGObject], [filter castedGObject]), CamelFilterInputStream, CamelFilterInputStream);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelFilterInputStream, CamelFilterInputStream);
}

- (OGCamelMimeFilter*)filter
{
	CamelMimeFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_filter_input_stream_get_filter([self castedGObject]), CamelMimeFilter, CamelMimeFilter);

	OGCamelMimeFilter* returnValue = [OGCamelMimeFilter withGObject:gobjectValue];
	return returnValue;
}


@end