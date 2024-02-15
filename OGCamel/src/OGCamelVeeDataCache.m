/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeDataCache.h"

#import "OGCamelVeeSubfolderData.h"
#import "OGCamelFolder.h"
#import "OGCamelVeeMessageInfoData.h"

@implementation OGCamelVeeDataCache

- (instancetype)init
{
	CamelVeeDataCache* gobjectValue = CAMEL_VEE_DATA_CACHE(camel_vee_data_cache_new());

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

- (CamelVeeDataCache*)castedGObject
{
	return CAMEL_VEE_DATA_CACHE([self gObject]);
}

- (void)addSubfolder:(OGCamelFolder*)subfolder
{
	camel_vee_data_cache_add_subfolder([self castedGObject], [subfolder castedGObject]);
}

- (bool)containsMessageInfoDataWithFolder:(OGCamelFolder*)folder origMessageUid:(OFString*)origMessageUid
{
	bool returnValue = camel_vee_data_cache_contains_message_info_data([self castedGObject], [folder castedGObject], [origMessageUid UTF8String]);

	return returnValue;
}

- (void)foreachMessageInfoDataWithFromfolder:(OGCamelFolder*)fromfolder func:(CamelForeachInfoData)func userData:(gpointer)userData
{
	camel_vee_data_cache_foreach_message_info_data([self castedGObject], [fromfolder castedGObject], func, userData);
}

- (OGCamelVeeMessageInfoData*)messageInfoDataWithFolder:(OGCamelFolder*)folder origMessageUid:(OFString*)origMessageUid
{
	CamelVeeMessageInfoData* gobjectValue = CAMEL_VEE_MESSAGE_INFO_DATA(camel_vee_data_cache_get_message_info_data([self castedGObject], [folder castedGObject], [origMessageUid UTF8String]));

	OGCamelVeeMessageInfoData* returnValue = [OGCamelVeeMessageInfoData withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelVeeMessageInfoData*)messageInfoDataByVuid:(OFString*)veeMessageUid
{
	CamelVeeMessageInfoData* gobjectValue = CAMEL_VEE_MESSAGE_INFO_DATA(camel_vee_data_cache_get_message_info_data_by_vuid([self castedGObject], [veeMessageUid UTF8String]));

	OGCamelVeeMessageInfoData* returnValue = [OGCamelVeeMessageInfoData withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelVeeSubfolderData*)subfolderData:(OGCamelFolder*)folder
{
	CamelVeeSubfolderData* gobjectValue = CAMEL_VEE_SUBFOLDER_DATA(camel_vee_data_cache_get_subfolder_data([self castedGObject], [folder castedGObject]));

	OGCamelVeeSubfolderData* returnValue = [OGCamelVeeSubfolderData withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)removeMessageInfoData:(OGCamelVeeMessageInfoData*)miData
{
	camel_vee_data_cache_remove_message_info_data([self castedGObject], [miData castedGObject]);
}

- (void)removeSubfolder:(OGCamelFolder*)subfolder
{
	camel_vee_data_cache_remove_subfolder([self castedGObject], [subfolder castedGObject]);
}


@end