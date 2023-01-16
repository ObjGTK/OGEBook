/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMultipartEncrypted.h"

@implementation OGCamelMultipartEncrypted

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_multipart_encrypted_new()];

	return self;
}

- (CamelMultipartEncrypted*)MULTIPARTENCRYPTED
{
	return CAMEL_MULTIPART_ENCRYPTED([self GOBJECT]);
}


@end