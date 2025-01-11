/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterEnriched.h"

@implementation OGCamelMimeFilterEnriched

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_ENRICHED;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)mimeFilterEnriched:(guint32)flags
{
	CamelMimeFilterEnriched* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_enriched_new(flags), CamelMimeFilterEnriched, CamelMimeFilterEnriched);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMimeFilterEnriched* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMimeFilterEnriched alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMimeFilterEnriched*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterEnriched, CamelMimeFilterEnriched);
}


@end