/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelAddress.h"

@implementation OGCamelAddress

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_address_new()];

	return self;
}

- (CamelAddress*)ADDRESS
{
	return CAMEL_ADDRESS([self GOBJECT]);
}

- (gint)cat:(OGCamelAddress*)source
{
	return camel_address_cat([self ADDRESS], [source ADDRESS]);
}

- (gint)copy:(OGCamelAddress*)source
{
	return camel_address_copy([self ADDRESS], [source ADDRESS]);
}

- (gint)decode:(OFString*)raw
{
	return camel_address_decode([self ADDRESS], [raw UTF8String]);
}

- (OFString*)encode
{
	return [OFString stringWithUTF8String:camel_address_encode([self ADDRESS])];
}

- (OFString*)format
{
	return [OFString stringWithUTF8String:camel_address_format([self ADDRESS])];
}

- (gint)length
{
	return camel_address_length([self ADDRESS]);
}

- (OGCamelAddress*)newClone
{
	return [[[OGCamelAddress alloc] initWithGObject:(GObject*)camel_address_new_clone([self ADDRESS])] autorelease];
}

- (void)remove:(gint)index
{
	camel_address_remove([self ADDRESS], index);
}

- (gint)unformat:(OFString*)raw
{
	return camel_address_unformat([self ADDRESS], [raw UTF8String]);
}


@end