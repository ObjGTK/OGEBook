/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceRefresh : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceRefresh*)SOURCEREFRESH;

/**
 * Returns whether to periodically fetch updates from a remote server.
 * 
 * The refresh interval is determined by the #ESourceRefresh:interval-minutes
 * property.
 *
 * @return whether periodic refresh is enabled
 */
- (bool)enabled;

/**
 * Returns the interval for fetching updates from a remote server.
 * 
 * Note this value is only effective when the #ESourceRefresh:enabled
 * property is %TRUE.
 *
 * @return the interval in minutes
 */
- (guint)intervalMinutes;

/**
 * Sets whether to periodically fetch updates from a remote server.
 * 
 * The refresh interval is determined by the #ESourceRefresh:interval-minutes
 * property.
 *
 * @param enabled whether to enable periodic refresh
 */
- (void)setEnabled:(bool)enabled;

/**
 * Sets the interval for fetching updates from a remote server.
 * 
 * Note this value is only effective when the #ESourceRefresh:enabled
 * property is %TRUE.
 *
 * @param intervalMinutes the interval in minutes
 */
- (void)setIntervalMinutes:(guint)intervalMinutes;

@end