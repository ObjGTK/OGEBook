/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMedium.h"

@implementation OGCamelMedium

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MEDIUM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelMedium*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMedium, CamelMedium);
}

- (void)addHeaderWithName:(OFString*)name value:(OFString*)value
{
	camel_medium_add_header([self castedGObject], [name UTF8String], [value UTF8String]);
}

- (CamelNameValueArray*)dupHeaders
{
	CamelNameValueArray* returnValue = (CamelNameValueArray*)camel_medium_dup_headers([self castedGObject]);

	return returnValue;
}

- (OGCamelDataWrapper*)content
{
	CamelDataWrapper* gobjectValue = camel_medium_get_content([self castedGObject]);

	OGCamelDataWrapper* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)headerWithName:(OFString*)name
{
	const gchar* gobjectValue = camel_medium_get_header([self castedGObject], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const CamelNameValueArray*)headers
{
	const CamelNameValueArray* returnValue = (const CamelNameValueArray*)camel_medium_get_headers([self castedGObject]);

	return returnValue;
}

- (void)removeHeaderWithName:(OFString*)name
{
	camel_medium_remove_header([self castedGObject], [name UTF8String]);
}

- (void)setContent:(OGCamelDataWrapper*)content
{
	camel_medium_set_content([self castedGObject], [content castedGObject]);
}

- (void)setHeaderWithName:(OFString*)name value:(OFString*)value
{
	camel_medium_set_header([self castedGObject], [name UTF8String], [value UTF8String]);
}


@end