/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelOfflineSettings.h"

@implementation OGCamelOfflineSettings

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_OFFLINE_SETTINGS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelOfflineSettings*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelOfflineSettings, CamelOfflineSettings);
}

- (bool)limitByAge
{
	bool returnValue = (bool)camel_offline_settings_get_limit_by_age([self castedGObject]);

	return returnValue;
}

- (CamelTimeUnit)limitUnit
{
	CamelTimeUnit returnValue = (CamelTimeUnit)camel_offline_settings_get_limit_unit([self castedGObject]);

	return returnValue;
}

- (gint)limitValue
{
	gint returnValue = (gint)camel_offline_settings_get_limit_value([self castedGObject]);

	return returnValue;
}

- (bool)staySynchronized
{
	bool returnValue = (bool)camel_offline_settings_get_stay_synchronized([self castedGObject]);

	return returnValue;
}

- (gint)storeChangesInterval
{
	gint returnValue = (gint)camel_offline_settings_get_store_changes_interval([self castedGObject]);

	return returnValue;
}

- (void)setLimitByAge:(bool)limitByAge
{
	camel_offline_settings_set_limit_by_age([self castedGObject], limitByAge);
}

- (void)setLimitUnit:(CamelTimeUnit)limitUnit
{
	camel_offline_settings_set_limit_unit([self castedGObject], limitUnit);
}

- (void)setLimitValue:(bool)limitValue
{
	camel_offline_settings_set_limit_value([self castedGObject], limitValue);
}

- (void)setStaySynchronized:(bool)staySynchronized
{
	camel_offline_settings_set_stay_synchronized([self castedGObject], staySynchronized);
}

- (void)setStoreChangesInterval:(gint)interval
{
	camel_offline_settings_set_store_changes_interval([self castedGObject], interval);
}


@end