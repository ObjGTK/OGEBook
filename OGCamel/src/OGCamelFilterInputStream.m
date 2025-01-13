/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFilterInputStream.h"

#import "OGCamelMimeFilter.h"
#import <OGio/OGInputStream.h>

@implementation OGCamelFilterInputStream

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_FILTER_INPUT_STREAM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)filterInputStreamWithBaseStream:(OGInputStream*)baseStream filter:(OGCamelMimeFilter*)filter
{
	CamelFilterInputStream* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_filter_input_stream_new([baseStream castedGObject], [filter castedGObject]), CamelFilterInputStream, CamelFilterInputStream);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelFilterInputStream* wrapperObject;
	@try {
		wrapperObject = [[OGCamelFilterInputStream alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelFilterInputStream*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelFilterInputStream, CamelFilterInputStream);
}

- (OGCamelMimeFilter*)filter
{
	CamelMimeFilter* gobjectValue = camel_filter_input_stream_get_filter([self castedGObject]);

	OGCamelMimeFilter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end