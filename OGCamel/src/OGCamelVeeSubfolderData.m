/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeSubfolderData.h"

#import "OGCamelFolder.h"

@implementation OGCamelVeeSubfolderData

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_VEE_SUBFOLDER_DATA;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)veeSubfolderDataWithFolder:(OGCamelFolder*)folder
{
	CamelVeeSubfolderData* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_subfolder_data_new([folder castedGObject]), CamelVeeSubfolderData, CamelVeeSubfolderData);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelVeeSubfolderData* wrapperObject;
	@try {
		wrapperObject = [[OGCamelVeeSubfolderData alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelVeeSubfolderData*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelVeeSubfolderData, CamelVeeSubfolderData);
}

- (OGCamelFolder*)folder
{
	CamelFolder* gobjectValue = camel_vee_subfolder_data_get_folder([self castedGObject]);

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)folderId
{
	const gchar* gobjectValue = camel_vee_subfolder_data_get_folder_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end