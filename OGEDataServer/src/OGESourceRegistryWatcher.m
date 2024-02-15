/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceRegistryWatcher.h"

#import "OGESourceRegistry.h"

@implementation OGESourceRegistryWatcher

- (instancetype)initWithRegistry:(OGESourceRegistry*)registry extensionName:(OFString*)extensionName
{
	ESourceRegistryWatcher* gobjectValue = E_SOURCE_REGISTRY_WATCHER(e_source_registry_watcher_new([registry castedGObject], [extensionName UTF8String]));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (ESourceRegistryWatcher*)castedGObject
{
	return E_SOURCE_REGISTRY_WATCHER([self gObject]);
}

- (OFString*)extensionName
{
	const gchar* gobjectValue = e_source_registry_watcher_get_extension_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGESourceRegistry*)registry
{
	ESourceRegistry* gobjectValue = E_SOURCE_REGISTRY(e_source_registry_watcher_get_registry([self castedGObject]));

	OGESourceRegistry* returnValue = [OGESourceRegistry withGObject:gobjectValue];
	return returnValue;
}

- (void)reclaim
{
	e_source_registry_watcher_reclaim([self castedGObject]);
}


@end