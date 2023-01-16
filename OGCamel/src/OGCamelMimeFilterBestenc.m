/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterBestenc.h"

@implementation OGCamelMimeFilterBestenc

- (instancetype)init:(guint)flags
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_bestenc_new(flags)];

	return self;
}

- (CamelMimeFilterBestenc*)MIMEFILTERBESTENC
{
	return CAMEL_MIME_FILTER_BESTENC([self GOBJECT]);
}

- (OFString*)bestCharset
{
	return [OFString stringWithUTF8String:camel_mime_filter_bestenc_get_best_charset([self MIMEFILTERBESTENC])];
}

- (CamelTransferEncoding)bestEncoding:(CamelBestencEncoding)required
{
	return camel_mime_filter_bestenc_get_best_encoding([self MIMEFILTERBESTENC], required);
}

- (void)setFlags:(guint)flags
{
	camel_mime_filter_bestenc_set_flags([self MIMEFILTERBESTENC], flags);
}


@end