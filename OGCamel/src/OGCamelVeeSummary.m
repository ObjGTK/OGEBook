/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeSummary.h"

#import "OGCamelFolder.h"
#import "OGCamelVeeMessageInfo.h"
#import "OGCamelVeeMessageInfoData.h"

@implementation OGCamelVeeSummary

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_VEE_SUMMARY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)veeSummary:(OGCamelFolder*)parent
{
	CamelVeeSummary* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_summary_new([parent castedGObject]), CamelVeeSummary, CamelVeeSummary);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelVeeSummary* wrapperObject;
	@try {
		wrapperObject = [[OGCamelVeeSummary alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelVeeSummary*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelVeeSummary, CamelVeeSummary);
}

- (OGCamelVeeMessageInfo*)add:(OGCamelVeeMessageInfoData*)miData
{
	CamelVeeMessageInfo* gobjectValue = camel_vee_summary_add([self castedGObject], [miData castedGObject]);

	OGCamelVeeMessageInfo* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GHashTable*)uidsForSubfolder:(OGCamelFolder*)subfolder
{
	GHashTable* returnValue = (GHashTable*)camel_vee_summary_get_uids_for_subfolder([self castedGObject], [subfolder castedGObject]);

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