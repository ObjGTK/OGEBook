/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelOfflineSettings.h"

@implementation OGCamelOfflineSettings

- (CamelOfflineSettings*)OFFLINESETTINGS
{
	return CAMEL_OFFLINE_SETTINGS([self GOBJECT]);
}

- (bool)limitByAge
{
	return camel_offline_settings_get_limit_by_age([self OFFLINESETTINGS]);
}

- (CamelTimeUnit)limitUnit
{
	return camel_offline_settings_get_limit_unit([self OFFLINESETTINGS]);
}

- (gint)limitValue
{
	return camel_offline_settings_get_limit_value([self OFFLINESETTINGS]);
}

- (bool)staySynchronized
{
	return camel_offline_settings_get_stay_synchronized([self OFFLINESETTINGS]);
}

- (gint)storeChangesInterval
{
	return camel_offline_settings_get_store_changes_interval([self OFFLINESETTINGS]);
}

- (void)setLimitByAge:(bool)limitByAge
{
	camel_offline_settings_set_limit_by_age([self OFFLINESETTINGS], limitByAge);
}

- (void)setLimitUnit:(CamelTimeUnit)limitUnit
{
	camel_offline_settings_set_limit_unit([self OFFLINESETTINGS], limitUnit);
}

- (void)setLimitValue:(bool)limitValue
{
	camel_offline_settings_set_limit_value([self OFFLINESETTINGS], limitValue);
}

- (void)setStaySynchronized:(bool)staySynchronized
{
	camel_offline_settings_set_stay_synchronized([self OFFLINESETTINGS], staySynchronized);
}

- (void)setStoreChangesInterval:(gint)interval
{
	camel_offline_settings_set_store_changes_interval([self OFFLINESETTINGS], interval);
}


@end