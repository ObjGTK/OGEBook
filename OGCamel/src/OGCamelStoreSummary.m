/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStoreSummary.h"

#import "OGCamelFolderSummary.h"

@implementation OGCamelStoreSummary

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_STORE_SUMMARY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)storeSummary
{
	CamelStoreSummary* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_store_summary_new(), CamelStoreSummary, CamelStoreSummary);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelStoreSummary* wrapperObject;
	@try {
		wrapperObject = [[OGCamelStoreSummary alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelStoreSummary*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStoreSummary, CamelStoreSummary);
}

- (void)addWithInfo:(CamelStoreInfo*)info
{
	camel_store_summary_add([self castedGObject], info);
}

- (CamelStoreInfo*)addFromPath:(OFString*)path
{
	CamelStoreInfo* returnValue = (CamelStoreInfo*)camel_store_summary_add_from_path([self castedGObject], [path UTF8String]);

	return returnValue;
}

- (GPtrArray*)array
{
	GPtrArray* returnValue = (GPtrArray*)camel_store_summary_array([self castedGObject]);

	return returnValue;
}

- (void)arrayFreeWithArray:(GPtrArray*)array
{
	camel_store_summary_array_free([self castedGObject], array);
}

- (bool)connectFolderSummaryWithPath:(OFString*)path folderSummary:(OGCamelFolderSummary*)folderSummary
{
	bool returnValue = (bool)camel_store_summary_connect_folder_summary([self castedGObject], [path UTF8String], [folderSummary castedGObject]);

	return returnValue;
}

- (gint)count
{
	gint returnValue = (gint)camel_store_summary_count([self castedGObject]);

	return returnValue;
}

- (bool)disconnectFolderSummary:(OGCamelFolderSummary*)folderSummary
{
	bool returnValue = (bool)camel_store_summary_disconnect_folder_summary([self castedGObject], [folderSummary castedGObject]);

	return returnValue;
}

- (CamelStoreInfo*)infoNew
{
	CamelStoreInfo* returnValue = (CamelStoreInfo*)camel_store_summary_info_new([self castedGObject]);

	return returnValue;
}

- (CamelStoreInfo*)infoRefWithInfo:(CamelStoreInfo*)info
{
	CamelStoreInfo* returnValue = (CamelStoreInfo*)camel_store_summary_info_ref([self castedGObject], info);

	return returnValue;
}

- (void)infoUnrefWithInfo:(CamelStoreInfo*)info
{
	camel_store_summary_info_unref([self castedGObject], info);
}

- (gint)load
{
	gint returnValue = (gint)camel_store_summary_load([self castedGObject]);

	return returnValue;
}

- (CamelStoreInfo*)pathWithPath:(OFString*)path
{
	CamelStoreInfo* returnValue = (CamelStoreInfo*)camel_store_summary_path([self castedGObject], [path UTF8String]);

	return returnValue;
}

- (void)removeWithInfo:(CamelStoreInfo*)info
{
	camel_store_summary_remove([self castedGObject], info);
}

- (void)removePath:(OFString*)path
{
	camel_store_summary_remove_path([self castedGObject], [path UTF8String]);
}

- (gint)save
{
	gint returnValue = (gint)camel_store_summary_save([self castedGObject]);

	return returnValue;
}

- (void)setFilename:(OFString*)filename
{
	camel_store_summary_set_filename([self castedGObject], [filename UTF8String]);
}

- (void)sortWithCompareFunc:(GCompareDataFunc)compareFunc userData:(gpointer)userData
{
	camel_store_summary_sort([self castedGObject], compareFunc, userData);
}

- (void)touch
{
	camel_store_summary_touch([self castedGObject]);
}


@end