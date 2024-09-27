/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFilterOutputStream.h"

#import <OGio/OGOutputStream.h>
#import "OGCamelMimeFilter.h"

@implementation OGCamelFilterOutputStream

- (instancetype)initWithBaseStream:(OGOutputStream*)baseStream filter:(OGCamelMimeFilter*)filter
{
	CamelFilterOutputStream* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_filter_output_stream_new([baseStream castedGObject], [filter castedGObject]), CamelFilterOutputStream, CamelFilterOutputStream);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelFilterOutputStream, CamelFilterOutputStream);
}

- (OGCamelMimeFilter*)filter
{
	CamelMimeFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_filter_output_stream_get_filter([self castedGObject]), CamelMimeFilter, CamelMimeFilter);

	OGCamelMimeFilter* returnValue = [OGCamelMimeFilter withGObject:gobjectValue];
	return returnValue;
}


@end