/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEModule.h"

@implementation OGEModule

+ (GList*)loadAllInDirectory:(OFString*)dirname
{
	return e_module_load_all_in_directory([dirname UTF8String]);
}

+ (OGEModule*)loadFile:(OFString*)filename
{
	return [[[OGEModule alloc] initWithGObject:(GObject*)e_module_load_file([filename UTF8String])] autorelease];
}

- (instancetype)init:(OFString*)filename
{
	self = [super initWithGObject:(GObject*)e_module_new([filename UTF8String])];

	return self;
}

- (EModule*)MODULE
{
	return E_MODULE([self GOBJECT]);
}

- (OFString*)filename
{
	return [OFString stringWithUTF8String:e_module_get_filename([self MODULE])];
}


@end