/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceRefresh.h"

@implementation OGESourceRefresh

- (ESourceRefresh*)SOURCEREFRESH
{
	return E_SOURCE_REFRESH([self GOBJECT]);
}

- (bool)enabled
{
	return e_source_refresh_get_enabled([self SOURCEREFRESH]);
}

- (guint)intervalMinutes
{
	return e_source_refresh_get_interval_minutes([self SOURCEREFRESH]);
}

- (void)setEnabled:(bool)enabled
{
	e_source_refresh_set_enabled([self SOURCEREFRESH], enabled);
}

- (void)setIntervalMinutes:(guint)intervalMinutes
{
	e_source_refresh_set_interval_minutes([self SOURCEREFRESH], intervalMinutes);
}


@end