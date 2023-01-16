/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelBlockFile.h"

@implementation OGCamelBlockFile

- (instancetype)initWithPath:(OFString*)path flags:(gint)flags version:(OFString*)version blockSize:(gsize)blockSize
{
	self = [super initWithGObject:(GObject*)camel_block_file_new([path UTF8String], flags, [version UTF8String], blockSize)];

	return self;
}

- (CamelBlockFile*)BLOCKFILE
{
	return CAMEL_BLOCK_FILE([self GOBJECT]);
}

- (void)attachBlock:(CamelBlock*)bl
{
	camel_block_file_attach_block([self BLOCKFILE], bl);
}

- (gint)delete
{
	return camel_block_file_delete([self BLOCKFILE]);
}

- (void)detachBlock:(CamelBlock*)bl
{
	camel_block_file_detach_block([self BLOCKFILE], bl);
}

- (gint)freeBlock:(camel_block_t)id
{
	return camel_block_file_free_block([self BLOCKFILE], id);
}

- (CamelBlock*)block:(camel_block_t)id
{
	return camel_block_file_get_block([self BLOCKFILE], id);
}

- (gint)cacheLimit
{
	return camel_block_file_get_cache_limit([self BLOCKFILE]);
}

- (CamelBlockRoot*)root
{
	return camel_block_file_get_root([self BLOCKFILE]);
}

- (CamelBlock*)rootBlock
{
	return camel_block_file_get_root_block([self BLOCKFILE]);
}

- (CamelBlock*)newBlock
{
	return camel_block_file_new_block([self BLOCKFILE]);
}

- (gint)rename:(OFString*)path
{
	return camel_block_file_rename([self BLOCKFILE], [path UTF8String]);
}

- (void)setCacheLimit:(gint)blockCacheLimit
{
	camel_block_file_set_cache_limit([self BLOCKFILE], blockCacheLimit);
}

- (gint)sync
{
	return camel_block_file_sync([self BLOCKFILE]);
}

- (gint)syncBlock:(CamelBlock*)bl
{
	return camel_block_file_sync_block([self BLOCKFILE], bl);
}

- (void)touchBlock:(CamelBlock*)bl
{
	camel_block_file_touch_block([self BLOCKFILE], bl);
}

- (void)unrefBlock:(CamelBlock*)bl
{
	camel_block_file_unref_block([self BLOCKFILE], bl);
}


@end