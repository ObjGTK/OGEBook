/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelBlockFile.h"

@implementation OGCamelBlockFile

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_BLOCK_FILE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)blockFileWithPath:(OFString*)path flags:(gint)flags version:(OFString*)version blockSize:(gsize)blockSize
{
	CamelBlockFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_block_file_new([path UTF8String], flags, [version UTF8String], blockSize), CamelBlockFile, CamelBlockFile);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelBlockFile* wrapperObject;
	@try {
		wrapperObject = [[OGCamelBlockFile alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelBlockFile*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelBlockFile, CamelBlockFile);
}

- (void)attachBlock:(CamelBlock*)bl
{
	camel_block_file_attach_block([self castedGObject], bl);
}

- (gint)delete
{
	gint returnValue = (gint)camel_block_file_delete([self castedGObject]);

	return returnValue;
}

- (void)detachBlock:(CamelBlock*)bl
{
	camel_block_file_detach_block([self castedGObject], bl);
}

- (gint)freeBlock:(camel_block_t)identifier
{
	gint returnValue = (gint)camel_block_file_free_block([self castedGObject], identifier);

	return returnValue;
}

- (CamelBlock*)block:(camel_block_t)identifier
{
	CamelBlock* returnValue = (CamelBlock*)camel_block_file_get_block([self castedGObject], identifier);

	return returnValue;
}

- (gint)cacheLimit
{
	gint returnValue = (gint)camel_block_file_get_cache_limit([self castedGObject]);

	return returnValue;
}

- (CamelBlockRoot*)root
{
	CamelBlockRoot* returnValue = (CamelBlockRoot*)camel_block_file_get_root([self castedGObject]);

	return returnValue;
}

- (CamelBlock*)rootBlock
{
	CamelBlock* returnValue = (CamelBlock*)camel_block_file_get_root_block([self castedGObject]);

	return returnValue;
}

- (CamelBlock*)newBlock
{
	CamelBlock* returnValue = (CamelBlock*)camel_block_file_new_block([self castedGObject]);

	return returnValue;
}

- (gint)rename:(OFString*)path
{
	gint returnValue = (gint)camel_block_file_rename([self castedGObject], [path UTF8String]);

	return returnValue;
}

- (void)setCacheLimit:(gint)blockCacheLimit
{
	camel_block_file_set_cache_limit([self castedGObject], blockCacheLimit);
}

- (gint)sync
{
	gint returnValue = (gint)camel_block_file_sync([self castedGObject]);

	return returnValue;
}

- (gint)syncBlock:(CamelBlock*)bl
{
	gint returnValue = (gint)camel_block_file_sync_block([self castedGObject], bl);

	return returnValue;
}

- (void)touchBlock:(CamelBlock*)bl
{
	camel_block_file_touch_block([self castedGObject], bl);
}

- (void)unrefBlock:(CamelBlock*)bl
{
	camel_block_file_unref_block([self castedGObject], bl);
}


@end