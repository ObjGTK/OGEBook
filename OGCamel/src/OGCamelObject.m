/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelObject.h"

@implementation OGCamelObject

- (CamelObject*)OBJECT
{
	return CAMEL_OBJECT([self GOBJECT]);
}

- (OFString*)stateFilename
{
	return [OFString stringWithUTF8String:camel_object_get_state_filename([self OBJECT])];
}

- (void)setStateFilename:(OFString*)stateFilename
{
	camel_object_set_state_filename([self OBJECT], [stateFilename UTF8String]);
}

- (gint)stateRead
{
	return camel_object_state_read([self OBJECT]);
}

- (gint)stateWrite
{
	return camel_object_state_write([self OBJECT]);
}


@end