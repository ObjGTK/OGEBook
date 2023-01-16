/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelNNTPAddress.h"

@implementation OGCamelNNTPAddress

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_nntp_address_new()];

	return self;
}

- (CamelNNTPAddress*)NNTPADDRESS
{
	return CAMEL_NNTP_ADDRESS([self GOBJECT]);
}

- (gint)add:(OFString*)name
{
	return camel_nntp_address_add([self NNTPADDRESS], [name UTF8String]);
}

- (bool)instanceWithIndex:(gint)index namep:(const gchar**)namep
{
	return camel_nntp_address_get([self NNTPADDRESS], index, namep);
}


@end