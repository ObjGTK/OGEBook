/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSettings.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGCamelStoreSettings : OGCamelSettings
{

}


/**
 * Methods
 */

- (CamelStoreSettings*)castedGObject;

/**
 * Returns whether to automatically apply filters to newly arrived messages
 * in the store's Inbox folder (assuming it has an Inbox folder).
 *
 * @return whether to filter new messages in Inbox
 */
- (bool)filterInbox;

/**
 * Returns the interval, in seconds, for the changes in the folder being
 * saved automatically. 0 means immediately, while -1 means turning off
 * automatic folder change saving.
 *
 * @return the interval for automatic store of folder changes
 */
- (gint)storeChangesInterval;

/**
 * Sets whether to automatically apply filters to newly arrived messages
 * in the store's Inbox folder (assuming it has an Inbox folder).
 *
 * @param filterInbox whether to filter new messages in Inbox
 */
- (void)setFilterInbox:(bool)filterInbox;

/**
 * Sets the interval, in seconds, for the changes in the folder being
 * saved automatically. 0 means immediately, while -1 means turning off
 * automatic folder change saving.
 *
 * @param interval the interval, in seconds
 */
- (void)setStoreChangesInterval:(gint)interval;

@end