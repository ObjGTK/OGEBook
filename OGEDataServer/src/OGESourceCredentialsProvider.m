/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCredentialsProvider.h"

#import "OGESource.h"
#import "OGESourceCredentialsProviderImpl.h"
#import "OGESourceRegistry.h"
#import <OGio/OGCancellable.h>

@implementation OGESourceCredentialsProvider

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_CREDENTIALS_PROVIDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithRegistry:(OGESourceRegistry*)registry
{
	ESourceCredentialsProvider* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_source_credentials_provider_new([registry castedGObject]), ESourceCredentialsProvider, ESourceCredentialsProvider);

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

- (ESourceCredentialsProvider*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceCredentialsProvider, ESourceCredentialsProvider);
}

- (bool)canPrompt:(OGESource*)source
{
	bool returnValue = (bool)e_source_credentials_provider_can_prompt([self castedGObject], [source castedGObject]);

	return returnValue;
}

- (bool)canStore:(OGESource*)source
{
	bool returnValue = (bool)e_source_credentials_provider_can_store([self castedGObject], [source castedGObject]);

	return returnValue;
}

- (void)deleteWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_credentials_provider_delete([self castedGObject], [source castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)deleteFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_credentials_provider_delete_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)deleteSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_credentials_provider_delete_sync([self castedGObject], [source castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)lookupWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_credentials_provider_lookup([self castedGObject], [source castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)lookupFinishWithResult:(GAsyncResult*)result outCredentials:(ENamedParameters**)outCredentials
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_credentials_provider_lookup_finish([self castedGObject], result, outCredentials, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)lookupSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable outCredentials:(ENamedParameters**)outCredentials
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_credentials_provider_lookup_sync([self castedGObject], [source castedGObject], [cancellable castedGObject], outCredentials, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OGESource*)refCredentialsSource:(OGESource*)source
{
	ESource* gobjectValue = e_source_credentials_provider_ref_credentials_source([self castedGObject], [source castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GObject*)refRegistry
{
	GObject* returnValue = (GObject*)e_source_credentials_provider_ref_registry([self castedGObject]);

	return returnValue;
}

- (OGESource*)refSource:(OFString*)uid
{
	ESource* gobjectValue = e_source_credentials_provider_ref_source([self castedGObject], [uid UTF8String]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)registerImpl:(OGESourceCredentialsProviderImpl*)providerImpl
{
	bool returnValue = (bool)e_source_credentials_provider_register_impl([self castedGObject], [providerImpl castedGObject]);

	return returnValue;
}

- (void)storeWithSource:(OGESource*)source credentials:(const ENamedParameters*)credentials permanently:(bool)permanently cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_credentials_provider_store([self castedGObject], [source castedGObject], credentials, permanently, [cancellable castedGObject], callback, userData);
}

- (bool)storeFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_credentials_provider_store_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)storeSyncWithSource:(OGESource*)source credentials:(const ENamedParameters*)credentials permanently:(bool)permanently cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_credentials_provider_store_sync([self castedGObject], [source castedGObject], credentials, permanently, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)unregisterImpl:(OGESourceCredentialsProviderImpl*)providerImpl
{
	e_source_credentials_provider_unregister_impl([self castedGObject], [providerImpl castedGObject]);
}


@end