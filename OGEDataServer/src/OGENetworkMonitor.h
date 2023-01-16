/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

/**
 * Contains only private data that should be read and manipulated using
 * the functions below. Implements #GNetworkMonitorInterface.
 *
 */
@interface OGENetworkMonitor : OGObject
{

}

/**
 * Functions
 */

/**
 * Gets the default #ENetworkMonitor. The caller should not unref the returned instance.
 * The #ENetworkMonitor implements the #GNetworkMonitor iterface.
 *
 * @return The default #ENetworkMonitor instance.
 */
+ (GNetworkMonitor*)default;

/**
 * Methods
 */

- (ENetworkMonitor*)NETWORKMONITOR;

/**
 * Get currently set GIO name for the network availability checks.
 * See e_network_monitor_set_gio_name() for more details.
 *
 * @return A newly allocated string, a GIO name
 *   of the underlying GNetworkMonitor which is set to be used.
 *   The returned string should be freed with g_free(), when
 *   no longer needed.
 */
- (OFString*)dupGioName;

/**
 * Get a list of available GIO names for the #GNetworkMonitor implementations.
 * The strings can be used in e_network_monitor_set_gio_name().
 *
 * @return A newly allocated #GSList,
 *   with newly allocated strings, the GIO names. The #GSList should be freed
 *   with g_slist_free_full (gio_names, g_free); when no longer needed.
 */
- (GSList*)listGioNames;

/**
 * Set a @gio_name of the #GNetworkMonitor implementation to use, can be %NULL.
 * Use e_network_monitor_list_gio_names() for a list of available
 * implementations. A special value, %E_NETWORK_MONITOR_ALWAYS_ONLINE_NAME, can
 * be used to report the network as always reachable. When an unknown GIO
 * name is used the default #GNetworkMonitor implementation, as returned
 * by the g_network_monitor_get_default(), will be used.
 *
 * @param gioName a GIO name of a #GNetworkMonitor implementation to use, or %NULL
 */
- (void)setGioName:(OFString*)gioName;

@end