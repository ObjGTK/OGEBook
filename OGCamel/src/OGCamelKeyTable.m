/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelKeyTable.h"

#import "OGCamelBlockFile.h"

@implementation OGCamelKeyTable

- (instancetype)initWithBs:(OGCamelBlockFile*)bs root:(camel_block_t)root
{
	self = [super initWithGObject:(GObject*)camel_key_table_new([bs BLOCKFILE], root)];

	return self;
}

- (CamelKeyTable*)KEYTABLE
{
	return CAMEL_KEY_TABLE([self GOBJECT]);
}

- (camel_key_t)addWithKey:(OFString*)key data:(camel_block_t)data flags:(guint)flags
{
	return camel_key_table_add([self KEYTABLE], [key UTF8String], data, flags);
}

- (camel_block_t)lookupWithKeyid:(camel_key_t)keyid key:(gchar**)key flags:(guint*)flags
{
	return camel_key_table_lookup([self KEYTABLE], keyid, key, flags);
}

- (camel_key_t)nextWithNext:(camel_key_t)next keyp:(gchar**)keyp flagsp:(guint*)flagsp datap:(camel_block_t*)datap
{
	return camel_key_table_next([self KEYTABLE], next, keyp, flagsp, datap);
}

- (bool)setDataWithKeyid:(camel_key_t)keyid data:(camel_block_t)data
{
	return camel_key_table_set_data([self KEYTABLE], keyid, data);
}

- (bool)setFlagsWithKeyid:(camel_key_t)keyid flags:(guint)flags set:(guint)set
{
	return camel_key_table_set_flags([self KEYTABLE], keyid, flags, set);
}

- (gint)sync
{
	return camel_key_table_sync([self KEYTABLE]);
}


@end