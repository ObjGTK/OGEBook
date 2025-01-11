/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelAddress.h"

@implementation OGCamelAddress

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_ADDRESS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)address
{
	CamelAddress* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_address_new(), CamelAddress, CamelAddress);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelAddress* wrapperObject;
	@try {
		wrapperObject = [[OGCamelAddress alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelAddress*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelAddress, CamelAddress);
}

- (gint)cat:(OGCamelAddress*)source
{
	gint returnValue = (gint)camel_address_cat([self castedGObject], [source castedGObject]);

	return returnValue;
}

- (gint)copy:(OGCamelAddress*)source
{
	gint returnValue = (gint)camel_address_copy([self castedGObject], [source castedGObject]);

	return returnValue;
}

- (gint)decode:(OFString*)raw
{
	gint returnValue = (gint)camel_address_decode([self castedGObject], [raw UTF8String]);

	return returnValue;
}

- (OFString*)encode
{
	gchar* gobjectValue = camel_address_encode([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)format
{
	gchar* gobjectValue = camel_address_format([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (gint)length
{
	gint returnValue = (gint)camel_address_length([self castedGObject]);

	return returnValue;
}

- (OGCamelAddress*)newClone
{
	CamelAddress* gobjectValue = camel_address_new_clone([self castedGObject]);

	OGCamelAddress* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)remove:(gint)index
{
	camel_address_remove([self castedGObject], index);
}

- (gint)unformat:(OFString*)raw
{
	gint returnValue = (gint)camel_address_unformat([self castedGObject], [raw UTF8String]);

	return returnValue;
}


@end