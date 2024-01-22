/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterBestenc.h"

@implementation OGCamelMimeFilterBestenc

- (instancetype)init:(guint)flags
{
	CamelMimeFilterBestenc* gobjectValue = CAMEL_MIME_FILTER_BESTENC(camel_mime_filter_bestenc_new(flags));

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

- (CamelMimeFilterBestenc*)castedGObject
{
	return CAMEL_MIME_FILTER_BESTENC([self gObject]);
}

- (OFString*)bestCharset
{
	const gchar* gobjectValue = camel_mime_filter_bestenc_get_best_charset([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (CamelTransferEncoding)bestEncoding:(CamelBestencEncoding)required
{
	CamelTransferEncoding returnValue = camel_mime_filter_bestenc_get_best_encoding([self castedGObject], required);

	return returnValue;
}

- (void)setFlags:(guint)flags
{
	camel_mime_filter_bestenc_set_flags([self castedGObject], flags);
}


@end