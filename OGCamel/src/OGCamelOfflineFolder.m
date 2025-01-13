/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelOfflineFolder.h"

#import <OGio/OGCancellable.h>

@implementation OGCamelOfflineFolder

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_OFFLINE_FOLDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelOfflineFolder*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelOfflineFolder, CamelOfflineFolder);
}

- (bool)canDownsync
{
	bool returnValue = (bool)camel_offline_folder_can_downsync([self castedGObject]);

	return returnValue;
}

- (void)downsyncWithExpression:(OFString*)expression ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_offline_folder_downsync([self castedGObject], [expression UTF8String], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)downsyncFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_offline_folder_downsync_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)downsyncSyncWithExpression:(OFString*)expression cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_offline_folder_downsync_sync([self castedGObject], [expression UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (CamelThreeState)offlineSync
{
	CamelThreeState returnValue = (CamelThreeState)camel_offline_folder_get_offline_sync([self castedGObject]);

	return returnValue;
}

- (void)setOfflineSync:(CamelThreeState)offlineSync
{
	camel_offline_folder_set_offline_sync([self castedGObject], offlineSync);
}


@end