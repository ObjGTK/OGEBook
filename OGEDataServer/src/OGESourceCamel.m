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
	return E_SOURCE_CAMEL([self gObject]);
}

- (OGCamelSettings*)settings
{
	CamelSettings* gobjectValue = CAMEL_SETTINGS(e_source_camel_get_settings([self castedGObject]));

	OGCamelSettings* returnValue = [OGCamelSettings wrapperFor:gobjectValue];
	return returnValue;
}


@end