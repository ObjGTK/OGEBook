/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelOfflineStore.h"

@implementation OGCamelOfflineStore

- (CamelOfflineStore*)OFFLINESTORE
{
	return CAMEL_OFFLINE_STORE([self GOBJECT]);
}

- (GPtrArray*)dupDownsyncFolders
{
	return camel_offline_store_dup_downsync_folders([self OFFLINESTORE]);
}

- (bool)online
{
	return camel_offline_store_get_online([self OFFLINESTORE]);
}

- (bool)prepareForOfflineSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_offline_store_prepare_for_offline_sync([self OFFLINESTORE], cancellable, err);
}

- (bool)requiresDownsync
{
	return camel_offline_store_requires_downsync([self OFFLINESTORE]);
}

- (void)setOnlineWithOnline:(bool)online ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_offline_store_set_online([self OFFLINESTORE], online, ioPriority, cancellable, callback, userData);
}

- (bool)setOnlineFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_offline_store_set_online_finish([self OFFLINESTORE], result, err);
}

- (bool)setOnlineSyncWithOnline:(bool)online cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_offline_store_set_online_sync([self OFFLINESTORE], online, cancellable, err);
}


@end