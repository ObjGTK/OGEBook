/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelPartitionTable.h"

#import "OGCamelBlockFile.h"

@implementation OGCamelPartitionTable

- (instancetype)initWithBs:(OGCamelBlockFile*)bs root:(camel_block_t)root
{
	CamelPartitionTable* gobjectValue = CAMEL_PARTITION_TABLE(camel_partition_table_new([bs castedGObject], root));

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

- (CamelPartitionTable*)castedGObject
{
	return CAMEL_PARTITION_TABLE([self gObject]);
}

- (gint)addWithKey:(OFString*)key keyid:(camel_key_t)keyid
{
	gint returnValue = camel_partition_table_add([self castedGObject], [key UTF8String], keyid);

	return returnValue;
}

- (camel_key_t)lookup:(OFString*)key
{
	camel_key_t returnValue = camel_partition_table_lookup([self castedGObject], [key UTF8String]);

	return returnValue;
}

- (bool)remove:(OFString*)key
{
	bool returnValue = camel_partition_table_remove([self castedGObject], [key UTF8String]);

	return returnValue;
}

- (gint)sync
{
	gint returnValue = camel_partition_table_sync([self castedGObject]);

	return returnValue;
}


@end