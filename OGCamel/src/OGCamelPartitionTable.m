/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelPartitionTable.h"

#import "OGCamelBlockFile.h"

@implementation OGCamelPartitionTable

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_PARTITION_TABLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)partitionTableWithBs:(OGCamelBlockFile*)bs root:(camel_block_t)root
{
	CamelPartitionTable* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_partition_table_new([bs castedGObject], root), CamelPartitionTable, CamelPartitionTable);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelPartitionTable* wrapperObject;
	@try {
		wrapperObject = [[OGCamelPartitionTable alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelPartitionTable*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelPartitionTable, CamelPartitionTable);
}

- (gint)addWithKey:(OFString*)key keyid:(camel_key_t)keyid
{
	gint returnValue = (gint)camel_partition_table_add([self castedGObject], [key UTF8String], keyid);

	return returnValue;
}

- (camel_key_t)lookup:(OFString*)key
{
	camel_key_t returnValue = (camel_key_t)camel_partition_table_lookup([self castedGObject], [key UTF8String]);

	return returnValue;
}

- (bool)remove:(OFString*)key
{
	bool returnValue = (bool)camel_partition_table_remove([self castedGObject], [key UTF8String]);

	return returnValue;
}

- (gint)sync
{
	gint returnValue = (gint)camel_partition_table_sync([self castedGObject]);

	return returnValue;
}


@end