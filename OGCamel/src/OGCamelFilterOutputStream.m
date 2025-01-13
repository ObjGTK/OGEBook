/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFilterOutputStream.h"

#import "OGCamelMimeFilter.h"
#import <OGio/OGOutputStream.h>

@implementation OGCamelFilterOutputStream

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_FILTER_OUTPUT_STREAM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)filterOutputStreamWithBaseStream:(OGOutputStream*)baseStream filter:(OGCamelMimeFilter*)filter
{
	CamelFilterOutputStream* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_filter_output_stream_new([baseStream castedGObject], [filter castedGObject]), CamelFilterOutputStream, CamelFilterOutputStream);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelFilterOutputStream* wrapperObject;
	@try {
		wrapperObject = [[OGCamelFilterOutputStream alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelFilterOutputStream*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelFilterOutputStream, CamelFilterOutputStream);
}

- (OGCamelMimeFilter*)filter
{
	CamelMimeFilter* gobjectValue = camel_filter_output_stream_get_filter([self castedGObject]);

	OGCamelMimeFilter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end