/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceRefresh.h"

@implementation OGESourceRefresh

- (ESourceRefresh*)castedGObject
{
	return E_SOURCE_REFRESH([self gObject]);
}

- (bool)enabled
{
	bool returnValue = e_source_refresh_get_enabled([self castedGObject]);

	return returnValue;
}

- (bool)enabledOnMeteredNetwork
{
	bool returnValue = e_source_refresh_get_enabled_on_metered_network([self castedGObject]);

	return returnValue;
}

- (guint)intervalMinutes
{
	guint returnValue = e_source_refresh_get_interval_minutes([self castedGObject]);

	return returnValue;
}

- (void)setEnabled:(bool)enabled
{
	e_source_refresh_set_enabled([self castedGObject], enabled);
}

- (void)setEnabledOnMeteredNetwork:(bool)enabled
{
	e_source_refresh_set_enabled_on_metered_network([self castedGObject], enabled);
}

- (void)setIntervalMinutes:(guint)intervalMinutes
{
	e_source_refresh_set_interval_minutes([self castedGObject], intervalMinutes);
}


@end