/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStoreSummary.h"

#import "OGCamelFolderSummary.h"

@implementation OGCamelStoreSummary

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_store_summary_new()];

	return self;
}

- (CamelStoreSummary*)STORESUMMARY
{
	return CAMEL_STORE_SUMMARY([self GOBJECT]);
}

- (void)add:(CamelStoreInfo*)info
{
	camel_store_summary_add([self STORESUMMARY], info);
}

- (CamelStoreInfo*)addFromPath:(OFString*)path
{
	return camel_store_summary_add_from_path([self STORESUMMARY], [path UTF8String]);
}

- (GPtrArray*)array
{
	return camel_store_summary_array([self STORESUMMARY]);
}

- (void)arrayFree:(GPtrArray*)array
{
	camel_store_summary_array_free([self STORESUMMARY], array);
}

- (bool)connectFolderSummaryWithPath:(OFString*)path folderSummary:(OGCamelFolderSummary*)folderSummary
{
	return camel_store_summary_connect_folder_summary([self STORESUMMARY], [path UTF8String], [folderSummary FOLDERSUMMARY]);
}

- (gint)count
{
	return camel_store_summary_count([self STORESUMMARY]);
}

- (bool)disconnectFolderSummary:(OGCamelFolderSummary*)folderSummary
{
	return camel_store_summary_disconnect_folder_summary([self STORESUMMARY], [folderSummary FOLDERSUMMARY]);
}

- (CamelStoreInfo*)infoNew
{
	return camel_store_summary_info_new([self STORESUMMARY]);
}

- (CamelStoreInfo*)infoRef:(CamelStoreInfo*)info
{
	return camel_store_summary_info_ref([self STORESUMMARY], info);
}

- (void)infoUnref:(CamelStoreInfo*)info
{
	camel_store_summary_info_unref([self STORESUMMARY], info);
}

- (gint)load
{
	return camel_store_summary_load([self STORESUMMARY]);
}

- (CamelStoreInfo*)path:(OFString*)path
{
	return camel_store_summary_path([self STORESUMMARY], [path UTF8String]);
}

- (void)remove:(CamelStoreInfo*)info
{
	camel_store_summary_remove([self STORESUMMARY], info);
}

- (void)removePath:(OFString*)path
{
	camel_store_summary_remove_path([self STORESUMMARY], [path UTF8String]);
}

- (gint)save
{
	return camel_store_summary_save([self STORESUMMARY]);
}

- (void)setFilename:(OFString*)filename
{
	camel_store_summary_set_filename([self STORESUMMARY], [filename UTF8String]);
}

- (void)sortWithCompareFunc:(GCompareDataFunc)compareFunc userData:(gpointer)userData
{
	camel_store_summary_sort([self STORESUMMARY], compareFunc, userData);
}

- (void)touch
{
	camel_store_summary_touch([self STORESUMMARY]);
}


@end