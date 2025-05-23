/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterCharset.h"

@implementation OGCamelMimeFilterCharset

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_CHARSET;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)mimeFilterCharsetWithFromCharset:(OFString*)fromCharset toCharset:(OFString*)toCharset
{
	CamelMimeFilterCharset* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_charset_new([fromCharset UTF8String], [toCharset UTF8String]), CamelMimeFilterCharset, CamelMimeFilterCharset);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMimeFilterCharset* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMimeFilterCharset alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMimeFilterCharset*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterCharset, CamelMimeFilterCharset);
}


@end