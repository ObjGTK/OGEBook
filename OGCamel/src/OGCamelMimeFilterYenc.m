/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterYenc.h"

@implementation OGCamelMimeFilterYenc

- (instancetype)init:(CamelMimeFilterYencDirection)direction
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_yenc_new(direction)];

	return self;
}

- (CamelMimeFilterYenc*)MIMEFILTERYENC
{
	return CAMEL_MIME_FILTER_YENC([self GOBJECT]);
}

- (guint32)crc
{
	return camel_mime_filter_yenc_get_crc([self MIMEFILTERYENC]);
}

- (guint32)pcrc
{
	return camel_mime_filter_yenc_get_pcrc([self MIMEFILTERYENC]);
}

- (void)setCrc:(guint32)crc
{
	camel_mime_filter_yenc_set_crc([self MIMEFILTERYENC], crc);
}

- (void)setState:(gint)state
{
	camel_mime_filter_yenc_set_state([self MIMEFILTERYENC], state);
}


@end