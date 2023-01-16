/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelDataCache : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithPath:(OFString*)path err:(GError**)err;

/**
 * Methods
 */

- (CamelDataCache*)DATACACHE;

/**
 * Add a new item to the cache, returning a #GIOStream to the new item.
 * 
 * The key and the path combine to form a unique key used to store the item.
 * 
 * Potentially, expiry processing will be performed while this call is
 * executing.
 * 
 * The returned #GIOStream is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @param path Relative path of item to add.
 * @param key Key of item to add.
 * @param err
 * @return a #GIOStream for the new cache item, or %NULL
 */
- (GIOStream*)addWithPath:(OFString*)path key:(OFString*)key err:(GError**)err;

/**
 * Clear cache's content in @path.
 *
 * @param path Path to the (sub) cache the item exists in.
 */
- (void)clear:(OFString*)path;

/**
 * Traverses the @cdc sub-cache identified by @path and calls @func for each found file.
 * If the @func returns %TRUE, then the file is removed, if %FALSE, it's kept in the cache.
 *
 * @param path Path to the (sub) cache the items exist in
 * @param func a callback to call for each found file in the cache
 * @param userData user data passed to @func
 */
- (void)foreachRemoveWithPath:(OFString*)path func:(CamelDataCacheRemoveFunc)func userData:(gpointer)userData;

/**
 * Lookup an item in the cache.  If the item exists, a #GIOStream is returned
 * for the item.  The stream may be shared by multiple callers, so ensure the
 * stream is in a valid state through external locking.
 * 
 * The returned #GIOStream is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @param path Path to the (sub) cache the item exists in.
 * @param key Key for the cache item.
 * @param err
 * @return a #GIOStream for the requested cache item, or %NULL
 */
- (GIOStream*)instanceWithPath:(OFString*)path key:(OFString*)key err:(GError**)err;

/**
 * Gets whether expire of cache data is enabled.
 * 
 * This is a complementary property for camel_data_cache_set_expire_age()
 * and camel_data_cache_set_expire_access(), which allows to disable expiry
 * without touching the two values. Having expire enabled, but not have set
 * any of the two times, still behaves like not having expiry enabled.
 *
 * @return Whether expire is enabled.
 */
- (bool)expireEnabled;

/**
 * Lookup the filename for an item in the cache
 *
 * @param path Path to the (sub) cache the item exists in.
 * @param key Key for the cache item.
 * @return The filename for a cache item
 */
- (OFString*)filenameWithPath:(OFString*)path key:(OFString*)key;

/**
 * Returns the path to the data cache.
 *
 * @return the path to the data cache
 */
- (OFString*)path;

/**
 * Remove/expire a cache item.
 *
 * @param path Path to the (sub) cache the item exists in.
 * @param key Key for the cache item.
 * @param err
 * @return 0 on success, -1 on error
 */
- (gint)removeWithPath:(OFString*)path key:(OFString*)key err:(GError**)err;

/**
 * Set the cache expiration policy for access times.
 * 
 * Items in the cache which haven't been accessed for @when
 * seconds may be expired at any time.  Items are expired in a lazy
 * manner, so it is indeterminate when the items will
 * physically be removed.
 * 
 * Note you can set both an age and an access limit.  The
 * age acts as a hard limit on cache entries.
 *
 * @param when Timeout for access, or -1 to disable access expiry.
 */
- (void)setExpireAccess:(time_t)when;

/**
 * Set the cache expiration policy for aged entries.
 * 
 * Items in the cache older than @when seconds may be
 * flushed at any time.  Items are expired in a lazy
 * manner, so it is indeterminate when the items will
 * physically be removed.
 * 
 * Note you can set both an age and an access limit.  The
 * age acts as a hard limit on cache entries.
 *
 * @param when Timeout for age expiry, or -1 to disable.
 */
- (void)setExpireAge:(time_t)when;

/**
 * Sets whether expire of cache data is enabled.
 * 
 * This is a complementary property for camel_data_cache_set_expire_age()
 * and camel_data_cache_set_expire_access(), which allows to disable expiry
 * without touching the two values. Having expire enabled, but not have set
 * any of the two times, still behaves like not having expiry enabled.
 *
 * @param expireEnabled a value to set
 */
- (void)setExpireEnabled:(bool)expireEnabled;

/**
 * Sets the path to the data cache.
 *
 * @param path path to the data cache
 */
- (void)setPath:(OFString*)path;

@end