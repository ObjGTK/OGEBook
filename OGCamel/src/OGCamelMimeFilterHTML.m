/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterHTML.h"

@implementation OGCamelMimeFilterHTML

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_HTML;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)mimeFilterHTML
{
	CamelMimeFilterHTML* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_html_new(), CamelMimeFilterHTML, CamelMimeFilterHTML);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMimeFilterHTML* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMimeFilterHTML alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMimeFilterHTML*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterHTML, CamelMimeFilterHTML);
}


@end