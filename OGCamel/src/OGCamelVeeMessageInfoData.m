/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeMessageInfoData.h"

#import "OGCamelVeeSubfolderData.h"

@implementation OGCamelVeeMessageInfoData

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_VEE_MESSAGE_INFO_DATA;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)veeMessageInfoDataWithSubfolderData:(OGCamelVeeSubfolderData*)subfolderData origMessageUid:(OFString*)origMessageUid
{
	CamelVeeMessageInfoData* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_message_info_data_new([subfolderData castedGObject], [origMessageUid UTF8String]), CamelVeeMessageInfoData, CamelVeeMessageInfoData);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelVeeMessageInfoData* wrapperObject;
	@try {
		wrapperObject = [[OGCamelVeeMessageInfoData alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelVeeMessageInfoData*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelVeeMessageInfoData, CamelVeeMessageInfoData);
}

- (OFString*)origMessageUid
{
	const gchar* gobjectValue = camel_vee_message_info_data_get_orig_message_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGCamelVeeSubfolderData*)subfolderData
{
	CamelVeeSubfolderData* gobjectValue = camel_vee_message_info_data_get_subfolder_data([self castedGObject]);

	OGCamelVeeSubfolderData* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)veeMessageUid
{
	const gchar* gobjectValue = camel_vee_message_info_data_get_vee_message_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end