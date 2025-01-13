/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCredentialsProviderImpl.h"

#import "OGESource.h"
#import "OGESourceCredentialsProvider.h"
#import <OGio/OGCancellable.h>

@implementation OGESourceCredentialsProviderImpl

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_CREDENTIALS_PROVIDER_IMPL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceCredentialsProviderImpl*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceCredentialsProviderImpl, ESourceCredentialsProviderImpl);
}

- (bool)canProcessWithSource:(OGESource*)source
{
	bool returnValue = (bool)e_source_credentials_provider_impl_can_process([self castedGObject], [source castedGObject]);

	return returnValue;
}

- (bool)canPrompt
{
	bool returnValue = (bool)e_source_credentials_provider_impl_can_prompt([self castedGObject]);

	return returnValue;
}

- (bool)canStore
{
	bool returnValue = (bool)e_source_credentials_provider_impl_can_store([self castedGObject]);

	return returnValue;
}

- (bool)deleteSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_credentials_provider_impl_delete_sync([self castedGObject], [source castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OGESourceCredentialsProvider*)provider
{
	ESourceCredentialsProvider* gobjectValue = e_source_credentials_provider_impl_get_provider([self castedGObject]);

	OGESourceCredentialsProvider* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)lookupSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable outCredentials:(ENamedParameters**)outCredentials
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_credentials_provider_impl_lookup_sync([self castedGObject], [source castedGObject], [cancellable castedGObject], outCredentials, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)storeSyncWithSource:(OGESource*)source credentials:(const ENamedParameters*)credentials permanently:(bool)permanently cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_source_credentials_provider_impl_store_sync([self castedGObject], [source castedGObject], credentials, permanently, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end