/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
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

- (ESourceRefresh*)castedGObject;

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
 * Returns whether can refresh content on metered network.
 * 
 * The @extension itself doesn't use this option, it's up to
 * the @extension user to determine what kind of connection is used
 * and then decide whether refresh, or other expensive network
 * operations, can be done.
 *
 * @return whether can refresh content on metered network
 */
- (bool)enabledOnMeteredNetwork;

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
 * Sets whether can refresh content on metered network.
 * 
 * See e_source_refresh_get_enabled_on_metered_network() for more information
 * about what it means.
 *
 * @param enabled whether can refresh content on metered network
 */
- (void)setEnabledOnMeteredNetwork:(bool)enabled;

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