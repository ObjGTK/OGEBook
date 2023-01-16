/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

@class OGCamelSettings;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceCamel : OGESourceExtension
{

}

/**
 * Functions
 */

/**
 * Generates a custom #ESourceCamel subtype for @protocol.  Instances of the
 * new subtype will contain a #CamelSettings instance of type @settings_type.
 * 
 * This function is called as part of e_source_camel_register_types() and
 * should not be called explicitly, except by some groupware packages that
 * need to share package-specific settings across their mail, calendar and
 * address book components.  In that case the groupware package may choose
 * to subclass #CamelSettings rather than #ESourceExtension since libcamel
 * is the lowest common denominator across all components.  This function
 * provides a way for the calendar and address book components of such a
 * package to generate an #ESourceCamel subtype for its #CamelSettings
 * subtype without having to load all available #CamelProvider modules.
 *
 * @param protocol a #CamelProvider protocol
 * @param settingsType a subtype of #CamelSettings
 * @return the #GType of the generated #ESourceCamel subtype
 */
+ (GType)generateSubtypeWithProtocol:(OFString*)protocol settingsType:(GType)settingsType;

/**
 * Returns the extension name for the #ESourceCamel subtype for @protocol.
 * The extension name can then be passed to e_source_get_extension() to
 * obtain an instance of the #ESourceCamel subtype.
 * 
 * For example, given a protocol named "imap" the function would return
 * "Imap Backend".
 *
 * @param protocol a #CamelProvider protocol
 * @return the #ESourceCamel extension name for @protocol
 */
+ (OFString*)extensionName:(OFString*)protocol;

/**
 * Returns the #GType name of the registered #ESourceCamel subtype for
 * @protocol.
 * 
 * For example, given a protocol named "imap" the function would return
 * "ESourceCamelImap".
 *
 * @param protocol a #CamelProvider protocol
 * @return the #ESourceCamel type name for @protocol
 */
+ (OFString*)typeName:(OFString*)protocol;

/**
 * Creates and registers subclasses of #ESourceCamel for each available
 * #CamelProvider.  This function should be called once during application
 * or library initialization.
 *
 */
+ (void)registerTypes;

/**
 * Methods
 */

- (ESourceCamel*)SOURCECAMEL;

/**
 * Returns @extension's #ESourceCamel:settings instance, pre-configured
 * from the #ESource to which @extension belongs.  Changes to the #ESource
 * will automatically propagate to the #ESourceCamel:settings instance and
 * vice versa.
 * 
 * This is essentially the glue that binds #ESource to #CamelService.
 * See e_source_camel_configure_service().
 *
 * @return a configured #CamelSettings instance
 */
- (OGCamelSettings*)settings;

@end