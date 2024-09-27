/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeMessageInfo.h"

#import "OGCamelFolder.h"
#import "OGCamelFolderSummary.h"

@implementation OGCamelVeeMessageInfo

- (instancetype)initWithSummary:(OGCamelFolderSummary*)summary originalSummary:(OGCamelFolderSummary*)originalSummary vuid:(OFString*)vuid
{
	CamelVeeMessageInfo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_message_info_new([summary castedGObject], [originalSummary castedGObject], [vuid UTF8String]), CamelVeeMessageInfo, CamelVeeMessageInfo);

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

- (CamelVeeMessageInfo*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelVeeMessageInfo, CamelVeeMessageInfo);
}

- (OGCamelFolder*)originalFolder
{
	CamelFolder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_message_info_get_original_folder([self castedGObject]), CamelFolder, CamelFolder);

	OGCamelFolder* returnValue = [OGCamelFolder withGObject:gobjectValue];
	return returnValue;
}

- (OGCamelFolderSummary*)originalSummary
{
	CamelFolderSummary* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_message_info_get_original_summary([self castedGObject]), CamelFolderSummary, CamelFolderSummary);

	OGCamelFolderSummary* returnValue = [OGCamelFolderSummary withGObject:gobjectValue];
	return returnValue;
}


@end