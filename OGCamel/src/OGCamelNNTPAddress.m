/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelNNTPAddress.h"

@implementation OGCamelNNTPAddress

- (instancetype)init
{
	CamelNNTPAddress* gobjectValue = CAMEL_NNTP_ADDRESS(camel_nntp_address_new());

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

- (CamelNNTPAddress*)castedGObject
{
	return CAMEL_NNTP_ADDRESS([self gObject]);
}

- (gint)add:(OFString*)name
{
	gint returnValue = camel_nntp_address_add([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (bool)getWithIndex:(gint)index namep:(const gchar**)namep
{
	bool returnValue = camel_nntp_address_get([self castedGObject], index, namep);

	return returnValue;
}


@end