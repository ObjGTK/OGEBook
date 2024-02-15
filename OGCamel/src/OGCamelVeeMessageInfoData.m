/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeMessageInfoData.h"

#import "OGCamelVeeSubfolderData.h"

@implementation OGCamelVeeMessageInfoData

- (instancetype)initWithSubfolderData:(OGCamelVeeSubfolderData*)subfolderData origMessageUid:(OFString*)origMessageUid
{
	CamelVeeMessageInfoData* gobjectValue = CAMEL_VEE_MESSAGE_INFO_DATA(camel_vee_message_info_data_new([subfolderData castedGObject], [origMessageUid UTF8String]));

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

- (CamelVeeMessageInfoData*)castedGObject
{
	return CAMEL_VEE_MESSAGE_INFO_DATA([self gObject]);
}

- (OFString*)origMessageUid
{
	const gchar* gobjectValue = camel_vee_message_info_data_get_orig_message_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGCamelVeeSubfolderData*)subfolderData
{
	CamelVeeSubfolderData* gobjectValue = CAMEL_VEE_SUBFOLDER_DATA(camel_vee_message_info_data_get_subfolder_data([self castedGObject]));

	OGCamelVeeSubfolderData* returnValue = [OGCamelVeeSubfolderData withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)veeMessageUid
{
	const gchar* gobjectValue = camel_vee_message_info_data_get_vee_message_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end