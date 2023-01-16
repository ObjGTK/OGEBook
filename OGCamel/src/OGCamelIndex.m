/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelIndex.h"

#import "OGCamelIndexCursor.h"
#import "OGCamelIndexName.h"

@implementation OGCamelIndex

- (CamelIndex*)INDEX
{
	return CAMEL_INDEX([self GOBJECT]);
}

- (OGCamelIndexName*)addName:(OFString*)name
{
	return [[[OGCamelIndexName alloc] initWithGObject:(GObject*)camel_index_add_name([self INDEX], [name UTF8String])] autorelease];
}

- (gint)compress
{
	return camel_index_compress([self INDEX]);
}

- (void)constructWithPath:(OFString*)path flags:(gint)flags
{
	camel_index_construct([self INDEX], [path UTF8String], flags);
}

- (gint)delete
{
	return camel_index_delete([self INDEX]);
}

- (void)deleteName:(OFString*)name
{
	camel_index_delete_name([self INDEX], [name UTF8String]);
}

- (OGCamelIndexCursor*)find:(OFString*)word
{
	return [[[OGCamelIndexCursor alloc] initWithGObject:(GObject*)camel_index_find([self INDEX], [word UTF8String])] autorelease];
}

- (OGCamelIndexCursor*)findName:(OFString*)name
{
	return [[[OGCamelIndexCursor alloc] initWithGObject:(GObject*)camel_index_find_name([self INDEX], [name UTF8String])] autorelease];
}

- (gint)hasName:(OFString*)name
{
	return camel_index_has_name([self INDEX], [name UTF8String]);
}

- (gint)rename:(OFString*)path
{
	return camel_index_rename([self INDEX], [path UTF8String]);
}

- (void)setNormalizeWithFunc:(CamelIndexNorm)func userData:(gpointer)userData
{
	camel_index_set_normalize([self INDEX], func, userData);
}

- (gint)sync
{
	return camel_index_sync([self INDEX]);
}

- (OGCamelIndexCursor*)words
{
	return [[[OGCamelIndexCursor alloc] initWithGObject:(GObject*)camel_index_words([self INDEX])] autorelease];
}

- (gint)writeName:(OGCamelIndexName*)idn
{
	return camel_index_write_name([self INDEX], [idn INDEXNAME]);
}


@end