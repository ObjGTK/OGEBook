/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelOfflineStore.h"

#import <OGio/OGCancellable.h>

@implementation OGCamelOfflineStore

- (CamelOfflineStore*)castedGObject
{
	return CAMEL_OFFLINE_STORE([self gObject]);
}

- (GPtrArray*)dupDownsyncFolders
{
	GPtrArray* returnValue = camel_offline_store_dup_downsync_folders([self castedGObject]);

	return returnValue;
}

- (bool)online
{
	bool returnValue = camel_offline_store_get_online([self castedGObject]);

	return returnValue;
}

- (bool)prepareForOfflineSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_offline_store_prepare_for_offline_sync([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)requiresDownsync
{
	bool returnValue = camel_offline_store_requires_downsync([self castedGObject]);

	return returnValue;
}

- (void)setOnlineWithOnline:(bool)online ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_offline_store_set_online([self castedGObject], online, ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)setOnlineFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = camel_offline_store_set_online_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)setOnlineSyncWithOnline:(bool)online cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_offline_store_set_online_sync([self castedGObject], online, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end