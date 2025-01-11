/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterToHTML.h"

@implementation OGCamelMimeFilterToHTML

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_TOHTML;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)mimeFilterToHTMLWithFlags:(CamelMimeFilterToHTMLFlags)flags color:(guint32)color
{
	CamelMimeFilterToHTML* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_tohtml_new(flags, color), CamelMimeFilterToHTML, CamelMimeFilterToHTML);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMimeFilterToHTML* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMimeFilterToHTML alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMimeFilterToHTML*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterToHTML, CamelMimeFilterToHTML);
}


@end