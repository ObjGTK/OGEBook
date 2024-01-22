/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelOfflineFolder.h"

#import <OGio/OGCancellable.h>

@implementation OGCamelOfflineFolder

- (CamelOfflineFolder*)castedGObject
{
	return CAMEL_OFFLINE_FOLDER([self gObject]);
}

- (bool)canDownsync
{
	bool returnValue = camel_offline_folder_can_downsync([self castedGObject]);

	return returnValue;
}

- (void)downsyncWithExpression:(OFString*)expression ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_offline_folder_downsync([self castedGObject], [expression UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)downsyncFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = camel_offline_folder_downsync_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)downsyncSyncWithExpression:(OFString*)expression cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_offline_folder_downsync_sync([self castedGObject], [expression UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (CamelThreeState)offlineSync
{
	CamelThreeState returnValue = camel_offline_folder_get_offline_sync([self castedGObject]);

	return returnValue;
}

- (void)setOfflineSync:(CamelThreeState)offlineSync
{
	camel_offline_folder_set_offline_sync([self castedGObject], offlineSync);
}


@end