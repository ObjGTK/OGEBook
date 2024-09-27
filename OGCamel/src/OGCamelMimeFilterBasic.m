/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterBasic.h"

@implementation OGCamelMimeFilterBasic

- (instancetype)init:(CamelMimeFilterBasicType)type
{
	CamelMimeFilterBasic* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_basic_new(type), CamelMimeFilterBasic, CamelMimeFilterBasic);

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

- (CamelMimeFilterBasic*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterBasic, CamelMimeFilterBasic);
}


@end