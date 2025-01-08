/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMultipartEncrypted.h"

@implementation OGCamelMultipartEncrypted

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MULTIPART_ENCRYPTED;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

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