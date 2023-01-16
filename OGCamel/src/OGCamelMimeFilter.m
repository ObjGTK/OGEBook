/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@implementation OGCamelMimeFilter

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_new()];

	return self;
}

- (CamelMimeFilter*)MIMEFILTER
{
	return CAMEL_MIME_FILTER([self GOBJECT]);
}

- (void)backupWithData:(OFString*)data length:(gsize)length
{
	camel_mime_filter_backup([self MIMEFILTER], [data UTF8String], length);
}

- (void)completeWithIn:(OFString*)in len:(gsize)len prespace:(gsize)prespace out:(gchar**)out outlen:(gsize*)outlen outprespace:(gsize*)outprespace
{
	camel_mime_filter_complete([self MIMEFILTER], [in UTF8String], len, prespace, out, outlen, outprespace);
}

- (void)filterWithIn:(OFString*)in len:(gsize)len prespace:(gsize)prespace out:(gchar**)out outlen:(gsize*)outlen outprespace:(gsize*)outprespace
{
	camel_mime_filter_filter([self MIMEFILTER], [in UTF8String], len, prespace, out, outlen, outprespace);
}

- (void)reset
{
	camel_mime_filter_reset([self MIMEFILTER]);
}

- (void)setSizeWithSize:(gsize)size keep:(gint)keep
{
	camel_mime_filter_set_size([self MIMEFILTER], size, keep);
}


@end