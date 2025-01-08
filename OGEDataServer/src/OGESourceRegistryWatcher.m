/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceRegistryWatcher.h"

#import "OGESourceRegistry.h"

@implementation OGESourceRegistryWatcher

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_REGISTRY_WATCHER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithRegistry:(OGESourceRegistry*)registry extensionName:(OFString*)extensionName
{
	ESourceRegistryWatcher* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_source_registry_watcher_new([registry castedGObject], [extensionName UTF8String]), ESourceRegistryWatcher, ESourceRegistryWatcher);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceRegistryWatcher, ESourceRegistryWatcher);
}

- (OFString*)extensionName
{
	const gchar* gobjectValue = e_source_registry_watcher_get_extension_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGESourceRegistry*)registry
{
	ESourceRegistry* gobjectValue = e_source_registry_watcher_get_registry([self castedGObject]);

	OGESourceRegistry* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)reclaim
{
	e_source_registry_watcher_reclaim([self castedGObject]);
}


@end