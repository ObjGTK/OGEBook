/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelInternetAddress.h"

@implementation OGCamelInternetAddress

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_INTERNET_ADDRESS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OFString*)encodeAddressWithLen:(gint*)len name:(OFString*)name addr:(OFString*)addr
{
	gchar* gobjectValue = camel_internet_address_encode_address(len, [name UTF8String], [addr UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

+ (OFString*)formatAddressWithName:(OFString*)name addr:(OFString*)addr
{
	gchar* gobjectValue = camel_internet_address_format_address([name UTF8String], [addr UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (instancetype)init
{
	CamelInternetAddress* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_internet_address_new(), CamelInternetAddress, CamelInternetAddress);

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

- (CamelInternetAddress*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelInternetAddress, CamelInternetAddress);
}

- (gint)addWithName:(OFString*)name address:(OFString*)address
{
	gint returnValue = (gint)camel_internet_address_add([self castedGObject], [name UTF8String], [address UTF8String]);

	return returnValue;
}

- (void)ensureAsciiDomains
{
	camel_internet_address_ensure_ascii_domains([self castedGObject]);
}

- (gint)findAddressWithAddress:(OFString*)address namep:(const gchar**)namep
{
	gint returnValue = (gint)camel_internet_address_find_address([self castedGObject], [address UTF8String], namep);

	return returnValue;
}

- (gint)findNameWithName:(OFString*)name addressp:(const gchar**)addressp
{
	gint returnValue = (gint)camel_internet_address_find_name([self castedGObject], [name UTF8String], addressp);

	return returnValue;
}

- (bool)getWithIndex:(gint)index namep:(const gchar**)namep addressp:(const gchar**)addressp
{
	bool returnValue = (bool)camel_internet_address_get([self castedGObject], index, namep, addressp);

	return returnValue;
}

- (bool)sanitizeAsciiDomain
{
	bool returnValue = (bool)camel_internet_address_sanitize_ascii_domain([self castedGObject]);

	return returnValue;
}


@end