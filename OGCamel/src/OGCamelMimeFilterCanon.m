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

+ (instancetype)mimeFilterCanon:(guint32)flags
{
	CamelMimeFilterCanon* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_canon_new(flags), CamelMimeFilterCanon, CamelMimeFilterCanon);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMimeFilterCanon* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMimeFilterCanon alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMimeFilterCanon*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterCanon, CamelMimeFilterCanon);
}


@end