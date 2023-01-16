/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGENetworkMonitor.h"

@implementation OGENetworkMonitor

+ (GNetworkMonitor*)default
{
	return e_network_monitor_get_default();
}

- (ENetworkMonitor*)NETWORKMONITOR
{
	return E_NETWORK_MONITOR([self GOBJECT]);
}

- (OFString*)dupGioName
{
	return [OFString stringWithUTF8String:e_network_monitor_dup_gio_name([self NETWORKMONITOR])];
}

- (GSList*)listGioNames
{
	return e_network_monitor_list_gio_names([self NETWORKMONITOR]);
}

- (void)setGioName:(OFString*)gioName
{
	e_network_monitor_set_gio_name([self NETWORKMONITOR], [gioName UTF8String]);
}


@end