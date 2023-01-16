/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelLocalSettings.h"

@implementation OGCamelLocalSettings

- (CamelLocalSettings*)LOCALSETTINGS
{
	return CAMEL_LOCAL_SETTINGS([self GOBJECT]);
}

- (OFString*)dupPath
{
	return [OFString stringWithUTF8String:camel_local_settings_dup_path([self LOCALSETTINGS])];
}

- (bool)filterAll
{
	return camel_local_settings_get_filter_all([self LOCALSETTINGS]);
}

- (bool)filterJunk
{
	return camel_local_settings_get_filter_junk([self LOCALSETTINGS]);
}

- (OFString*)path
{
	return [OFString stringWithUTF8String:camel_local_settings_get_path([self LOCALSETTINGS])];
}

- (void)setFilterAll:(bool)filterAll
{
	camel_local_settings_set_filter_all([self LOCALSETTINGS], filterAll);
}

- (void)setFilterJunk:(bool)filterJunk
{
	camel_local_settings_set_filter_junk([self LOCALSETTINGS], filterJunk);
}

- (void)setPath:(OFString*)path
{
	camel_local_settings_set_path([self LOCALSETTINGS], [path UTF8String]);
}


@end