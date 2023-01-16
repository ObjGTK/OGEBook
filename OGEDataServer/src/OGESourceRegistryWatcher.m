/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceRegistryWatcher.h"

#import "OGESourceRegistry.h"

@implementation OGESourceRegistryWatcher

- (instancetype)initWithRegistry:(OGESourceRegistry*)registry extensionName:(OFString*)extensionName
{
	self = [super initWithGObject:(GObject*)e_source_registry_watcher_new([registry SOURCEREGISTRY], [extensionName UTF8String])];

	return self;
}

- (ESourceRegistryWatcher*)SOURCEREGISTRYWATCHER
{
	return E_SOURCE_REGISTRY_WATCHER([self GOBJECT]);
}

- (OFString*)extensionName
{
	return [OFString stringWithUTF8String:e_source_registry_watcher_get_extension_name([self SOURCEREGISTRYWATCHER])];
}

- (OGESourceRegistry*)registry
{
	return [[[OGESourceRegistry alloc] initWithGObject:(GObject*)e_source_registry_watcher_get_registry([self SOURCEREGISTRYWATCHER])] autorelease];
}

- (void)reclaim
{
	e_source_registry_watcher_reclaim([self SOURCEREGISTRYWATCHER]);
}


@end