/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCamel.h"

#import <OGCamel/OGCamelSettings.h>

@implementation OGESourceCamel

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_CAMEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GType)generateSubtypeWithProtocol:(OFString*)protocol settingsType:(GType)settingsType
{
	GType returnValue = (GType)e_source_camel_generate_subtype([protocol UTF8String], settingsType);

	return returnValue;
}

+ (OFString*)extensionNameWithProtocol:(OFString*)protocol
{
	const gchar* gobjectValue = e_source_camel_get_extension_name([protocol UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (OFString*)typeNameWithProtocol:(OFString*)protocol
{
	const gchar* gobjectValue = e_source_camel_get_type_name([protocol UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (void)registerTypes
{
	e_source_camel_register_types();
}

- (ESourceCamel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceCamel, ESourceCamel);
}

- (OGCamelSettings*)settings
{
	CamelSettings* gobjectValue = e_source_camel_get_settings([self castedGObject]);

	OGCamelSettings* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end