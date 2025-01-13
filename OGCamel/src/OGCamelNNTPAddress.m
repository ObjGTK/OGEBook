/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelNNTPAddress.h"

@implementation OGCamelNNTPAddress

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_NNTP_ADDRESS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)nNTPAddress
{
	CamelNNTPAddress* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_nntp_address_new(), CamelNNTPAddress, CamelNNTPAddress);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelNNTPAddress* wrapperObject;
	@try {
		wrapperObject = [[OGCamelNNTPAddress alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelNNTPAddress*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelNNTPAddress, CamelNNTPAddress);
}

- (gint)addWithName:(OFString*)name
{
	gint returnValue = (gint)camel_nntp_address_add([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (bool)getWithIndex:(gint)index namep:(const gchar**)namep
{
	bool returnValue = (bool)camel_nntp_address_get([self castedGObject], index, namep);

	return returnValue;
}


@end