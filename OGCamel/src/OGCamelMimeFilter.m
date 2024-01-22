/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@implementation OGCamelMimeFilter

- (instancetype)init
{
	CamelMimeFilter* gobjectValue = CAMEL_MIME_FILTER(camel_mime_filter_new());

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

- (CamelMimeFilter*)castedGObject
{
	return CAMEL_MIME_FILTER([self gObject]);
}

- (void)backupWithData:(OFString*)data length:(gsize)length
{
	camel_mime_filter_backup([self castedGObject], [data UTF8String], length);
}

- (void)completeWithIn:(OFString*)in len:(gsize)len prespace:(gsize)prespace out:(gchar**)out outlen:(gsize*)outlen outprespace:(gsize*)outprespace
{
	camel_mime_filter_complete([self castedGObject], [in UTF8String], len, prespace, out, outlen, outprespace);
}

- (void)filterWithIn:(OFString*)in len:(gsize)len prespace:(gsize)prespace out:(gchar**)out outlen:(gsize*)outlen outprespace:(gsize*)outprespace
{
	camel_mime_filter_filter([self castedGObject], [in UTF8String], len, prespace, out, outlen, outprespace);
}

- (void)reset
{
	camel_mime_filter_reset([self castedGObject]);
}

- (void)setSizeWithSize:(gsize)size keep:(gint)keep
{
	camel_mime_filter_set_size([self castedGObject], size, keep);
}


@end