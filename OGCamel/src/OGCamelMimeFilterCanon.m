/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterCanon.h"

@implementation OGCamelMimeFilterCanon

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_CANON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithFlags:(guint32)flags
{
	CamelMimeFilterCanon* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_canon_new(flags), CamelMimeFilterCanon, CamelMimeFilterCanon);

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

- (CamelMimeFilterCanon*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterCanon, CamelMimeFilterCanon);
}


@end