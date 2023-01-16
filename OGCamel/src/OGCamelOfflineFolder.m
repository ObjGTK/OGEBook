/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelOfflineFolder.h"

@implementation OGCamelOfflineFolder

- (CamelOfflineFolder*)OFFLINEFOLDER
{
	return CAMEL_OFFLINE_FOLDER([self GOBJECT]);
}

- (bool)canDownsync
{
	return camel_offline_folder_can_downsync([self OFFLINEFOLDER]);
}

- (void)downsyncWithExpression:(OFString*)expression ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_offline_folder_downsync([self OFFLINEFOLDER], [expression UTF8String], ioPriority, cancellable, callback, userData);
}

- (bool)downsyncFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_offline_folder_downsync_finish([self OFFLINEFOLDER], result, err);
}

- (bool)downsyncSyncWithExpression:(OFString*)expression cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_offline_folder_downsync_sync([self OFFLINEFOLDER], [expression UTF8String], cancellable, err);
}

- (CamelThreeState)offlineSync
{
	return camel_offline_folder_get_offline_sync([self OFFLINEFOLDER]);
}

- (void)setOfflineSync:(CamelThreeState)offlineSync
{
	camel_offline_folder_set_offline_sync([self OFFLINEFOLDER], offlineSync);
}


@end