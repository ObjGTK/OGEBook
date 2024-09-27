/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCamel.h"

#import <OGCamel/OGCamelSettings.h>

@implementation OGESourceCamel

+ (GType)generateSubtypeWithProtocol:(OFString*)protocol settingsType:(GType)settingsType
{
	GType returnValue = e_source_camel_generate_subtype([protocol UTF8String], settingsType);

	return returnValue;
}

+ (OFString*)extensionName:(OFString*)protocol
{
	const gchar* gobjectValue = e_source_camel_get_extension_name([protocol UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (OFString*)typeName:(OFString*)protocol
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
	CamelSettings* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_source_camel_get_settings([self castedGObject]), CamelSettings, CamelSettings);

	OGCamelSettings* returnValue = [OGCamelSettings withGObject:gobjectValue];
	return returnValue;
}


@end