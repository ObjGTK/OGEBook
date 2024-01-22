/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStoreSummary.h"

#import "OGCamelFolderSummary.h"

@implementation OGCamelStoreSummary

- (instancetype)init
{
	CamelStoreSummary* gobjectValue = CAMEL_STORE_SUMMARY(camel_store_summary_new());

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

- (CamelStoreSummary*)castedGObject
{
	return CAMEL_STORE_SUMMARY([self gObject]);
}

- (void)add:(CamelStoreInfo*)info
{
	camel_store_summary_add([self castedGObject], info);
}

- (CamelStoreInfo*)addFromPath:(OFString*)path
{
	CamelStoreInfo* returnValue = camel_store_summary_add_from_path([self castedGObject], [path UTF8String]);

	return returnValue;
}

- (GPtrArray*)array
{
	GPtrArray* returnValue = camel_store_summary_array([self castedGObject]);

	return returnValue;
}

- (void)arrayFree:(GPtrArray*)array
{
	camel_store_summary_array_free([self castedGObject], array);
}

- (bool)connectFolderSummaryWithPath:(OFString*)path folderSummary:(OGCamelFolderSummary*)folderSummary
{
	bool returnValue = camel_store_summary_connect_folder_summary([self castedGObject], [path UTF8String], [folderSummary castedGObject]);

	return returnValue;
}

- (gint)count
{
	gint returnValue = camel_store_summary_count([self castedGObject]);

	return returnValue;
}

- (bool)disconnectFolderSummary:(OGCamelFolderSummary*)folderSummary
{
	bool returnValue = camel_store_summary_disconnect_folder_summary([self castedGObject], [folderSummary castedGObject]);

	return returnValue;
}

- (CamelStoreInfo*)infoNew
{
	CamelStoreInfo* returnValue = camel_store_summary_info_new([self castedGObject]);

	return returnValue;
}

- (CamelStoreInfo*)infoRef:(CamelStoreInfo*)info
{
	CamelStoreInfo* returnValue = camel_store_summary_info_ref([self castedGObject], info);

	return returnValue;
}

- (void)infoUnref:(CamelStoreInfo*)info
{
	camel_store_summary_info_unref([self castedGObject], info);
}

- (gint)load
{
	gint returnValue = camel_store_summary_load([self castedGObject]);

	return returnValue;
}

- (CamelStoreInfo*)path:(OFString*)path
{
	CamelStoreInfo* returnValue = camel_store_summary_path([self castedGObject], [path UTF8String]);

	return returnValue;
}

- (void)remove:(CamelStoreInfo*)info
{
	camel_store_summary_remove([self castedGObject], info);
}

- (void)removePath:(OFString*)path
{
	camel_store_summary_remove_path([self castedGObject], [path UTF8String]);
}

- (gint)save
{
	gint returnValue = camel_store_summary_save([self castedGObject]);

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