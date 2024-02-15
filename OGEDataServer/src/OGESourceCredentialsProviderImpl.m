/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCredentialsProviderImpl.h"

#import "OGESourceCredentialsProvider.h"
#import "OGESource.h"
#import <OGio/OGCancellable.h>

@implementation OGESourceCredentialsProviderImpl

- (ESourceCredentialsProviderImpl*)castedGObject
{
	return E_SOURCE_CREDENTIALS_PROVIDER_IMPL([self gObject]);
}

- (bool)canProcess:(OGESource*)source
{
	bool returnValue = e_source_credentials_provider_impl_can_process([self castedGObject], [source castedGObject]);

	return returnValue;
}

- (bool)canPrompt
{
	bool returnValue = e_source_credentials_provider_impl_can_prompt([self castedGObject]);

	return returnValue;
}

- (bool)canStore
{
	bool returnValue = e_source_credentials_provider_impl_can_store([self castedGObject]);

	return returnValue;
}

- (bool)deleteSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_source_credentials_provider_impl_delete_sync([self castedGObject], [source castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OGESourceCredentialsProvider*)provider
{
	ESourceCredentialsProvider* gobjectValue = E_SOURCE_CREDENTIALS_PROVIDER(e_source_credentials_provider_impl_get_provider([self castedGObject]));

	OGESourceCredentialsProvider* returnValue = [OGESourceCredentialsProvider withGObject:gobjectValue];
	return returnValue;
}

- (bool)lookupSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable outCredentials:(ENamedParameters**)outCredentials
{
	GError* err = NULL;

	bool returnValue = e_source_credentials_provider_impl_lookup_sync([self castedGObject], [source castedGObject], [cancellable castedGObject], outCredentials, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)storeSyncWithSource:(OGESource*)source credentials:(const ENamedParameters*)credentials permanently:(bool)permanently cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_source_credentials_provider_impl_store_sync([self castedGObject], [source castedGObject], credentials, permanently, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end