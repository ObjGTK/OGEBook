/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeDataCache.h"

#import "OGCamelVeeMessageInfoData.h"
#import "OGCamelVeeSubfolderData.h"
#import "OGCamelFolder.h"

@implementation OGCamelVeeDataCache

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_vee_data_cache_new()];

	return self;
}

- (CamelVeeDataCache*)VEEDATACACHE
{
	return CAMEL_VEE_DATA_CACHE([self GOBJECT]);
}

- (void)addSubfolder:(OGCamelFolder*)subfolder
{
	camel_vee_data_cache_add_subfolder([self VEEDATACACHE], [subfolder FOLDER]);
}

- (bool)containsMessageInfoDataWithFolder:(OGCamelFolder*)folder origMessageUid:(OFString*)origMessageUid
{
	return camel_vee_data_cache_contains_message_info_data([self VEEDATACACHE], [folder FOLDER], [origMessageUid UTF8String]);
}

- (void)foreachMessageInfoDataWithFromfolder:(OGCamelFolder*)fromfolder func:(CamelForeachInfoData)func userData:(gpointer)userData
{
	camel_vee_data_cache_foreach_message_info_data([self VEEDATACACHE], [fromfolder FOLDER], func, userData);
}

- (OGCamelVeeMessageInfoData*)messageInfoDataWithFolder:(OGCamelFolder*)folder origMessageUid:(OFString*)origMessageUid
{
	return [[[OGCamelVeeMessageInfoData alloc] initWithGObject:(GObject*)camel_vee_data_cache_get_message_info_data([self VEEDATACACHE], [folder FOLDER], [origMessageUid UTF8String])] autorelease];
}

- (OGCamelVeeMessageInfoData*)messageInfoDataByVuid:(OFString*)veeMessageUid
{
	return [[[OGCamelVeeMessageInfoData alloc] initWithGObject:(GObject*)camel_vee_data_cache_get_message_info_data_by_vuid([self VEEDATACACHE], [veeMessageUid UTF8String])] autorelease];
}

- (OGCamelVeeSubfolderData*)subfolderData:(OGCamelFolder*)folder
{
	return [[[OGCamelVeeSubfolderData alloc] initWithGObject:(GObject*)camel_vee_data_cache_get_subfolder_data([self VEEDATACACHE], [folder FOLDER])] autorelease];
}

- (void)removeMessageInfoData:(OGCamelVeeMessageInfoData*)miData
{
	camel_vee_data_cache_remove_message_info_data([self VEEDATACACHE], [miData VEEMESSAGEINFODATA]);
}

- (void)removeSubfolder:(OGCamelFolder*)subfolder
{
	camel_vee_data_cache_remove_subfolder([self VEEDATACACHE], [subfolder FOLDER]);
}


@end