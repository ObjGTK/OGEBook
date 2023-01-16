/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMedium.h"

@implementation OGCamelMedium

- (CamelMedium*)MEDIUM
{
	return CAMEL_MEDIUM([self GOBJECT]);
}

- (void)addHeaderWithName:(OFString*)name value:(OFString*)value
{
	camel_medium_add_header([self MEDIUM], [name UTF8String], [value UTF8String]);
}

- (CamelNameValueArray*)dupHeaders
{
	return camel_medium_dup_headers([self MEDIUM]);
}

- (OGCamelDataWrapper*)content
{
	return [[[OGCamelDataWrapper alloc] initWithGObject:(GObject*)camel_medium_get_content([self MEDIUM])] autorelease];
}

- (OFString*)header:(OFString*)name
{
	return [OFString stringWithUTF8String:camel_medium_get_header([self MEDIUM], [name UTF8String])];
}

- (const CamelNameValueArray*)headers
{
	return camel_medium_get_headers([self MEDIUM]);
}

- (void)removeHeader:(OFString*)name
{
	camel_medium_remove_header([self MEDIUM], [name UTF8String]);
}

- (void)setContent:(OGCamelDataWrapper*)content
{
	camel_medium_set_content([self MEDIUM], [content DATAWRAPPER]);
}

- (void)setHeaderWithName:(OFString*)name value:(OFString*)value
{
	camel_medium_set_header([self MEDIUM], [name UTF8String], [value UTF8String]);
}


@end