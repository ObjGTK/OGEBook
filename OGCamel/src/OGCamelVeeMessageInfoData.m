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
	CamelVeeMessageInfoData* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_message_info_data_new([subfolderData castedGObject], [origMessageUid UTF8String]), CamelVeeMessageInfoData, CamelVeeMessageInfoData);

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
	CamelVeeSubfolderData* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_message_info_data_get_subfolder_data([self castedGObject]), CamelVeeSubfolderData, CamelVeeSubfolderData);

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