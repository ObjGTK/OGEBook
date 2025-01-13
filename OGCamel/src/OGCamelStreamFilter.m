/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamFilter.h"

#import "OGCamelMimeFilter.h"

@implementation OGCamelStreamFilter

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_STREAM_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)streamFilterWithSource:(OGCamelStream*)source
{
	CamelStreamFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_filter_new([source castedGObject]), CamelStreamFilter, CamelStreamFilter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelStreamFilter* wrapperObject;
	@try {
		wrapperObject = [[OGCamelStreamFilter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelStreamFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStreamFilter, CamelStreamFilter);
}

- (gint)addWithFilter:(OGCamelMimeFilter*)filter
{
	gint returnValue = (gint)camel_stream_filter_add([self castedGObject], [filter castedGObject]);

	return returnValue;
}

- (OGCamelStream*)source
{
	CamelStream* gobjectValue = camel_stream_filter_get_source([self castedGObject]);

	OGCamelStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)removeWithIdentifier:(gint)identifier
{
	camel_stream_filter_remove([self castedGObject], identifier);
}


@end