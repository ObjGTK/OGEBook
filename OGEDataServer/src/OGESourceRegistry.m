/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceRegistry.h"

#import "OGESource.h"
#import "OGEOAuth2Services.h"

@implementation OGESourceRegistry

+ (bool)debugEnabled
{
	return e_source_registry_debug_enabled();
}

+ (void)freeDisplayTree:(GNode*)displayTree
{
	e_source_registry_free_display_tree(displayTree);
}

+ (void)newWithCancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_registry_new(cancellable, callback, userData);
}

- (instancetype)initFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	self = [super initWithGObject:(GObject*)e_source_registry_new_finish(result, err)];

	return self;
}

- (instancetype)initSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	self = [super initWithGObject:(GObject*)e_source_registry_new_sync(cancellable, err)];

	return self;
}

- (ESourceRegistry*)SOURCEREGISTRY
{
	return E_SOURCE_REGISTRY([self GOBJECT]);
}

- (GNode*)buildDisplayTree:(OFString*)extensionName
{
	return e_source_registry_build_display_tree([self SOURCEREGISTRY], [extensionName UTF8String]);
}

- (bool)checkEnabled:(OGESource*)source
{
	return e_source_registry_check_enabled([self SOURCEREGISTRY], [source SOURCE]);
}

- (void)commitSourceWithSource:(OGESource*)source cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_registry_commit_source([self SOURCEREGISTRY], [source SOURCE], cancellable, callback, userData);
}

- (bool)commitSourceFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_registry_commit_source_finish([self SOURCEREGISTRY], result, err);
}

- (bool)commitSourceSyncWithSource:(OGESource*)source cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_registry_commit_source_sync([self SOURCEREGISTRY], [source SOURCE], cancellable, err);
}

- (void)createSourcesWithListOfSources:(GList*)listOfSources cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_registry_create_sources([self SOURCEREGISTRY], listOfSources, cancellable, callback, userData);
}

- (bool)createSourcesFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_registry_create_sources_finish([self SOURCEREGISTRY], result, err);
}

- (bool)createSourcesSyncWithListOfSources:(GList*)listOfSources cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_registry_create_sources_sync([self SOURCEREGISTRY], listOfSources, cancellable, err);
}

- (void)debugDump:(OFString*)extensionName
{
	e_source_registry_debug_dump([self SOURCEREGISTRY], [extensionName UTF8String]);
}

- (OFString*)dupUniqueDisplayNameWithSource:(OGESource*)source extensionName:(OFString*)extensionName
{
	return [OFString stringWithUTF8String:e_source_registry_dup_unique_display_name([self SOURCEREGISTRY], [source SOURCE], [extensionName UTF8String])];
}

- (OGESource*)findExtensionWithSource:(OGESource*)source extensionName:(OFString*)extensionName
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_find_extension([self SOURCEREGISTRY], [source SOURCE], [extensionName UTF8String])] autorelease];
}

- (OGEOAuth2Services*)oauth2Services
{
	return [[[OGEOAuth2Services alloc] initWithGObject:(GObject*)e_source_registry_get_oauth2_services([self SOURCEREGISTRY])] autorelease];
}

- (GList*)listEnabled:(OFString*)extensionName
{
	return e_source_registry_list_enabled([self SOURCEREGISTRY], [extensionName UTF8String]);
}

- (GList*)listSources:(OFString*)extensionName
{
	return e_source_registry_list_sources([self SOURCEREGISTRY], [extensionName UTF8String]);
}

- (OGESource*)refBuiltinAddressBook
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_builtin_address_book([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refBuiltinCalendar
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_builtin_calendar([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refBuiltinMailAccount
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_builtin_mail_account([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refBuiltinMemoList
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_builtin_memo_list([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refBuiltinProxy
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_builtin_proxy([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refBuiltinTaskList
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_builtin_task_list([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refDefaultAddressBook
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_default_address_book([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refDefaultCalendar
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_default_calendar([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refDefaultForExtensionName:(OFString*)extensionName
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_default_for_extension_name([self SOURCEREGISTRY], [extensionName UTF8String])] autorelease];
}

- (OGESource*)refDefaultMailAccount
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_default_mail_account([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refDefaultMailIdentity
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_default_mail_identity([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refDefaultMemoList
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_default_memo_list([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refDefaultTaskList
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_default_task_list([self SOURCEREGISTRY])] autorelease];
}

- (OGESource*)refSource:(OFString*)uid
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_registry_ref_source([self SOURCEREGISTRY], [uid UTF8String])] autorelease];
}

- (void)refreshBackendWithSourceUid:(OFString*)sourceUid cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_registry_refresh_backend([self SOURCEREGISTRY], [sourceUid UTF8String], cancellable, callback, userData);
}

- (bool)refreshBackendFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_registry_refresh_backend_finish([self SOURCEREGISTRY], result, err);
}

- (bool)refreshBackendSyncWithSourceUid:(OFString*)sourceUid cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_registry_refresh_backend_sync([self SOURCEREGISTRY], [sourceUid UTF8String], cancellable, err);
}

- (void)setDefaultAddressBook:(OGESource*)defaultSource
{
	e_source_registry_set_default_address_book([self SOURCEREGISTRY], [defaultSource SOURCE]);
}

- (void)setDefaultCalendar:(OGESource*)defaultSource
{
	e_source_registry_set_default_calendar([self SOURCEREGISTRY], [defaultSource SOURCE]);
}

- (void)setDefaultForExtensionNameWithExtensionName:(OFString*)extensionName defaultSource:(OGESource*)defaultSource
{
	e_source_registry_set_default_for_extension_name([self SOURCEREGISTRY], [extensionName UTF8String], [defaultSource SOURCE]);
}

- (void)setDefaultMailAccount:(OGESource*)defaultSource
{
	e_source_registry_set_default_mail_account([self SOURCEREGISTRY], [defaultSource SOURCE]);
}

- (void)setDefaultMailIdentity:(OGESource*)defaultSource
{
	e_source_registry_set_default_mail_identity([self SOURCEREGISTRY], [defaultSource SOURCE]);
}

- (void)setDefaultMemoList:(OGESource*)defaultSource
{
	e_source_registry_set_default_memo_list([self SOURCEREGISTRY], [defaultSource SOURCE]);
}

- (void)setDefaultTaskList:(OGESource*)defaultSource
{
	e_source_registry_set_default_task_list([self SOURCEREGISTRY], [defaultSource SOURCE]);
}


@end