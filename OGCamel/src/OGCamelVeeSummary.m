/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeSummary.h"

#import "OGCamelVeeMessageInfoData.h"
#import "OGCamelVeeMessageInfo.h"
#import "OGCamelFolder.h"

@implementation OGCamelVeeSummary

- (instancetype)init:(OGCamelFolder*)parent
{
	CamelVeeSummary* gobjectValue = CAMEL_VEE_SUMMARY(camel_vee_summary_new([parent castedGObject]));

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

- (CamelVeeSummary*)castedGObject
{
	return CAMEL_VEE_SUMMARY([self gObject]);
}

- (OGCamelVeeMessageInfo*)add:(OGCamelVeeMessageInfoData*)miData
{
	CamelVeeMessageInfo* gobjectValue = CAMEL_VEE_MESSAGE_INFO(camel_vee_summary_add([self castedGObject], [miData castedGObject]));

	OGCamelVeeMessageInfo* returnValue = [OGCamelVeeMessageInfo wrapperFor:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GHashTable*)uidsForSubfolder:(OGCamelFolder*)subfolder
{
	GHashTable* returnValue = camel_vee_summary_get_uids_for_subfolder([self castedGObject], [subfolder castedGObject]);

	return returnValue;
}

- (void)removeWithVuid:(OFString*)vuid subfolder:(OGCamelFolder*)subfolder
{
	camel_vee_summary_remove([self castedGObject], [vuid UTF8String], [subfolder castedGObject]);
}

- (void)replaceFlags:(OFString*)uid
{
	camel_vee_summary_replace_flags([self castedGObject], [uid UTF8String]);
}


@end