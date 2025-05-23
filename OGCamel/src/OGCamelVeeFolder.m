/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeFolder.h"

#import "OGCamelStore.h"
#import "OGCamelVeeMessageInfoData.h"
#import <OGio/OGCancellable.h>

@implementation OGCamelVeeFolder

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_VEE_FOLDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)veeFolderWithParentStore:(OGCamelStore*)parentStore full:(OFString*)full flags:(guint32)flags
{
	CamelVeeFolder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_folder_new([parentStore castedGObject], [full UTF8String], flags), CamelVeeFolder, CamelVeeFolder);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelVeeFolder* wrapperObject;
	@try {
		wrapperObject = [[OGCamelVeeFolder alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelVeeFolder*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelVeeFolder, CamelVeeFolder);
}

- (void)addFolderWithSubfolder:(OGCamelFolder*)subfolder cancellable:(OGCancellable*)cancellable
{
	camel_vee_folder_add_folder([self castedGObject], [subfolder castedGObject], [cancellable castedGObject]);
}

- (void)addVuidWithMiData:(OGCamelVeeMessageInfoData*)miData changes:(CamelFolderChangeInfo*)changes
{
	camel_vee_folder_add_vuid([self castedGObject], [miData castedGObject], changes);
}

- (void)constructWithFlags:(guint32)flags
{
	camel_vee_folder_construct([self castedGObject], flags);
}

- (bool)autoUpdate
{
	bool returnValue = (bool)camel_vee_folder_get_auto_update([self castedGObject]);

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
	guint32 returnValue = (guint32)camel_vee_folder_get_flags([self castedGObject]);

	return returnValue;
}

- (OGCamelFolder*)locationWithVinfo:(const CamelVeeMessageInfo*)vinfo realuid:(gchar**)realuid
{
	CamelFolder* gobjectValue = camel_vee_folder_get_location([self castedGObject], vinfo, realuid);

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGCamelFolder*)veeUidFolderWithVeeMessageUid:(OFString*)veeMessageUid
{
	CamelFolder* gobjectValue = camel_vee_folder_get_vee_uid_folder([self castedGObject], [veeMessageUid UTF8String]);

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)ignoreNextChangedEventWithSubfolder:(OGCamelFolder*)subfolder
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
	GList* returnValue = (GList*)camel_vee_folder_ref_folders([self castedGObject]);

	return returnValue;
}

- (void)removeFolderWithSubfolder:(OGCamelFolder*)subfolder cancellable:(OGCancellable*)cancellable
{
	camel_vee_folder_remove_folder([self castedGObject], [subfolder castedGObject], [cancellable castedGObject]);
}

- (void)removeFromIgnoreChangedEventWithSubfolder:(OGCamelFolder*)subfolder
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

- (void)setFolders:(GList*)folders cancellable:(OGCancellable*)cancellable
{
	camel_vee_folder_set_folders([self castedGObject], folders, [cancellable castedGObject]);
}


@end