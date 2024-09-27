/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMultipartEncrypted.h"

@implementation OGCamelMultipartEncrypted

- (instancetype)init
{
	CamelMultipartEncrypted* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_multipart_encrypted_new(), CamelMultipartEncrypted, CamelMultipartEncrypted);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMultipartEncrypted, CamelMultipartEncrypted);
}


@end