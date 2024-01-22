/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeSubfolderData.h"

#import "OGCamelFolder.h"

@implementation OGCamelVeeSubfolderData

- (instancetype)init:(OGCamelFolder*)folder
{
	CamelVeeSubfolderData* gobjectValue = CAMEL_VEE_SUBFOLDER_DATA(camel_vee_subfolder_data_new([folder castedGObject]));

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

- (CamelVeeSubfolderData*)castedGObject
{
	return CAMEL_VEE_SUBFOLDER_DATA([self gObject]);
}

- (OGCamelFolder*)folder
{
	CamelFolder* gobjectValue = CAMEL_FOLDER(camel_vee_subfolder_data_get_folder([self castedGObject]));

	OGCamelFolder* returnValue = [OGCamelFolder wrapperFor:gobjectValue];
	return returnValue;
}

- (OFString*)folderId
{
	const gchar* gobjectValue = camel_vee_subfolder_data_get_folder_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end