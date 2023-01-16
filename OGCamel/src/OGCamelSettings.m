/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSettings.h"

@implementation OGCamelSettings

- (CamelSettings*)SETTINGS
{
	return CAMEL_SETTINGS([self GOBJECT]);
}

- (OGCamelSettings*)clone
{
	return [[[OGCamelSettings alloc] initWithGObject:(GObject*)camel_settings_clone([self SETTINGS])] autorelease];
}

- (bool)equal:(OGCamelSettings*)settingsB
{
	return camel_settings_equal([self SETTINGS], [settingsB SETTINGS]);
}


@end