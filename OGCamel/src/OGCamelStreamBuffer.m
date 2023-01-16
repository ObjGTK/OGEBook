/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamBuffer.h"

@implementation OGCamelStreamBuffer

- (instancetype)initWithStream:(OGCamelStream*)stream mode:(CamelStreamBufferMode)mode
{
	self = [super initWithGObject:(GObject*)camel_stream_buffer_new([stream STREAM], mode)];

	return self;
}

- (CamelStreamBuffer*)STREAMBUFFER
{
	return CAMEL_STREAM_BUFFER([self GOBJECT]);
}

- (void)discardCache
{
	camel_stream_buffer_discard_cache([self STREAMBUFFER]);
}

- (gint)sWithBuf:(OFString*)buf max:(guint)max cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_stream_buffer_gets([self STREAMBUFFER], (gchar*) [buf UTF8String], max, cancellable, err);
}

- (OFString*)readLineWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return [OFString stringWithUTF8String:camel_stream_buffer_read_line([self STREAMBUFFER], cancellable, err)];
}


@end