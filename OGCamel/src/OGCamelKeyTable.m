/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelKeyTable.h"

#import "OGCamelBlockFile.h"

@implementation OGCamelKeyTable

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_KEY_TABLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)keyTableWithBs:(OGCamelBlockFile*)bs root:(camel_block_t)root
{
	CamelKeyTable* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_key_table_new([bs castedGObject], root), CamelKeyTable, CamelKeyTable);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelKeyTable* wrapperObject;
	@try {
		wrapperObject = [[OGCamelKeyTable alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelKeyTable*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelKeyTable, CamelKeyTable);
}

- (camel_key_t)addWithKey:(OFString*)key data:(camel_block_t)data flags:(guint)flags
{
	camel_key_t returnValue = (camel_key_t)camel_key_table_add([self castedGObject], [key UTF8String], data, flags);

	return returnValue;
}

- (camel_block_t)lookupWithKeyid:(camel_key_t)keyid key:(gchar**)key flags:(guint*)flags
{
	camel_block_t returnValue = (camel_block_t)camel_key_table_lookup([self castedGObject], keyid, key, flags);

	return returnValue;
}

- (camel_key_t)nextWithNext:(camel_key_t)next keyp:(gchar**)keyp flagsp:(guint*)flagsp datap:(camel_block_t*)datap
{
	camel_key_t returnValue = (camel_key_t)camel_key_table_next([self castedGObject], next, keyp, flagsp, datap);

	return returnValue;
}

- (bool)setDataWithKeyid:(camel_key_t)keyid data:(camel_block_t)data
{
	bool returnValue = (bool)camel_key_table_set_data([self castedGObject], keyid, data);

	return returnValue;
}

- (bool)setFlagsWithKeyid:(camel_key_t)keyid flags:(guint)flags set:(guint)set
{
	bool returnValue = (bool)camel_key_table_set_flags([self castedGObject], keyid, flags, set);

	return returnValue;
}

- (gint)sync
{
	gint returnValue = (gint)camel_key_table_sync([self castedGObject]);

	return returnValue;
}


@end