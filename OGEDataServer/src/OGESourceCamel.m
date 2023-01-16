/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCamel.h"

#import <OGCamel/OGCamelSettings.h>

@implementation OGESourceCamel

+ (GType)generateSubtypeWithProtocol:(OFString*)protocol settingsType:(GType)settingsType
{
	return e_source_camel_generate_subtype([protocol UTF8String], settingsType);
}

+ (OFString*)extensionName:(OFString*)protocol
{
	return [OFString stringWithUTF8String:e_source_camel_get_extension_name([protocol UTF8String])];
}

+ (OFString*)typeName:(OFString*)protocol
{
	return [OFString stringWithUTF8String:e_source_camel_get_type_name([protocol UTF8String])];
}

+ (void)registerTypes
{
	e_source_camel_register_types();
}

- (ESourceCamel*)SOURCECAMEL
{
	return E_SOURCE_CAMEL([self GOBJECT]);
}

- (OGCamelSettings*)settings
{
	return [[[OGCamelSettings alloc] initWithGObject:(GObject*)e_source_camel_get_settings([self SOURCECAMEL])] autorelease];
}


@end