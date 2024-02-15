/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelAddress.h"

@implementation OGCamelAddress

- (instancetype)init
{
	CamelAddress* gobjectValue = CAMEL_ADDRESS(camel_address_new());

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

- (CamelAddress*)castedGObject
{
	return CAMEL_ADDRESS([self gObject]);
}

- (gint)cat:(OGCamelAddress*)source
{
	gint returnValue = camel_address_cat([self castedGObject], [source castedGObject]);

	return returnValue;
}

- (gint)copy:(OGCamelAddress*)source
{
	gint returnValue = camel_address_copy([self castedGObject], [source castedGObject]);

	return returnValue;
}

- (gint)decode:(OFString*)raw
{
	gint returnValue = camel_address_decode([self castedGObject], [raw UTF8String]);

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
	gint returnValue = camel_address_length([self castedGObject]);

	return returnValue;
}

- (OGCamelAddress*)newClone
{
	CamelAddress* gobjectValue = CAMEL_ADDRESS(camel_address_new_clone([self castedGObject]));

	OGCamelAddress* returnValue = [OGCamelAddress withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)remove:(gint)index
{
	camel_address_remove([self castedGObject], index);
}

- (gint)unformat:(OFString*)raw
{
	gint returnValue = camel_address_unformat([self castedGObject], [raw UTF8String]);

	return returnValue;
}


@end