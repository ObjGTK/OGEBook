/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

@class OGESourceRegistry;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceRegistryWatcher : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithRegistry:(OGESourceRegistry*)registry extensionName:(OFString*)extensionName;

/**
 * Methods
 */

- (ESourceRegistryWatcher*)castedGObject;

/**
 *
 * @return The extension name passed to e_source_registry_watcher_new().
 */
- (OFString*)extensionName;

/**
 * Returns the #ESourceRegistry passed to e_source_registry_watcher_new().
 *
 * @return an #ESourceRegistry
 */
- (OGESourceRegistry*)registry;

/**
 * Reclaims all available sources satisfying the #ESourceRegistryWatcher::filter
 * signal. It doesn't notify about disappeared sources, it notifies only
 * on those appeared.
 *
 */
- (void)reclaim;

@end