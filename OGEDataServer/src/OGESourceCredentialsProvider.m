/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCredentialsProvider.h"

#import "OGESource.h"
#import "OGESourceRegistry.h"
#import "OGESourceCredentialsProviderImpl.h"

@implementation OGESourceCredentialsProvider

- (instancetype)init:(OGESourceRegistry*)registry
{
	self = [super initWithGObject:(GObject*)e_source_credentials_provider_new([registry SOURCEREGISTRY])];

	return self;
}

- (ESourceCredentialsProvider*)SOURCECREDENTIALSPROVIDER
{
	return E_SOURCE_CREDENTIALS_PROVIDER([self GOBJECT]);
}

- (bool)canPrompt:(OGESource*)source
{
	return e_source_credentials_provider_can_prompt([self SOURCECREDENTIALSPROVIDER], [source SOURCE]);
}

- (bool)canStore:(OGESource*)source
{
	return e_source_credentials_provider_can_store([self SOURCECREDENTIALSPROVIDER], [source SOURCE]);
}

- (void)deleteWithSource:(OGESource*)source cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_credentials_provider_delete([self SOURCECREDENTIALSPROVIDER], [source SOURCE], cancellable, callback, userData);
}

- (bool)deleteFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_credentials_provider_delete_finish([self SOURCECREDENTIALSPROVIDER], result, err);
}

- (bool)deleteSyncWithSource:(OGESource*)source cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_credentials_provider_delete_sync([self SOURCECREDENTIALSPROVIDER], [source SOURCE], cancellable, err);
}

- (void)lookupWithSource:(OGESource*)source cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_credentials_provider_lookup([self SOURCECREDENTIALSPROVIDER], [source SOURCE], cancellable, callback, userData);
}

- (bool)lookupFinishWithResult:(GAsyncResult*)result outCredentials:(ENamedParameters**)outCredentials err:(GError**)err
{
	return e_source_credentials_provider_lookup_finish([self SOURCECREDENTIALSPROVIDER], result, outCredentials, err);
}

- (bool)lookupSyncWithSource:(OGESource*)source cancellable:(GCancellable*)cancellable outCredentials:(ENamedParameters**)outCredentials err:(GError**)err
{
	return e_source_credentials_provider_lookup_sync([self SOURCECREDENTIALSPROVIDER], [source SOURCE], cancellable, outCredentials, err);
}

- (OGESource*)refCredentialsSource:(OGESource*)source
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_credentials_provider_ref_credentials_source([self SOURCECREDENTIALSPROVIDER], [source SOURCE])] autorelease];
}

- (GObject*)refRegistry
{
	return e_source_credentials_provider_ref_registry([self SOURCECREDENTIALSPROVIDER]);
}

- (OGESource*)refSource:(OFString*)uid
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_credentials_provider_ref_source([self SOURCECREDENTIALSPROVIDER], [uid UTF8String])] autorelease];
}

- (bool)registerImpl:(OGESourceCredentialsProviderImpl*)providerImpl
{
	return e_source_credentials_provider_register_impl([self SOURCECREDENTIALSPROVIDER], [providerImpl SOURCECREDENTIALSPROVIDERIMPL]);
}

- (void)storeWithSource:(OGESource*)source credentials:(const ENamedParameters*)credentials permanently:(bool)permanently cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_source_credentials_provider_store([self SOURCECREDENTIALSPROVIDER], [source SOURCE], credentials, permanently, cancellable, callback, userData);
}

- (bool)storeFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_source_credentials_provider_store_finish([self SOURCECREDENTIALSPROVIDER], result, err);
}

- (bool)storeSyncWithSource:(OGESource*)source credentials:(const ENamedParameters*)credentials permanently:(bool)permanently cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_credentials_provider_store_sync([self SOURCECREDENTIALSPROVIDER], [source SOURCE], credentials, permanently, cancellable, err);
}

- (void)unregisterImpl:(OGESourceCredentialsProviderImpl*)providerImpl
{
	e_source_credentials_provider_unregister_impl([self SOURCECREDENTIALSPROVIDER], [providerImpl SOURCECREDENTIALSPROVIDERIMPL]);
}


@end