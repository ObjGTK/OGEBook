/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelInternetAddress.h"

@implementation OGCamelInternetAddress

+ (OFString*)encodeAddressWithLen:(gint*)len name:(OFString*)name addr:(OFString*)addr
{
	return [OFString stringWithUTF8String:camel_internet_address_encode_address(len, [name UTF8String], [addr UTF8String])];
}

+ (OFString*)formatAddressWithName:(OFString*)name addr:(OFString*)addr
{
	return [OFString stringWithUTF8String:camel_internet_address_format_address([name UTF8String], [addr UTF8String])];
}

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_internet_address_new()];

	return self;
}

- (CamelInternetAddress*)INTERNETADDRESS
{
	return CAMEL_INTERNET_ADDRESS([self GOBJECT]);
}

- (gint)addWithName:(OFString*)name address:(OFString*)address
{
	return camel_internet_address_add([self INTERNETADDRESS], [name UTF8String], [address UTF8String]);
}

- (void)ensureAsciiDomains
{
	camel_internet_address_ensure_ascii_domains([self INTERNETADDRESS]);
}

- (gint)findAddressWithAddress:(OFString*)address namep:(const gchar**)namep
{
	return camel_internet_address_find_address([self INTERNETADDRESS], [address UTF8String], namep);
}

- (gint)findNameWithName:(OFString*)name addressp:(const gchar**)addressp
{
	return camel_internet_address_find_name([self INTERNETADDRESS], [name UTF8String], addressp);
}

- (bool)instanceWithIndex:(gint)index namep:(const gchar**)namep addressp:(const gchar**)addressp
{
	return camel_internet_address_get([self INTERNETADDRESS], index, namep, addressp);
}


@end