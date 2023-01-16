/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelBlockFile : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithPath:(OFString*)path flags:(gint)flags version:(OFString*)version blockSize:(gsize)blockSize;

/**
 * Methods
 */

- (CamelBlockFile*)BLOCKFILE;

/**
 * Reattach a block that has been detached.
 *
 * @param bl a #CamelBlock
 */
- (void)attachBlock:(CamelBlock*)bl;

/**
 * Deletes existing block file.
 *
 * @return 0 on success, -1 on error.
 */
- (gint)delete;

/**
 * Detatch a block from the block file's cache.  The block should
 * be unref'd or attached when finished with.  The block file will
 * perform no writes of this block or flushing of it if the cache
 * fills.
 *
 * @param bl a #CamelBlock
 */
- (void)detachBlock:(CamelBlock*)bl;

/**
 *
 * @param id a #camel_block_t
 * @return
 */
- (gint)freeBlock:(camel_block_t)id;

/**
 * Retreive a block @id.
 *
 * @param id a #camel_block_t
 * @return The block, or NULL if blockid is invalid or a file error
 * occurred.
 */
- (CamelBlock*)block:(camel_block_t)id;

/**
 *
 * @return Current block cache limit of @bs.
 */
- (gint)cacheLimit;

/**
 *
 * @return A #CamelBlockRoot of @bs.
 */
- (CamelBlockRoot*)root;

/**
 *
 * @return A root #CamelBlock of @bs.
 */
- (CamelBlock*)rootBlock;

/**
 * Allocate a new block, return a pointer to it.  Old blocks
 * may be flushed to disk during this call.
 *
 * @return The block, or NULL if an error occurred.
 */
- (CamelBlock*)newBlock;

/**
 * Renames existing block file to a new @path.
 *
 * @param path path with filename to rename to
 * @return 0 on success, -1 on error; errno is set on failure
 */
- (gint)rename:(OFString*)path;

/**
 * Sets a new block cache limit for @bs.
 *
 * @param blockCacheLimit a new block cache limit to set
 */
- (void)setCacheLimit:(gint)blockCacheLimit;

/**
 * Sync all dirty blocks to disk, including the root block.
 *
 * @return -1 on io error.
 */
- (gint)sync;

/**
 * Flush a block to disk immediately.  The block will only
 * be flushed to disk if it is marked as dirty (touched).
 *
 * @param bl a #CamelBlock
 * @return -1 on io error.
 */
- (gint)syncBlock:(CamelBlock*)bl;

/**
 * Mark a block as dirty.  The block will be written to disk if
 * it ever expires from the cache.
 *
 * @param bl a #CamelBlock
 */
- (void)touchBlock:(CamelBlock*)bl;

/**
 * Mark a block as unused.  If a block is used it will not be
 * written to disk, or flushed from memory.
 * 
 * If a block is detatched and this is the last reference, the
 * block will be freed.
 *
 * @param bl a #CamelBlock
 */
- (void)unrefBlock:(CamelBlock*)bl;

@end