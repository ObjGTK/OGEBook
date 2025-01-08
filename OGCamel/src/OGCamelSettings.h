/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGCamelSettings : OGObject
{

}


/**
 * Methods
 */

- (CamelSettings*)castedGObject;

/**
 * Creates a copy of @settings, such that passing @settings and the
 * copied instance to camel_settings_equal() would return %TRUE.
 * 
 * By default, this creates a new settings instance with the same #GType
 * as @settings, and copies all #GObject property values from @settings
 * to the new instance.
 *
 * @return a newly-created copy of @settings
 */
- (OGCamelSettings*)clone;

/**
 * Returns %TRUE if @settings_a and @settings_b are equal.
 * 
 * By default, equality requires both instances to have the same #GType
 * with the same set of #GObject properties, and each property value in
 * @settings_a is equal to the corresponding value in @settings_b.
 *
 * @param settingsB another #CamelSettings
 * @return %TRUE if @settings_a and @settings_b are equal
 */
- (bool)equal:(OGCamelSettings*)settingsB;

@end