/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStoreSettings.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGCamelOfflineSettings : OGCamelStoreSettings
{

}


/**
 * Methods
 */

- (CamelOfflineSettings*)castedGObject;

/**
 *
 * @return whether limit messages stored for offline use by their age
 */
- (bool)limitByAge;

/**
 *
 * @return the limit unit to use when interpreting 'limit-value'
 */
- (CamelTimeUnit)limitUnit;

/**
 *
 * @return the limit, in 'limit-unit', to use when 'limit-by-age' is set to %TRUE
 */
- (gint)limitValue;

/**
 * Returns whether to synchronize the local cache with the remote server
 * before switching to offline mode, so the store's content can still be
 * read while offline.
 *
 * @return whether to stay synchronized with the remote server
 */
- (bool)staySynchronized;

/**
 * Returns the interval, in seconds, for the changes in the folder being
 * saved automatically. 0 means immediately, while -1 means turning off
 * automatic folder change saving.
 *
 * @return the interval for automatic store of folder changes
 */
- (gint)storeChangesInterval;

/**
 * Set whether the messages to download for offline should be limited
 * by age. If set to %TRUE, then messages older than 'limit-value'
 * will not be downloaded automatically.
 *
 * @param limitByAge a value to set
 */
- (void)setLimitByAge:(bool)limitByAge;

/**
 * Set the limit unit to use when interpreting 'limit-value'.
 *
 * @param limitUnit a #CamelTimeUnit with a unit to use
 */
- (void)setLimitUnit:(CamelTimeUnit)limitUnit;

/**
 * Set the limit, in 'limit-unit', to use when 'limit-by-age' is set to %TRUE.
 *
 * @param limitValue a value to set
 */
- (void)setLimitValue:(bool)limitValue;

/**
 * Sets whether to synchronize the local cache with the remote server before
 * switching to offline mode, so the store's content can still be read while
 * offline.
 *
 * @param staySynchronized whether to stay synchronized with the remote server
 */
- (void)setStaySynchronized:(bool)staySynchronized;

/**
 * Sets the interval, in seconds, for the changes in the folder being
 * saved automatically. 0 means immediately, while -1 means turning off
 * automatic folder change saving.
 *
 * @param interval the interval, in seconds
 */
- (void)setStoreChangesInterval:(gint)interval;

@end