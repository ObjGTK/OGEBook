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
	CamelVeeSubfolderData* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_subfolder_data_new([folder castedGObject]), CamelVeeSubfolderData, CamelVeeSubfolderData);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelVeeSubfolderData, CamelVeeSubfolderData);
}

- (OGCamelFolder*)folder
{
	CamelFolder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_subfolder_data_get_folder([self castedGObject]), CamelFolder, CamelFolder);

	OGCamelFolder* returnValue = [OGCamelFolder withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)folderId
{
	const gchar* gobjectValue = camel_vee_subfolder_data_get_folder_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end