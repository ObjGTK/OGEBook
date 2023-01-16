/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelKeyFile.h"

@implementation OGCamelKeyFile

- (instancetype)initWithPath:(OFString*)path flags:(gint)flags version:(OFString*)version
{
	self = [super initWithGObject:(GObject*)camel_key_file_new([path UTF8String], flags, [version UTF8String])];

	return self;
}

- (CamelKeyFile*)KEYFILE
{
	return CAMEL_KEY_FILE([self GOBJECT]);
}

- (gint)delete
{
	return camel_key_file_delete([self KEYFILE]);
}

- (gint)readWithStart:(camel_block_t*)start len:(gsize*)len records:(camel_key_t**)records
{
	return camel_key_file_read([self KEYFILE], start, len, records);
}

- (gint)rename:(OFString*)path
{
	return camel_key_file_rename([self KEYFILE], [path UTF8String]);
}

- (gint)writeWithParent:(camel_block_t*)parent len:(gsize)len records:(camel_key_t*)records
{
	return camel_key_file_write([self KEYFILE], parent, len, records);
}


@end