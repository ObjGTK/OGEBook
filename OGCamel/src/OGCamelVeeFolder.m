/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeFolder.h"

#import <OGio/OGCancellable.h>
#import "OGCamelVeeMessageInfoData.h"
#import "OGCamelStore.h"

@implementation OGCamelVeeFolder

- (instancetype)initWithParentStore:(OGCamelStore*)parentStore full:(OFString*)full flags:(guint32)flags
{
	CamelVeeFolder* gobjectValue = CAMEL_VEE_FOLDER(camel_vee_folder_new([parentStore castedGObject], [full UTF8String], flags));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (CamelVeeFolder*)castedGObject
{
	return CAMEL_VEE_FOLDER([self gObject]);
}

- (void)addFolderWithSubfolder:(OGCamelFolder*)subfolder cancellable:(OGCancellable*)cancellable
{
	camel_vee_folder_add_folder([self castedGObject], [subfolder castedGObject], [cancellable castedGObject]);
}

- (void)addVuidWithMiData:(OGCamelVeeMessageInfoData*)miData changes:(CamelFolderChangeInfo*)changes
{
	camel_vee_folder_add_vuid([self castedGObject], [miData castedGObject], changes);
}

- (void)construct:(guint32)flags
{
	camel_vee_folder_construct([self castedGObject], flags);
}

- (bool)autoUpdate
{
	bool returnValue = camel_vee_folder_get_auto_update([self castedGObject]);

	return returnValue;
}

- (OFString*)expression
{
	const gchar* gobjectValue = camel_vee_folder_get_expression([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint32)flags
{
	guint32 returnValue = camel_vee_folder_get_flags([self castedGObject]);

	return returnValue;
}

- (OGCamelFolder*)locationWithVinfo:(const CamelVeeMessageInfo*)vinfo realuid:(gchar**)realuid
{
	CamelFolder* gobjectValue = CAMEL_FOLDER(camel_vee_folder_get_location([self castedGObject], vinfo, realuid));

	OGCamelFolder* returnValue = [OGCamelFolder withGObject:gobjectValue];
	return returnValue;
}

- (OGCamelFolder*)veeUidFolder:(OFString*)veeMessageUid
{
	CamelFolder* gobjectValue = CAMEL_FOLDER(camel_vee_folder_get_vee_uid_folder([self castedGObject], [veeMessageUid UTF8String]));

	OGCamelFolder* returnValue = [OGCamelFolder withGObject:gobjectValue];
	return returnValue;
}

- (void)ignoreNextChangedEvent:(OGCamelFolder*)subfolder
{
	camel_vee_folder_ignore_next_changed_event([self castedGObject], [subfolder castedGObject]);
}

- (void)propagateSkippedChanges
{
	camel_vee_folder_propagate_skipped_changes([self castedGObject]);
}

- (void)rebuildFolderWithSubfolder:(OGCamelFolder*)subfolder cancellable:(OGCancellable*)cancellable
{
	camel_vee_folder_rebuild_folder([self castedGObject], [subfolder castedGObject], [cancellable castedGObject]);
}

- (GList*)refFolders
{
	GList* returnValue = camel_vee_folder_ref_folders([self castedGObject]);

	return returnValue;
}

- (void)removeFolderWithSubfolder:(OGCamelFolder*)subfolder cancellable:(OGCancellable*)cancellable
{
	camel_vee_folder_remove_folder([self castedGObject], [subfolder castedGObject], [cancellable castedGObject]);
}

- (void)removeFromIgnoreChangedEvent:(OGCamelFolder*)subfolder
{
	camel_vee_folder_remove_from_ignore_changed_event([self castedGObject], [subfolder castedGObject]);
}

- (void)removeVuidWithMiData:(OGCamelVeeMessageInfoData*)miData changes:(CamelFolderChangeInfo*)changes
{
	camel_vee_folder_remove_vuid([self castedGObject], [miData castedGObject], changes);
}

- (void)setAutoUpdate:(bool)autoUpdate
{
	camel_vee_folder_set_auto_update([self castedGObject], autoUpdate);
}

- (void)setExpression:(OFString*)expression
{
	camel_vee_folder_set_expression([self castedGObject], [expression UTF8String]);
}

- (void)setFoldersWithFolders:(GList*)folders cancellable:(OGCancellable*)cancellable
{
	camel_vee_folder_set_folders([self castedGObject], folders, [cancellable castedGObject]);
}


@end