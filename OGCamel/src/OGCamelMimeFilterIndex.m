/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterIndex.h"

#import "OGCamelIndex.h"
#import "OGCamelIndexName.h"

@implementation OGCamelMimeFilterIndex

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_INDEX;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithIndex:(OGCamelIndex*)index
{
	CamelMimeFilterIndex* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_index_new([index castedGObject]), CamelMimeFilterIndex, CamelMimeFilterIndex);

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

- (CamelMimeFilterIndex*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterIndex, CamelMimeFilterIndex);
}

- (void)setIndex:(OGCamelIndex*)index
{
	camel_mime_filter_index_set_index([self castedGObject], [index castedGObject]);
}

- (void)setName:(OGCamelIndexName*)name
{
	camel_mime_filter_index_set_name([self castedGObject], [name castedGObject]);
}


@end