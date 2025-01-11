/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeDataCache.h"

#import "OGCamelFolder.h"
#import "OGCamelVeeMessageInfoData.h"
#import "OGCamelVeeSubfolderData.h"

@implementation OGCamelVeeDataCache

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_VEE_DATA_CACHE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)veeDataCache
{
	CamelVeeDataCache* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_data_cache_new(), CamelVeeDataCache, CamelVeeDataCache);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelVeeDataCache* wrapperObject;
	@try {
		wrapperObject = [[OGCamelVeeDataCache alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelVeeDataCache*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelVeeDataCache, CamelVeeDataCache);
}

- (void)addSubfolder:(OGCamelFolder*)subfolder
{
	camel_vee_data_cache_add_subfolder([self castedGObject], [subfolder castedGObject]);
}

- (bool)containsMessageInfoDataWithFolder:(OGCamelFolder*)folder origMessageUid:(OFString*)origMessageUid
{
	bool returnValue = (bool)camel_vee_data_cache_contains_message_info_data([self castedGObject], [folder castedGObject], [origMessageUid UTF8String]);

	return returnValue;
}

- (void)foreachMessageInfoDataWithFromfolder:(OGCamelFolder*)fromfolder func:(CamelForeachInfoData)func userData:(gpointer)userData
{
	camel_vee_data_cache_foreach_message_info_data([self castedGObject], [fromfolder castedGObject], func, userData);
}

- (OGCamelVeeMessageInfoData*)messageInfoDataWithFolder:(OGCamelFolder*)folder origMessageUid:(OFString*)origMessageUid
{
	CamelVeeMessageInfoData* gobjectValue = camel_vee_data_cache_get_message_info_data([self castedGObject], [folder castedGObject], [origMessageUid UTF8String]);

	OGCamelVeeMessageInfoData* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelVeeMessageInfoData*)messageInfoDataByVuid:(OFString*)veeMessageUid
{
	CamelVeeMessageInfoData* gobjectValue = camel_vee_data_cache_get_message_info_data_by_vuid([self castedGObject], [veeMessageUid UTF8String]);

	OGCamelVeeMessageInfoData* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGCamelVeeSubfolderData*)subfolderData:(OGCamelFolder*)folder
{
	CamelVeeSubfolderData* gobjectValue = camel_vee_data_cache_get_subfolder_data([self castedGObject], [folder castedGObject]);

	OGCamelVeeSubfolderData* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
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