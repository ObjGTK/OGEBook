/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelOfflineStore.h"

#import <OGio/OGCancellable.h>

@implementation OGCamelOfflineStore

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_OFFLINE_STORE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelOfflineStore*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelOfflineStore, CamelOfflineStore);
}

- (GPtrArray*)dupDownsyncFolders
{
	GPtrArray* returnValue = (GPtrArray*)camel_offline_store_dup_downsync_folders([self castedGObject]);

	return returnValue;
}

- (bool)online
{
	bool returnValue = (bool)camel_offline_store_get_online([self castedGObject]);

	return returnValue;
}

- (bool)prepareForOfflineSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_offline_store_prepare_for_offline_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)requiresDownsync
{
	bool returnValue = (bool)camel_offline_store_requires_downsync([self castedGObject]);

	return returnValue;
}

- (void)setOnlineWithOnline:(bool)online ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_offline_store_set_online([self castedGObject], online, ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)setOnlineFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_offline_store_set_online_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)setOnlineSyncWithOnline:(bool)online cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_offline_store_set_online_sync([self castedGObject], online, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end