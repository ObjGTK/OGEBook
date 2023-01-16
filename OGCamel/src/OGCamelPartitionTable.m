/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelPartitionTable.h"

#import "OGCamelBlockFile.h"

@implementation OGCamelPartitionTable

- (instancetype)initWithBs:(OGCamelBlockFile*)bs root:(camel_block_t)root
{
	self = [super initWithGObject:(GObject*)camel_partition_table_new([bs BLOCKFILE], root)];

	return self;
}

- (CamelPartitionTable*)PARTITIONTABLE
{
	return CAMEL_PARTITION_TABLE([self GOBJECT]);
}

- (gint)addWithKey:(OFString*)key keyid:(camel_key_t)keyid
{
	return camel_partition_table_add([self PARTITIONTABLE], [key UTF8String], keyid);
}

- (camel_key_t)lookup:(OFString*)key
{
	return camel_partition_table_lookup([self PARTITIONTABLE], [key UTF8String]);
}

- (bool)remove:(OFString*)key
{
	return camel_partition_table_remove([self PARTITIONTABLE], [key UTF8String]);
}

- (gint)sync
{
	return camel_partition_table_sync([self PARTITIONTABLE]);
}


@end