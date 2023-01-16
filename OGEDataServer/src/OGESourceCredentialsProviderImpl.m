/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCredentialsProviderImpl.h"

#import "OGESource.h"
#import "OGESourceCredentialsProvider.h"

@implementation OGESourceCredentialsProviderImpl

- (ESourceCredentialsProviderImpl*)SOURCECREDENTIALSPROVIDERIMPL
{
	return E_SOURCE_CREDENTIALS_PROVIDER_IMPL([self GOBJECT]);
}

- (bool)canProcess:(OGESource*)source
{
	return e_source_credentials_provider_impl_can_process([self SOURCECREDENTIALSPROVIDERIMPL], [source SOURCE]);
}

- (bool)canPrompt
{
	return e_source_credentials_provider_impl_can_prompt([self SOURCECREDENTIALSPROVIDERIMPL]);
}

- (bool)canStore
{
	return e_source_credentials_provider_impl_can_store([self SOURCECREDENTIALSPROVIDERIMPL]);
}

- (bool)deleteSyncWithSource:(OGESource*)source cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_credentials_provider_impl_delete_sync([self SOURCECREDENTIALSPROVIDERIMPL], [source SOURCE], cancellable, err);
}

- (OGESourceCredentialsProvider*)provider
{
	return [[[OGESourceCredentialsProvider alloc] initWithGObject:(GObject*)e_source_credentials_provider_impl_get_provider([self SOURCECREDENTIALSPROVIDERIMPL])] autorelease];
}

- (bool)lookupSyncWithSource:(OGESource*)source cancellable:(GCancellable*)cancellable outCredentials:(ENamedParameters**)outCredentials err:(GError**)err
{
	return e_source_credentials_provider_impl_lookup_sync([self SOURCECREDENTIALSPROVIDERIMPL], [source SOURCE], cancellable, outCredentials, err);
}

- (bool)storeSyncWithSource:(OGESource*)source credentials:(const ENamedParameters*)credentials permanently:(bool)permanently cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_source_credentials_provider_impl_store_sync([self SOURCECREDENTIALSPROVIDERIMPL], [source SOURCE], credentials, permanently, cancellable, err);
}


@end