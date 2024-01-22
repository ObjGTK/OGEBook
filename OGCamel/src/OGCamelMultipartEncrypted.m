/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMultipartEncrypted.h"

@implementation OGCamelMultipartEncrypted

- (instancetype)init
{
	CamelMultipartEncrypted* gobjectValue = CAMEL_MULTIPART_ENCRYPTED(camel_multipart_encrypted_new());

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

- (CamelMultipartEncrypted*)castedGObject
{
	return CAMEL_MULTIPART_ENCRYPTED([self gObject]);
}


@end