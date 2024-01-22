/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEModule.h"

@implementation OGEModule

+ (GList*)loadAllInDirectory:(OFString*)dirname
{
	GList* returnValue = e_module_load_all_in_directory([dirname UTF8String]);

	return returnValue;
}

+ (GList*)loadAllInDirectoryAndPrefixesWithDirname:(OFString*)dirname dirprefix:(OFString*)dirprefix
{
	GList* returnValue = e_module_load_all_in_directory_and_prefixes([dirname UTF8String], [dirprefix UTF8String]);

	return returnValue;
}

+ (OGEModule*)loadFile:(OFString*)filename
{
	EModule* gobjectValue = E_MODULE(e_module_load_file([filename UTF8String]));

	OGEModule* returnValue = [OGEModule wrapperFor:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (instancetype)init:(OFString*)filename
{
	EModule* gobjectValue = E_MODULE(e_module_new([filename UTF8String]));

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

- (EModule*)castedGObject
{
	return E_MODULE([self gObject]);
}

- (OFString*)filename
{
	const gchar* gobjectValue = e_module_get_filename([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end