/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelTextIndex.h"

@implementation OGCamelTextIndex

+ (gint)check:(OFString*)path
{
	return camel_text_index_check([path UTF8String]);
}

+ (gint)remove:(OFString*)old
{
	return camel_text_index_remove([old UTF8String]);
}

+ (gint)renameWithOld:(OFString*)old new:(OFString*)new
{
	return camel_text_index_rename([old UTF8String], [new UTF8String]);
}

- (instancetype)initWithPath:(OFString*)path flags:(gint)flags
{
	self = [super initWithGObject:(GObject*)camel_text_index_new([path UTF8String], flags)];

	return self;
}

- (CamelTextIndex*)TEXTINDEX
{
	return CAMEL_TEXT_INDEX([self GOBJECT]);
}

- (void)dump
{
	camel_text_index_dump([self TEXTINDEX]);
}

- (void)info
{
	camel_text_index_info([self TEXTINDEX]);
}

- (void)validate
{
	camel_text_index_validate([self TEXTINDEX]);
}


@end