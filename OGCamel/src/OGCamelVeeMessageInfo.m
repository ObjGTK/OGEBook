/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeMessageInfo.h"

#import "OGCamelFolder.h"
#import "OGCamelFolderSummary.h"

@implementation OGCamelVeeMessageInfo

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_VEE_MESSAGE_INFO;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)veeMessageInfoWithSummary:(OGCamelFolderSummary*)summary originalSummary:(OGCamelFolderSummary*)originalSummary vuid:(OFString*)vuid
{
	CamelVeeMessageInfo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_message_info_new([summary castedGObject], [originalSummary castedGObject], [vuid UTF8String]), CamelVeeMessageInfo, CamelVeeMessageInfo);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelVeeMessageInfo* wrapperObject;
	@try {
		wrapperObject = [[OGCamelVeeMessageInfo alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelVeeMessageInfo*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelVeeMessageInfo, CamelVeeMessageInfo);
}

- (OGCamelFolder*)originalFolder
{
	CamelFolder* gobjectValue = camel_vee_message_info_get_original_folder([self castedGObject]);

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGCamelFolderSummary*)originalSummary
{
	CamelFolderSummary* gobjectValue = camel_vee_message_info_get_original_summary([self castedGObject]);

	OGCamelFolderSummary* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end