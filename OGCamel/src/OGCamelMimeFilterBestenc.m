/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterBestenc.h"

@implementation OGCamelMimeFilterBestenc

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_BESTENC;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)mimeFilterBestencWithFlags:(guint)flags
{
	CamelMimeFilterBestenc* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_bestenc_new(flags), CamelMimeFilterBestenc, CamelMimeFilterBestenc);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMimeFilterBestenc* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMimeFilterBestenc alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMimeFilterBestenc*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterBestenc, CamelMimeFilterBestenc);
}

- (OFString*)bestCharset
{
	const gchar* gobjectValue = camel_mime_filter_bestenc_get_best_charset([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (CamelTransferEncoding)bestEncodingWithRequired:(CamelBestencEncoding)required
{
	CamelTransferEncoding returnValue = (CamelTransferEncoding)camel_mime_filter_bestenc_get_best_encoding([self castedGObject], required);

	return returnValue;
}

- (void)setFlags:(guint)flags
{
	camel_mime_filter_bestenc_set_flags([self castedGObject], flags);
}


@end