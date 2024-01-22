/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamFilter.h"

#import "OGCamelMimeFilter.h"

@implementation OGCamelStreamFilter

- (instancetype)init:(OGCamelStream*)source
{
	CamelStreamFilter* gobjectValue = CAMEL_STREAM_FILTER(camel_stream_filter_new([source castedGObject]));

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

- (CamelStreamFilter*)castedGObject
{
	return CAMEL_STREAM_FILTER([self gObject]);
}

- (gint)add:(OGCamelMimeFilter*)filter
{
	gint returnValue = camel_stream_filter_add([self castedGObject], [filter castedGObject]);

	return returnValue;
}

- (OGCamelStream*)source
{
	CamelStream* gobjectValue = CAMEL_STREAM(camel_stream_filter_get_source([self castedGObject]));

	OGCamelStream* returnValue = [OGCamelStream wrapperFor:gobjectValue];
	return returnValue;
}

- (void)remove:(gint)id
{
	camel_stream_filter_remove([self castedGObject], id);
}


@end