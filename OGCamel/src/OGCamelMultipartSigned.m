/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMultipartSigned.h"

#import "OGCamelMimePart.h"
#import "OGCamelStream.h"

@implementation OGCamelMultipartSigned

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_multipart_signed_new()];

	return self;
}

- (CamelMultipartSigned*)MULTIPARTSIGNED
{
	return CAMEL_MULTIPART_SIGNED([self GOBJECT]);
}

- (OGCamelStream*)contentStream:(GError**)err
{
	return [[[OGCamelStream alloc] initWithGObject:(GObject*)camel_multipart_signed_get_content_stream([self MULTIPARTSIGNED], err)] autorelease];
}

- (void)setContentStream:(OGCamelStream*)contentStream
{
	camel_multipart_signed_set_content_stream([self MULTIPARTSIGNED], [contentStream STREAM]);
}

- (void)setSignature:(OGCamelMimePart*)signature
{
	camel_multipart_signed_set_signature([self MULTIPARTSIGNED], [signature MIMEPART]);
}


@end