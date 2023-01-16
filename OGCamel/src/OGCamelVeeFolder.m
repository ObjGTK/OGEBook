/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeFolder.h"

#import "OGCamelVeeMessageInfoData.h"
#import "OGCamelStore.h"

@implementation OGCamelVeeFolder

- (instancetype)initWithParentStore:(OGCamelStore*)parentStore full:(OFString*)full flags:(guint32)flags
{
	self = [super initWithGObject:(GObject*)camel_vee_folder_new([parentStore STORE], [full UTF8String], flags)];

	return self;
}

- (CamelVeeFolder*)VEEFOLDER
{
	return CAMEL_VEE_FOLDER([self GOBJECT]);
}

- (void)addFolderWithSubfolder:(OGCamelFolder*)subfolder cancellable:(GCancellable*)cancellable
{
	camel_vee_folder_add_folder([self VEEFOLDER], [subfolder FOLDER], cancellable);
}

- (void)addVuidWithMiData:(OGCamelVeeMessageInfoData*)miData changes:(CamelFolderChangeInfo*)changes
{
	camel_vee_folder_add_vuid([self VEEFOLDER], [miData VEEMESSAGEINFODATA], changes);
}

- (void)construct:(guint32)flags
{
	camel_vee_folder_construct([self VEEFOLDER], flags);
}

- (bool)autoUpdate
{
	return camel_vee_folder_get_auto_update([self VEEFOLDER]);
}

- (OFString*)expression
{
	return [OFString stringWithUTF8String:camel_vee_folder_get_expression([self VEEFOLDER])];
}

- (guint32)flags
{
	return camel_vee_folder_get_flags([self VEEFOLDER]);
}

- (OGCamelFolder*)locationWithVinfo:(const CamelVeeMessageInfo*)vinfo realuid:(gchar**)realuid
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_vee_folder_get_location([self VEEFOLDER], vinfo, realuid)] autorelease];
}

- (OGCamelFolder*)veeUidFolder:(OFString*)veeMessageUid
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_vee_folder_get_vee_uid_folder([self VEEFOLDER], [veeMessageUid UTF8String])] autorelease];
}

- (void)ignoreNextChangedEvent:(OGCamelFolder*)subfolder
{
	camel_vee_folder_ignore_next_changed_event([self VEEFOLDER], [subfolder FOLDER]);
}

- (void)propagateSkippedChanges
{
	camel_vee_folder_propagate_skipped_changes([self VEEFOLDER]);
}

- (void)rebuildFolderWithSubfolder:(OGCamelFolder*)subfolder cancellable:(GCancellable*)cancellable
{
	camel_vee_folder_rebuild_folder([self VEEFOLDER], [subfolder FOLDER], cancellable);
}

- (GList*)refFolders
{
	return camel_vee_folder_ref_folders([self VEEFOLDER]);
}

- (void)removeFolderWithSubfolder:(OGCamelFolder*)subfolder cancellable:(GCancellable*)cancellable
{
	camel_vee_folder_remove_folder([self VEEFOLDER], [subfolder FOLDER], cancellable);
}

- (void)removeFromIgnoreChangedEvent:(OGCamelFolder*)subfolder
{
	camel_vee_folder_remove_from_ignore_changed_event([self VEEFOLDER], [subfolder FOLDER]);
}

- (void)removeVuidWithMiData:(OGCamelVeeMessageInfoData*)miData changes:(CamelFolderChangeInfo*)changes
{
	camel_vee_folder_remove_vuid([self VEEFOLDER], [miData VEEMESSAGEINFODATA], changes);
}

- (void)setAutoUpdate:(bool)autoUpdate
{
	camel_vee_folder_set_auto_update([self VEEFOLDER], autoUpdate);
}

- (void)setExpression:(OFString*)expression
{
	camel_vee_folder_set_expression([self VEEFOLDER], [expression UTF8String]);
}

- (void)setFoldersWithFolders:(GList*)folders cancellable:(GCancellable*)cancellable
{
	camel_vee_folder_set_folders([self VEEFOLDER], folders, cancellable);
}


@end