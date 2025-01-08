/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceRegistry.h"

#import "OGEOAuth2Services.h"
#import "OGESource.h"
#import <OGio/OGCancellable.h>

@implementation OGESourceRegistry

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_REGISTRY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (bool)debugEnabled
{
	bool returnValue = (bool)e_source_registry_debug_enabled();

	return returnValue;
}

+ (void)freeDisplayTree:(GNode*)displayTree
{
	e_source_registry_free_display_tree(displayTree);
}

+ (void)newWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_registry_new([cancellable castedGObject], callback, userData);
}

- (instancetype)initWithResultFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	ESourceRegistry* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_source_registry_new_finish(result, &err), ESourceRegistry, ESourceRegistry);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

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

- (instancetype)initWithCancellableSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	ESourceRegistry* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_source_registry_new_sync([cancellable castedGObject], &err), ESourceRegistry, ESourceRegistry);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

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

- (ESourceRegistry*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceRegistry, ESourceRegistry);
}

- (GNode*)buildDisplayTree:(OFString*)extensionName
{
	GNode* returnValue = (GNode*)e_source_registry_build_display_tree([self castedGObject], [extensionName UTF8String]);

	return returnValue;
}

- (bool)checkEnabled:(OGESource*)source
{
	bool returnValue = (bool)e_source_registry_check_enabled([self castedGObject], [source castedGObject]);

	return returnValue;
}

- (void)commitSourceWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_registry_commit_source([self castedGObject], [source castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)commitSourceFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_registry_commit_source_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)commitSourceSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_registry_commit_source_sync([self castedGObject], [source castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)createSourcesWithListOfSources:(GList*)listOfSources cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_registry_create_sources([self castedGObject], listOfSources, [cancellable castedGObject], callback, userData);
}

- (bool)createSourcesFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_registry_create_sources_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)createSourcesSyncWithListOfSources:(GList*)listOfSources cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_registry_create_sources_sync([self castedGObject], listOfSources, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)debugDump:(OFString*)extensionName
{
	e_source_registry_debug_dump([self castedGObject], [extensionName UTF8String]);
}

- (OFString*)dupUniqueDisplayNameWithSource:(OGESource*)source extensionName:(OFString*)extensionName
{
	gchar* gobjectValue = e_source_registry_dup_unique_display_name([self castedGObject], [source castedGObject], [extensionName UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OGESource*)findExtensionWithSource:(OGESource*)source extensionName:(OFString*)extensionName
{
	ESource* gobjectValue = e_source_registry_find_extension([self castedGObject], [source castedGObject], [extensionName UTF8String]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGEOAuth2Services*)oauth2Services
{
	EOAuth2Services* gobjectValue = e_source_registry_get_oauth2_services([self castedGObject]);

	OGEOAuth2Services* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GList*)listEnabled:(OFString*)extensionName
{
	GList* returnValue = (GList*)e_source_registry_list_enabled([self castedGObject], [extensionName UTF8String]);

	return returnValue;
}

- (GList*)listSources:(OFString*)extensionName
{
	GList* returnValue = (GList*)e_source_registry_list_sources([self castedGObject], [extensionName UTF8String]);

	return returnValue;
}

- (OGESource*)refBuiltinAddressBook
{
	ESource* gobjectValue = e_source_registry_ref_builtin_address_book([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refBuiltinCalendar
{
	ESource* gobjectValue = e_source_registry_ref_builtin_calendar([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refBuiltinMailAccount
{
	ESource* gobjectValue = e_source_registry_ref_builtin_mail_account([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refBuiltinMemoList
{
	ESource* gobjectValue = e_source_registry_ref_builtin_memo_list([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refBuiltinProxy
{
	ESource* gobjectValue = e_source_registry_ref_builtin_proxy([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refBuiltinTaskList
{
	ESource* gobjectValue = e_source_registry_ref_builtin_task_list([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refDefaultAddressBook
{
	ESource* gobjectValue = e_source_registry_ref_default_address_book([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refDefaultCalendar
{
	ESource* gobjectValue = e_source_registry_ref_default_calendar([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refDefaultForExtensionName:(OFString*)extensionName
{
	ESource* gobjectValue = e_source_registry_ref_default_for_extension_name([self castedGObject], [extensionName UTF8String]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refDefaultMailAccount
{
	ESource* gobjectValue = e_source_registry_ref_default_mail_account([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refDefaultMailIdentity
{
	ESource* gobjectValue = e_source_registry_ref_default_mail_identity([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refDefaultMemoList
{
	ESource* gobjectValue = e_source_registry_ref_default_memo_list([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refDefaultTaskList
{
	ESource* gobjectValue = e_source_registry_ref_default_task_list([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGESource*)refSource:(OFString*)uid
{
	ESource* gobjectValue = e_source_registry_ref_source([self castedGObject], [uid UTF8String]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)refreshBackendWithSourceUid:(OFString*)sourceUid cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_registry_refresh_backend([self castedGObject], [sourceUid UTF8String], [cancellable castedGObject], callback, userData);
}

- (bool)refreshBackendFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_registry_refresh_backend_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)refreshBackendSyncWithSourceUid:(OFString*)sourceUid cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_registry_refresh_backend_sync([self castedGObject], [sourceUid UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setDefaultAddressBook:(OGESource*)defaultSource
{
	e_source_registry_set_default_address_book([self castedGObject], [defaultSource castedGObject]);
}

- (void)setDefaultCalendar:(OGESource*)defaultSource
{
	e_source_registry_set_default_calendar([self castedGObject], [defaultSource castedGObject]);
}

- (void)setDefaultForExtensionNameWithExtensionName:(OFString*)extensionName defaultSource:(OGESource*)defaultSource
{
	e_source_registry_set_default_for_extension_name([self castedGObject], [extensionName UTF8String], [defaultSource castedGObject]);
}

- (void)setDefaultMailAccount:(OGESource*)defaultSource
{
	e_source_registry_set_default_mail_account([self castedGObject], [defaultSource castedGObject]);
}

- (void)setDefaultMailIdentity:(OGESource*)defaultSource
{
	e_source_registry_set_default_mail_identity([self castedGObject], [defaultSource castedGObject]);
}

- (void)setDefaultMemoList:(OGESource*)defaultSource
{
	e_source_registry_set_default_memo_list([self castedGObject], [defaultSource castedGObject]);
}

- (void)setDefaultTaskList:(OGESource*)defaultSource
{
	e_source_registry_set_default_task_list([self castedGObject], [defaultSource castedGObject]);
}


@end