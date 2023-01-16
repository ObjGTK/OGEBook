/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStream.h"

@implementation OGCamelStream

- (instancetype)init:(GIOStream*)baseStream
{
	self = [super initWithGObject:(GObject*)camel_stream_new(baseStream)];

	return self;
}

- (CamelStream*)STREAM
{
	return CAMEL_STREAM([self GOBJECT]);
}

- (gint)closeWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_stream_close([self STREAM], cancellable, err);
}

- (bool)eos
{
	return camel_stream_eos([self STREAM]);
}

- (gint)flushWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_stream_flush([self STREAM], cancellable, err);
}

- (gssize)readWithBuffer:(OFString*)buffer n:(gsize)n cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_stream_read([self STREAM], (gchar*) [buffer UTF8String], n, cancellable, err);
}

- (GIOStream*)refBaseStream
{
	return camel_stream_ref_base_stream([self STREAM]);
}

- (void)setBaseStream:(GIOStream*)baseStream
{
	camel_stream_set_base_stream([self STREAM], baseStream);
}

- (gssize)writeWithBuffer:(OFString*)buffer n:(gsize)n cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_stream_write([self STREAM], [buffer UTF8String], n, cancellable, err);
}

- (gssize)writeStringWithString:(OFString*)string cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_stream_write_string([self STREAM], [string UTF8String], cancellable, err);
}

- (gssize)writeToStreamWithOutputStream:(OGCamelStream*)outputStream cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_stream_write_to_stream([self STREAM], [outputStream STREAM], cancellable, err);
}


@end