/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceRefresh.h"

@implementation OGESourceRefresh

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_REFRESH;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceRefresh*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceRefresh, ESourceRefresh);
}

- (bool)enabled
{
	bool returnValue = (bool)e_source_refresh_get_enabled([self castedGObject]);

	return returnValue;
}

- (bool)enabledOnMeteredNetwork
{
	bool returnValue = (bool)e_source_refresh_get_enabled_on_metered_network([self castedGObject]);

	return returnValue;
}

- (guint)intervalMinutes
{
	guint returnValue = (guint)e_source_refresh_get_interval_minutes([self castedGObject]);

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