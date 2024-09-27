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
	CamelStreamFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_filter_new([source castedGObject]), CamelStreamFilter, CamelStreamFilter);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStreamFilter, CamelStreamFilter);
}

- (gint)add:(OGCamelMimeFilter*)filter
{
	gint returnValue = camel_stream_filter_add([self castedGObject], [filter castedGObject]);

	return returnValue;
}

- (OGCamelStream*)source
{
	CamelStream* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_filter_get_source([self castedGObject]), CamelStream, CamelStream);

	OGCamelStream* returnValue = [OGCamelStream withGObject:gobjectValue];
	return returnValue;
}

- (void)remove:(gint)id
{
	camel_stream_filter_remove([self castedGObject], id);
}


@end